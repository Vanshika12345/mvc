<?php 
namespace Model\Order;

class Item extends \Model\Core\Table
{

	function __construct()
	{
		$this->setTableName('order_item');
		$this->setPrimaryKey('orderItemId');
	}

	public function getProduct()
	{
		if(!$this->productId)
		{
			return null;
		}
		$product = \Mage::getModel('Model\Product')->load($this->productId);
		if (!$product) {
			return null;
		}
		return $product;
	}

	public function getOrder()
	{
		if(!$this->orderId)
		{
			return null;
		}
		$order = \Mage::getModel('Model\Order')->load($this->orderId);
		if (!$order) {
			return null;
		}
		return $order;
	}

}

?>