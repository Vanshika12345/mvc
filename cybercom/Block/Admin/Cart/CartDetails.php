<?php  
namespace Block\Admin\Cart;


class CartDetails extends \Block\Core\Template
{
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/cart/cartdetails.php');
	}

	public function getCart()
	{
		return \Mage::getModel('Model\Cart')->load(\Mage::getModel('Model\Admin\Session')->cartId);
	}
}

?>