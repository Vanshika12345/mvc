<?php
namespace Block\Admin\Customer\CustomerGroup;
\Mage::loadFileByClassName('Block\Core\Template'); 	

class Grid extends \Block\Core\Template
{
	protected $template = null;	
	protected $customerGroup = null;
	
	function __construct() {
		parent::__construct();
		$this->setTemplate('./View/admin/customer/customergroup/grid.php');
	}

	public function setCustomerGroup($customerGroup = null) {

		if (!$customerGroup) {
			$customerGroup = \Mage::getModel('Model\Customer\CustomerGroup');
			$customerGroup = $customerGroup->fetchAll();
		}
		$this->customerGroup = $customerGroup;
		return $this;
	}

	public function getCustomerGroup() {

		if (!$this->customerGroup) {
			$this->setCustomerGroup();
		}
		return $this->customerGroup;
	}

	public function getDefaultType($customerGroup)
	{
		if ($customerGroup->default_type == 1) {
			return "Yes";
		}
		return "No";
	}
}
?>