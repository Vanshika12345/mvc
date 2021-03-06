<?php 

namespace Model;

class Order extends \Model\Core\Table
{
	
	public function __construct()
	{
		$this->setTableName('order_table');
		$this->setPrimaryKey('orderId');
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

	public function getItems()
	{
		$key = $this->getPrimaryKey();
		$orderItems = \Mage::getModel('Model\Order\Item');
		$query = "SELECT * FROM {$orderItems->getTableName()} WHERE `{$key}` = '{$this->$key}'";
		return $orderItems->fetchAll($query);
	}

	public function getBillingAddress()
	{
		$key = $this->getPrimaryKey();
		$billingAddress = \Mage::getModel('Model\Order\Address');
		$query = "SELECT * FROM `{$billingAddress->getTableName()}` WHERE `{$key}` = '{$this->$key}' AND `address_type` = '1'";
		$billingAddress = $billingAddress->fetchRow($query);
		return $billingAddress;
	}

	public function getShippingAddress()
	{
		$key = $this->getPrimaryKey();
		$shippingAddress = \Mage::getModel('Model\Order\Address');
		$query = "SELECT * FROM `{$shippingAddress->getTableName()}` WHERE `{$key}` = '{$this->$key}' AND `address_type` = '2'";
		$shippingAddress = $shippingAddress->fetchRow($query);
		return $shippingAddress;	
	}
}


?>