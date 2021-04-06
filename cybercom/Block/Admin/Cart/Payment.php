<?php  
namespace Block\Admin\Cart;


class Payment extends \Block\Core\Template
{
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/cart/payment.php');
	}

	public function getPaymentDetails()
	{
		$payment = \Mage::getModel('Model\PaymentMethod');
		return $payment->fetchAll();
	}

	public function getCart()
	{
		return \Mage::getModel('Model\Cart')->load(\Mage::getModel('Model\Admin\Session')->cartId);
	}
}

?>