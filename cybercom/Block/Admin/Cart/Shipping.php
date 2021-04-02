<?php  
namespace Block\Admin\Cart;

\Mage::loadFileByClassName('Block\Core\Template');

class Shipping extends \Block\Core\Template
{
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/cart/shipping.php');
	}

	public function getShippingDetails()
	{
		$shipping = \Mage::getModel('Model\ShippingMethod');
		return $shipping->fetchAll();
	}

	public function getCart()
	{
		return \Mage::getModel('Model\Cart')->load(\Mage::getModel('Model\Admin\Session')->cartId);
	}
}

?>