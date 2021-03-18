<?php

namespace Block\Admin\Product;
\Mage::loadFileByClassName('Block\Core\Template'); 	

class Grid extends \Block\Core\Template
{
	protected $template = null;	
	protected $products = null;
	
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/product/grid.php');
	}

	
	public function setProducts($products = null) {

		if (!$products) {
			$products = \Mage::getModel('Model\Product');
			$products = $products->fetchAll();
			$this->products = $products;
		}
		$this->products = $products;
		return $this;
	}

	public function getProducts() {

		if (!$this->products) {
			$this->setProducts();
		}
		return $this->products;
	}

	public function getStatusName($product)
	{
		if ($product->status == 1) {
			return "Enable";
		}
		return "Disable";
	}

}
?>