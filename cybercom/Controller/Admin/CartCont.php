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
                $cartItem = \Mage::getModel('Model\CartCont\Item')->load($cartItemId);
                $cartItem->quantity = $quantity;
                $cartItem->save();
                $this->updateCartTotal();
            }

            $price = $this->getRequest()->getPost('price');
            foreach ($price as $itemId => $price) {
                $cartItem = \Mage::getModel('Model\CartCont\Item');
                $cartItem = $cartItem->load($itemId);
                $cartItem->price = $price;
                $cartItem->save();
                $this->updateCartTotal();
            }

            $this->getMessage()->setSuccess('Item update Successfully');

        }catch(\Exception $e){
            $this->getMessage()->setFailure($e->getMessage());
        }

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


    public function updateCartTotal()
    {
        $cartId = $this->getCart()->cartId;
        $cart = \Mage::getModel('Model\CartCont')->load($cartId);
        $total = 0;

        if ($cart->getItems()->count()) {
            foreach ($cart->getItems()->getData() as $item) {
                $total = $total + $item->price;
            }   
        }

        $cart = \Mage::getModel('Model\CartCont');
        $cart->total = $total;
        $cart->cartId = $cartId;
        $cart->save();
    }

    public function updateAddressAction()
    {
        $cartId = $this->getCart()->cartId;
        if ($this->getRequest()->getGet('type') == "billing") {
            $billingAddressData = $this->getRequest()->getPost('billing');
            $billingAddress = \Mage::getModel('Model\CartCont')->load($cartId)->getBillingAddress();
            $billingAddress->setData($billingAddressData);
            $billingAddress->save();
            if ($this->getRequest()->getPost('billingAddressBook')) {
                $customerAddressBook = \Mage::getModel('Model\CartCont')
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
            
            $shippingAddress = \Mage::getModel('Model\CartCont')->load($cartId)->getShippingAddress();
            $shippingAddress->setData($shippingAddressData);
            $shippingAddress->sameAsBilling = 1;
            $shippingAddress->save();
            if ($this->getRequest()->getPost('shippingAddressBook')) {
                $customerAddressBook = \Mage::getModel('Model\CartCont')
                                    ->load($cartId,'cartId')
                                    ->getCustomer()
                                    ->getShippingAddress();
                $customerAddressBook->setData($shippingAddressData);
                $customerAddressBook->save();                   
            }
        }
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

    public function deleteAction()
    {
        try {
            $itemId = $this->getRequest()->getGet('itemId');
            $cartItem = \Mage::getModel('Model\CartCont\Item');
            $cartItem = $cartItem->load($itemId);
            $cartItem->delete();
            $this->updateCartTotal();
        } catch (\Exception $e) {
            $this->getMessage()->setFailure($e->getMessage());      
        }

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
        
        header("Content-type:application/json");
        echo json_encode($response);
    }


    public function updateShippingAction()
    {
        $methodId = $this->getRequest()->getPost('shippingMethod');

        $cartId = $this->getCart()->cartId;
        $cart = \Mage::getModel('Model\CartCont');
        $cartClone = clone $cart;
        $cart->cartId = $cartId;
        $cart->shippingMethodId = $methodId;
        $cart->save();
        $cartClone->cartId = $cartId;

        $cartClone->shippingAmount = $cart->getShippingMethod()->amount;
        $cartClone->save();
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
        
        header("Content-type:application/json");
        echo json_encode($response);

       
    }

    public function updatePaymentAction()
    {
        $methodId = $this->getRequest()->getPost('paymentMethod');
        $cartId = $this->getCart()->cartId;
        $cart = \Mage::getModel('Model\CartCont');
        $cart->cartId = $cartId;
        $cart->paymentMethodId = $methodId;
        $cart->save();

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
        
        header("Content-type:application/json");
        echo json_encode($response);
       
    }

}

?>