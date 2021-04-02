<?php 
namespace Block\Admin\Cart;


class Address extends \Block\Core\Template
{
	
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/cart/address.php');
	}

	public function getCartShippingAddress()
	{
		$cart = \Mage::getModel('Model\Cart');
		$session = \Mage::getModel('Model\Admin\Session');
		$cartId = $session->cartId;	
		$cart = $cart->load($cartId);
		if ($cart) {
			$shippingAddress = $cart->getShippingAddress();
			if ($shippingAddress) {
				return $shippingAddress;
			} 
			$shippingAddress = $cart->getCustomer()->getShippingAddress();
			$cartShippingAddress = \Mage::getModel('Model\Cart\Address');
			if ($shippingAddress) {
				
				$cartShippingAddress->address = $shippingAddress->address;
				$cartShippingAddress->city = $shippingAddress->city;
				$cartShippingAddress->state = $shippingAddress->state;
				$cartShippingAddress->zipcode = $shippingAddress->zipcode;
				$cartShippingAddress->country = $shippingAddress->country;
				$cartShippingAddress->address_type = $shippingAddress->address_type;
				$cartShippingAddress->cartId = $cart->cartId;
				$cartShippingAddress->save();
				return $cartShippingAddress;
			}
	
		} 
	}

	public function getCartBillingAddress()
	{
		$cart = \Mage::getModel('Model\Cart');
		$session = \Mage::getModel('Model\Admin\Session');
		$cartId = $session->cartId;	
		$cart = $cart->load($cartId);
		if ($cart) {
			$billingAddress = $cart->getBillingAddress();
			if ($billingAddress) {
				return $billingAddress;
			}
			$billingAddress = $cart->getCustomer()->getBillingAddress();
			$cartbillingAddress = \Mage::getModel('Model\Cart\Address');
			if ($billingAddress) {
				
				$cartbillingAddress->address = $billingAddress->address;
				$cartbillingAddress->city = $billingAddress->city;
				$cartbillingAddress->state = $billingAddress->state;
				$cartbillingAddress->zipcode = $billingAddress->zipcode;
				$cartbillingAddress->country = $billingAddress->country;
				$cartbillingAddress->address_type = $billingAddress->address_type;
				$cartbillingAddress->cartId = $cart->cartId;
				$cartbillingAddress->save();
				return $cartbillingAddress;
			}
	
		} 
	}

	
}

/**/

?>