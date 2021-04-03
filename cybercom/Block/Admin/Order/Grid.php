<?php

namespace Block\Admin\Order;

class Grid extends \Block\Core\Template
{
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/order/grid.php');
	}

	public function getOrder()
	{
		return \Mage::getModel('Model\Order')->load(\Mage::getModel('Model\Admin\Session')->orderId);
	}

	/*public function getPaymentMethod()
	{
		$this->getOrder()->getPaymentMethod();		
	}*/	
}
?>