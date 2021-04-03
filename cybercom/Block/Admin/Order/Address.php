<?php 
namespace Block\Admin\Order;


class Address extends \Block\Core\Template
{
	
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/order/address.php');
	}

	public function getOrderShippingAddress()
	{
		$order = \Mage::getModel('Model\Order');
		$session = \Mage::getModel('Model\Admin\Session');
		$orderId = $session->orderId;	
		$order = $order->load($orderId);
		if ($order) {
			$shippingAddress = $order->getShippingAddress();
			if ($shippingAddress) {
				return $shippingAddress;
			}
		}
	}

	public function getOrderBillingAddress()
	{
		$order = \Mage::getModel('Model\Order');
		$session = \Mage::getModel('Model\Admin\Session');
		$orderId = $session->orderId;	
		$order = $order->load($orderId);
		if ($order) {
			$billingAddress = $order->getBillingAddress();
			if ($billingAddress) {
				return $billingAddress;
			}
		} 
	}

	
}

/**/

?>