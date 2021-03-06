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
		$id = $this->getRequest()->getGet('orderId');
		return \Mage::getModel('Model\Order')->load($id);
	}
}

?>