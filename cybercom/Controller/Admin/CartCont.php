<?php
namespace Controller\Admin;

class CartCont extends \Controller\Core\Admin
{
	
	public function addToCartAction()
	{
		try{
			$productId = $this->getRequest()->getGet('productId');

			$product = \Mage::getModel('Model\Product')->load($productId);
			if(!$product){
				$this->getMessage()->setFailure('Invalid Id');
			}

			$cart = $this->getCart();
			$cart->addItemToCart($product,1,true);

			$this->getMessage()->setSuccess('Item Successfully add to cart');

            $gridHtml = \Mage::getBlock('Block\Admin\CartCont\Grid');
            $cart = $this->getCart();
            $gridHtml->setCart($cart);
            $gridHtml = $gridHtml->toHtml();
            $response = [
                'status' => 'success',
                'message' => 'yess finish',
                'element' => [
                    [
                        'selector' => '#moduleGrid',
                        'html' => $gridHtml
                    ]
                ]
            ];
            header("Content-type: application/json; charset=utf-8");
            echo json_encode($response); 

		}catch (Exception $e){
			$this->getMessage()->setFailure($e->getMessage());
		}
	}

	public function getCart($customerId = null)
	{
		$session = \Mage::getModel('Model\Admin\Session');
		
		if($customerId){
			$session->customerId = $customerId;
		}

		$cart = \Mage::getModel('Model\CartCont');
		$query = "SELECT * FROM `{$cart->getTableName()}` WHERE `customerId` = '{$session->customerId}'";

		$cart = $cart->fetchRow($query);

		if($cart){
			return $cart;
		}
			$cart = \Mage::getModel('Model\CartCont');
			$cart->customerId = $session->customerId;
			$cart->createdAt = date('Y-m-d H:i:s');
			$cart->save();
			return $cart;
		
	}


	    public function updateAction(){
        try{
            $quantities = $this->getRequest()->getPost('quantity');

            $cart = $this->getCart();

            foreach($quantities as $cartItemId => $quantity){
                $cartItem = \Mage::getModel('Model\Cart\Item')->load($cartItemId);
                $cartItem->quantity = $quantity;
                $cartItem->save();
            }
            $this->getMessage()->setSuccess('Item update Successfully');

            $gridHtml = \Mage::getBlock('Block\Admin\CartCont\Grid');
            $cart = $this->getCart();
            $gridHtml->setCart($cart);
            $gridHtml = $gridHtml->toHtml();
            $response = [
                'status' => 'success',
                'message' => 'yess finish',
                'element' => [
                    [
                        'selector' => '#moduleGrid',
                        'html' => $gridHtml
                    ]
                ]
            ];
            header("Content-type: application/json; charset=utf-8");
            echo json_encode($response);  

        }catch(\Exception $e){
            $this->getMessage()->setFailure($e->getMessage());
        }
    }

    public function selectCustomerAction(){
        $customerId = $this->getRequest()->getPost('customer');
        $this->getCart($customerId);
        $gridHtml = \Mage::getBlock('Block\Admin\CartCont\Grid');
        $cart = $this->getCart();
        $gridHtml->setCart($cart);
        $gridHtml = $gridHtml->toHtml();
        $response = [
            'status' => 'success',
            'message' => 'yess finish',
            'element' => [
                [
                    'selector' => '#moduleGrid',
                    'html' => $gridHtml
                ]
            ]
        ];
        header("Content-type: application/json; charset=utf-8");
        echo json_encode($response);  

    }
}

?>