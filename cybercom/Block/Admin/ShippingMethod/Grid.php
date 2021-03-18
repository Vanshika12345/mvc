<?php
namespace Block\Admin\ShippingMethod;
\Mage::loadFileByClassName('Block\Core\Template'); 	

class Grid extends \Block\Core\Template
{
	protected $template = null;	
	protected $methods = null;
	
	function __construct() {
		parent::__construct();
		$this->setTemplate('./View/admin/shippingmethod/grid.php');
	}

	public function setMethods($methods = null) {

		if (!$methods) {
			$methods = \Mage::getModel('Model\ShippingMethod');
			$methods = $methods->fetchAll();
		}
		$this->methods = $methods;
		return $this;
	}

	public function getMethods() {

		if (!$this->methods) {
			$this->setMethods();
		}
		return $this->methods;
	}

	public function getStatusName($method)
	{
		if ($method->status == 1) {
			return "Enable";
		}
		return "Disable";
	}
}
?>