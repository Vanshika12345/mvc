<?php 
namespace Model;

class Cart extends Core\Table
{

	function __construct()
	{
		$this->setTableName('cart');
		$this->setPrimaryKey('cartId');
	}

	public function getCustomer()
	{
		if(!$this->customerId)
		{
			return null;
		}
		$customer = \Mage::getModel('Model\Customer')->load($this->customerId);
		if (!$customer) {
			return null;
		}
		return $customer;
	}

	public function getShippingMethod()
	{
		if(!$this->shippingMethodId)
		{
			return null;
		}
		$shipping = \Mage::getModel('Model\ShippingMethod')->load($this->shippingMethodId);
		
		if (!$shipping) {
			return null;
		}
		return $shipping;
	}

	public function getPaymentMethod()
	{
		if(!$this->paymentMethodId)
		{
			return null;
		}
		$payment = \Mage::getModel('Model\PaymentMethod')->load($this->paymentMethodId);
		if (!$payment) {
			return null;
		}
		return $payment;
	}

	public function getCartItems()
	{
		$key = $this->getPrimaryKey();

		$cartItem = \Mage::getModel('Model\Cart\Item');
		$query = "SELECT * FROM `{$cartItem->getTableName()}` WHERE `{$key}` = '{$this->$key}'";

		$cartItems = $cartItem->fetchAll($query);
		return $cartItems;
	}

	public function getBillingAddress()
	{
		$key = $this->getPrimaryKey();
		$billingAddress = \Mage::getModel('Model\Cart\Address');
		$query = "SELECT * FROM `{$billingAddress->getTableName()}` WHERE `{$key}` = '{$this->$key}' AND `address_type` = '1'";
		$billingAddress = $billingAddress->fetchRow($query);
		return $billingAddress;
	}

	public function getShippingAddress()
	{
		$key = $this->getPrimaryKey();
		$shippingAddress = \Mage::getModel('Model\Cart\Address');
		$query = "SELECT * FROM `{$shippingAddress->getTableName()}` WHERE `{$key}` = '{$this->$key}' AND `address_type` = '2'";
		$shippingAddress = $shippingAddress->fetchRow($query);
		return $shippingAddress;
	}

}

?>