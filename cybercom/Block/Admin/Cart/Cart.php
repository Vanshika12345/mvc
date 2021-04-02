<?php 
namespace Block\Admin\Cart;


class Cart extends \Block\Core\Template
{
	
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/cart/cart.php');
	}

	public function getCart()
	{
		$session = \Mage::getModel('Model\Admin\Session');
		return \Mage::getModel('Model\Cart')->load($session->cartId);
	}
}


?>