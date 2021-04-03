<?php 
namespace Block\Admin\Order;


class Customer extends \Block\Core\Template
{
	
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/order/customer.php');
	}

	public function getOrder()
	{
		return \Mage::getModel('Model\Order')->load(\Mage::getModel('Model\Admin\Session')->orderId);
	}
}


?>