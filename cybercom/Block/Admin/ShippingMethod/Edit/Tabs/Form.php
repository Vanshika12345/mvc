<?php
namespace Block\Admin\ShippingMethod\Edit\Tabs;
\Mage::loadFileByClassName('Block\Core\Template'); 	

class Form extends \Block\Core\Template
{
	
	protected $methods = null;
	protected $tableRow = null;
	function __construct() {
		parent::__construct();
		$this->setTemplate('./View/admin/shippingmethod/edit/tabs/form.php');
	}

   /* public function setShippingMethods($methods = null) {

		if ($methods) {
			$this->methods = $methods;
			return $this;
		}
		$methods = \Mage::getModel('Model\ShippingMethod');
		if ($id= $this->getRequest()->getGet('shippingMethodId')) {
			$methods = $methods->load($id);
			if (!$methods) {
				echo "No records found";
				$this->setTemplate('./View/admin/shippingmethod/grid.php');
				
			}
		}
		$this->methods = $methods;
		return $this;
	}

	public function getShippingMethods() {

		if (!$this->methods) {
			$this->setShippingMethods();
		}
		return $this->methods;
	}*/

	public function setTableRow(\Model\ShippingMethod $tableRow)
	{
		$this->tableRow = $tableRow;
		return $this;
	}
	public function getTableRow()
	{
		return $this->tableRow;
	}
}
?>