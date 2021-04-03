<?php 
namespace Block\Admin\Order;

class Products extends \Block\Core\Template
{
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/order/products.php');
	}

	public function getProducts()
	{
		$products = \Mage::getModel('Model\Order')->getItems();
		return $products;
	}

}