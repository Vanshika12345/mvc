<?php 
namespace Block\Admin\Cart;


class Customer extends \Block\Core\Template
{
	
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/cart/customer.php');
	}

	public function getCustomers()
	{
		$customer = \Mage::getModel('Model\Customer');
		return $customer->fetchAll();
	}
}


?>