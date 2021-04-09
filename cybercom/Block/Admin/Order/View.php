<?php  
namespace Block\Admin\Order;


class View extends \Block\Core\Template
{
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/order/view.php');
	}

	public function getOrder()
	{
		return \Mage::getModel('Model\Order')->load(\Mage::getModel('Model\Admin\Session')->orderId);
	}
}

?>