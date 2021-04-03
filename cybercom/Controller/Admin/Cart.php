<?php 
namespace Controller\Admin;

class Cart extends \Controller\Core\Admin
{

	public function indexAction()
	{
		$productGrid = \Mage::getBlock('Block\Admin\Cart\Index')->toHtml();
		$response = [
				'status' => 'success',
				'message' => 'cart displayed',
				'element'=> [
					[
					'selector' => '#moduleGrid',
					'html' => $productGrid
					]
				]
			];

			header("Content-type:application/json");
			echo json_encode($response);
		
	}

	public function gridAction()
	{
		try {

			$grid = \Mage::getBlock('Block\Admin\Cart\Products')->toHtml();
			$response = [
				'status' => 'success',
				'message' => 'cart displayed',
				'element'=> [
					[
					'selector' => '#productContent',
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

	
	public function selectCustomerAction()
	{
		$id = $this->getRequest()->getPost('customerId');
		$cart = \Mage::getModel('Model\Cart');
		$cart = $cart->load($id, 'customerId');
		if (!$cart) {
			$cart = \Mage::getModel('Model\Cart');
			$cart->customerId = $id;
			$cart->save();
		}

		$session = \Mage::getModel('Model\Admin\Session');
		$session->cartId = $cart->cartId;
		$grid = \Mage::getBlock('Block\Admin\Cart\Products')->toHtml();
		$address = \Mage::getBlock('Block\Admin\Cart\Address')->toHtml();
		$cart = \Mage::getBlock('Block\Admin\Cart\Cart')->toHtml();
		$shipping = \Mage::getBlock('Block\Admin\Cart\Shipping')->toHtml();
		$payment = \Mage::getBlock('Block\Admin\Cart\Payment')->toHtml();
		$cartDetails = \Mage::getBlock('Block\Admin\Cart\cartDetails')->toHtml();
		$response = [
			'status' => 'success',
			'message' => 'cart displayed',
			'element'=> [
				[
					'selector' => '#productContent',
					'html' => $grid
				],
				[
					'selector' => '#addressContent',
					'html' => $address
				],	
				[
					'selector' => '#cartContent',
					'html' => $cart
				],
				[
					'selector' => '#shippingContent',
					'html' => $shipping
				],
				[
					'selector' => '#paymentContent',
					'html' => $payment
				],
				[
					'selector' => '#cartDetails',
					'html' => $cartDetails
				]
			]
		];
		header("Content-type:application/json");
		echo json_encode($response);
	}

	public function AddToCartAction()
	{
		try {

			$productId = $this->getRequest()->getGet('id');
			$product = \Mage::getModel('Model\Product')->load($productId);
			$cartItem = \Mage::getModel('Model\Cart\Item');
			$cartId = \Mage::getModel('Model\Admin\Session')->cartId;
			$query = "SELECT * FROM `{$cartItem->getTableName()}` WHERE `productId` = '{$productId}' AND `cartId` = '{$cartId}'";
			
			$cartItem = $cartItem->fetchRow($query);

			if (!$cartItem) {
				$cartItem = \Mage::getModel('Model\Cart\Item');
				$cartItem->cartId = $cartId;
				$cartItem->productId = $product->productId;
				$cartItem->basePrice = $product->price;
				$cartItem->price = $product->price;
				$cartItem->quantity = 1;
				$cartItem->discount = $product->discount;
				$cartItem->createdAt = date("Y-m-d H:i:s");
			
			} else {
			
				$cartItem->quantity = $cartItem->quantity + 1;
				$price = $cartItem->price * $cartItem->quantity;
				$cartItem->price = $price;
			}
			
			$cartItem->save();
			$this->updateCartTotal();

		} catch (\Exception $e) {
			$this->getMessage()->setFailure($e->getMessage());
		}

		$cart = \Mage::getBlock('Block\Admin\Cart\Cart')->toHtml();
		$cartDetails = \Mage::getBlock('Block\Admin\Cart\CartDetails')->toHtml();
		$response = [
			'status' => 'success',
			'message' => 'cart displayed',
			'element'=> [	
				[
					'selector' => '#cartContent',
					'html' => $cart
				],
				[
					'selector' => '#cartDetails',
					'html' => $cartDetails
				]
			]
		];
		header("Content-type:application/json");
		echo json_encode($response);
	}

	public function deleteAction()
	{
		try {
			$itemId = $this->getRequest()->getGet('id');
			$cartItem = \Mage::getModel('Model\Cart\Item');
			$cartItem = $cartItem->load($itemId);
			$cartItem->delete();
			$this->updateCartTotal();
		} catch (\Exception $e) {
			$this->getMessage()->setFailure($e->getMessage());		
		}
		$cart = \Mage::getBlock('Block\Admin\Cart\Cart')->toHtml();
		$cartDetails = \Mage::getBlock('Block\Admin\Cart\cartDetails')->toHtml();
		$response = [
			'status' => 'success',
			'message' => 'cart displayed',
			'element'=> [	
				[
					'selector' => '#cartContent',
					'html' => $cart
				],
				[
					'selector' => '#cartDetails',
					'html' => $cartDetails
				]
			]
		];
		header("Content-type:application/json");
		echo json_encode($response);
	}

	public function updateAction()
	{
		try {
			$quantities = $this->getRequest()->getPost('quantity');
			foreach ($quantities as $itemId => $quantity) {
				$cartItem = \Mage::getModel('Model\Cart\Item');
				$cartItem = $cartItem->load($itemId);
				$cartItem->quantity = $quantity;
				$cartItem->price = $cartItem->basePrice * $quantity;
				$cartItem->save();
				$this->updateCartTotal();
			}

			$price = $this->getRequest()->getPost('price');
			foreach ($price as $itemId => $price) {
				$cartItem = \Mage::getModel('Model\Cart\Item');
				$cartItem = $cartItem->load($itemId);
				$cartItem->price = $price;
				$cartItem->save();
				$this->updateCartTotal();
			}
		} catch (\Exception $e) {
			$this->getMessage()->setFailure($e->getMessage());		
		}
		$cart = \Mage::getBlock('Block\Admin\Cart\Cart')->toHtml();
		$cartDetails = \Mage::getBlock('Block\Admin\Cart\cartDetails')->toHtml();
		$response = [
			'status' => 'success',
			'message' => 'cart displayed',
			'element'=> [	
				[
					'selector' => '#cartContent',
					'html' => $cart
				],
				[
					'selector' => '#cartDetails',
					'html' => $cartDetails
				]
			]
		];
		header("Content-type:application/json");
		echo json_encode($response);
	}

	public function updateCartTotal()
	{
		$cartId = \Mage::getModel('Model\Admin\Session')->cartId;
		$cart = \Mage::getModel('Model\Cart')->load($cartId);
		$total = 0;

		if ($cart->getCartItems()->count()) {
			foreach ($cart->getCartItems()->getData() as $item) {
				$total = $total + $item->price;
			}	
		}

		$cart = \Mage::getModel('Model\Cart');
		$cart->total = $total;
		$cart->cartId = $cartId;
		$cart->save();
	}

	public function updateAddressAction()
	{
		$cartId = \Mage::getModel('Model\Admin\Session')->cartId;
		if ($this->getRequest()->getGet('type') == "billing") {
			$billingAddressData = $this->getRequest()->getPost('billing');
			$billingAddress = \Mage::getModel('Model\Cart')->load($cartId)->getBillingAddress();
			$billingAddress->setData($billingAddressData);
			$billingAddress->save();
			if ($this->getRequest()->getPost('billingAddressBook')) {
				$customerAddressBook = \Mage::getModel('Model\Cart')
									->load($cartId,'cartId')
									->getCustomer()
									->getBillingAddress();
				$customerAddressBook->setData($billingAddressData);
				$customerAddressBook->save();					
			}

		} else {
			
			if ($this->getRequest()->getPost('sameAsBilling')) {
				$shippingAddressData = $this->getRequest()->getPost('billing');
			} else {
				$shippingAddressData = $this->getRequest()->getPost('shipping');
			}
			
			$shippingAddress = \Mage::getModel('Model\Cart')->load($cartId)->getShippingAddress();
			$shippingAddress->setData($shippingAddressData);
			$shippingAddress->sameAsBilling = 1;
			$shippingAddress->save();
			if ($this->getRequest()->getPost('shippingAddressBook')) {
				$customerAddressBook = \Mage::getModel('Model\Cart')
									->load($cartId,'cartId')
									->getCustomer()
									->getShippingAddress();
				$customerAddressBook->setData($shippingAddressData);
				$customerAddressBook->save();					
			}
		}
		$address = \Mage::getBlock('Block\Admin\Cart\Address')->toHtml();
		$response = [
			'status' => 'success',
			'message' => 'cart displayed',
			'element'=> [
				[
					'selector' => '#addressContent',
					'html' => $address
				]
			]
		];
		header("Content-type:application/json");
		echo json_encode($response);
	}

	public function updateShippingAction()
	{
		$methodId = $this->getRequest()->getPost('shippingMethod');

		$cartId = \Mage::getModel('Model\Admin\Session')->cartId;
		$cart = \Mage::getModel('Model\Cart');
		$cartClone = clone $cart;
		$cart->cartId = $cartId;
		$cart->shippingMethodId = $methodId;
		$cart->save();
		$cartClone->cartId = $cartId;

		$cartClone->shippingAmount = $cart->getShippingMethod()->amount;
		$cartClone->save();

		$shipping = \Mage::getBlock('Block\Admin\Cart\Shipping')->toHtml();
		$cartDetails = \Mage::getBlock('Block\Admin\Cart\cartDetails')->toHtml();
		$response = [
			'status' => 'success',
			'message' => 'cart displayed',
			'element'=> [
				[
					'selector' => '#shippingContent',
					'html' => $shipping
				],
				[
					'selector' => '#cartDetails',
					'html' => $cartDetails
				]
			]
		];
		header("Content-type:application/json");
		echo json_encode($response);
	}

	public function updatePaymentAction()
	{
		$methodId = $this->getRequest()->getPost('paymentMethod');
		$cartId = \Mage::getModel('Model\Admin\Session')->cartId;
		$cart = \Mage::getModel('Model\Cart');
		$cart->cartId = $cartId;
		$cart->paymentMethodId = $methodId;
		$cart->save();

		$payment = \Mage::getBlock('Block\Admin\Cart\Payment')->toHtml();
		$response = [
			'status' => 'success',
			'message' => 'cart displayed',
			'element'=> [
				[
					'selector' => '#paymentContent',
					'html' => $payment
				]
			]
		];
		header("Content-type:application/json");
		echo json_encode($response);
	}


}
?>