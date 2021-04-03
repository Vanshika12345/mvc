<?php  
namespace Block\Admin\Order;


class OrderDetails extends \Block\Core\Template
{
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/order/order_details.php');
	}

	public function getOrder()
	{
		return \Mage::getModel('Model\Order')->load(\Mage::getModel('Model\Admin\Session')->cartId);
	}
}

?>