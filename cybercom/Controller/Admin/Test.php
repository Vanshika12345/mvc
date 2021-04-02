<?php

namespace Controller\Admin;

class Test extends \Controller\Core\Admin
{
	
	function testAction()
	{
		$products = \Mage::getModel('Model\Product');
		$query = "SELECT * FROM product ORDER BY productId ASC";
		$products = $products->fetchAll($query);
		echo "<pre>";
		$products->name = 'temporaryName';
		print_r($products);
	}
}

?>