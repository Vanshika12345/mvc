<?php

namespace Controller\Admin;

class Order extends \Controller\Core\Admin
{

	public function indexAction()
	{
		$layout = \Mage::getBlock('Block\Core\Layout');
		echo $this->renderLayout();
	}

	public function gridAction()
	{
		$grid = \Mage::getBlock('Block\Admin\Order\Grid')->toHtml();
		$response = [
			'status' => 'success',
			'message' => 'order displayed',
			'element' => [
				[
					'selector' => '#moduleGrid',
					'html' => $grid
				]
			]
		];

		header('Content-type: application/json');
		echo json_encode($response);
	}

	public function placeOrderAction()
	{
		$cart = \Mage::getModel('Model\Cart')->load(\Mage::getModel('Model\Admin\Session')->cartId);
		$order_details = \Mage::getModel('Model\Order');

		
		$order_details->shippingMethodId = $cart->shippingMethodId;
		$order_details->customerId = $cart->customerId;
		$order_details->discount = $cart->discount;
		$order_details->shippingAmount = $cart->shippingAmount;
		$order_details->paymentMethodId = $cart->paymentMethodId;
		$order_details->total = $cart->total;
		$order_details->save();
		/*if(!$cart->delete()){
			$this->getMessage()->setFailure('Id Invalid');
		}*/
		$session = \Mage::getModel('Model\Admin\Session');
		$session->orderId = $order_details->orderId;
		$this->addItems();
		$this->addAddress();

		$order = \Mage::getBlock('Block\Admin\Order\Grid')->toHtml();
		$response = [
			'status' => 'success',
			'message' => 'cart displayed',
			'element'=> [	
				[
					'selector' => '#moduleGrid',
					'html' => $order
				]
			]
		];
		header("Content-type:application/json");
		echo json_encode($response);
	}

	public function addItems()
	{
		$cartId = \Mage::getModel('Model\Admin\Session')->cartId;
		$items = \Mage::getModel('Model\Cart\Item');
		
		$orderId = \Mage::getModel('Model\Admin\Session')->orderId;
		
		$query = "SELECT * FROM {$items->getTableName()} WHERE `cartId` = '{$cartId}'";
		$items = $items->fetchAll($query);
		if($items){
			foreach ($items->getData() as $key => $item) 
			{
				$order_items = \Mage::getModel('Model\Order\Item');
				$order_items->orderId = $orderId;
				$order_items->createdAt = date("Y-m-d H:i:s");
				$order_items->price = $item->price;
				$order_items->discount = $item->discount;
				$order_items->productId = $item->productId;
				$order_items->quantity = $item->quantity;
				$order_items->save();
			}	
				
		}

		/*$items = \Mage::getModel('Model\Cart\Item');
		$query = "DELETE FROM {$items->getTableName()} WHERE `cartId` = '{$cartId}'";
		if(!$items->getAdapter()->delete($query)){
			$this->getMessage()->setFailure('Id Invalid');
		}*/
	}

	public function addAddress()
	{
		$cartId = \Mage::getModel('Model\Admin\Session')->cartId;
		$orderId = \Mage::getModel('Model\Admin\Session')->orderId;
		$cartAddress = \Mage::getModel('Model\Cart\Address');
		$query = "SELECT * FROM {$cartAddress->getTableName()} WHERE `cartId` = '{$cartId}' AND `address_type` = '2'";
		$cartAddress = $cartAddress->fetchRow($query);
		$orderAddress = \Mage::getModel('Model\Order\Address');
		if($cartAddress){
			$orderAddress->orderId = $orderId;
			$orderAddress->address = $cartAddress->address;
			$orderAddress->city = $cartAddress->city;
			$orderAddress->state = $cartAddress->state;
			$orderAddress->country = $cartAddress->country;
			$orderAddress->zipcode = $cartAddress->zipcode;
			$orderAddress->sameAsBilling = $cartAddress->sameAsBilling;
			$orderAddress->address_type = 2;

		}
		$orderAddress->save();
		
		$cartBillingAddress = \Mage::getModel('Model\Cart\Address');
		$query = "SELECT * FROM {$cartBillingAddress->getTableName()} WHERE `cartId` = '{$cartId}' AND `address_type` = '1'";
		$cartBillingAddress = $cartBillingAddress->fetchRow($query);
		$orderBillingAddress = \Mage::getModel('Model\Order\Address');
		if($cartBillingAddress){
			$orderBillingAddress->orderId = $orderId;
			$orderBillingAddress->address = $cartBillingAddress->address;
			$orderBillingAddress->city = $cartBillingAddress->city;
			$orderBillingAddress->state = $cartBillingAddress->state;
			$orderBillingAddress->country = $cartBillingAddress->country;
			$orderBillingAddress->zipcode = $cartBillingAddress->zipcode;
			$orderBillingAddress->sameAsBilling = $cartBillingAddress->sameAsBilling;
			$orderBillingAddress->address_type = 1;

		}

		$orderBillingAddress->save();
		
		/*$address = \Mage::getModel('Model\Cart\Address');
		$query = "DELETE FROM {$items->getTableName()} WHERE `cartId` = '{$cartId}'";
		if(!$address->getAdapter()->delete($query)){
			$this->getMessage()->setFailure('Id Invalid');
		}*/

	}

	public function viewAction()
	{
		try {

			$grid = \Mage::getBlock('Block\Admin\Order\View')->toHtml();
			$response = [
				'status' => 'success',
				'message' => 'cart displayed',
				'element'=> [
					[
					'selector' => '#moduleGrid',
					'html' => $grid
					]
				]
			];

			header("Content-type:application/json");
			echo json_encode($response);
		} catch (\Exception $e) {
			$this->getMessage()->setFailure($e->getMessage());
		}
	}

}

?>