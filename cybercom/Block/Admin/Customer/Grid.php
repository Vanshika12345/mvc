<?php

namespace Block\Admin\Customer;
\Mage::loadFileByClassName('Block\Core\Template'); 	

class Grid extends \Block\Core\Template
{
	protected $template = null;	
	protected $customers = null;
	protected $groups = null;
	
	function __construct() {
		parent::__construct();
		$this->setTemplate('./View/admin/customer/grid.php');
	}

	public function setCustomers($customers = null) {

		if (!$customers) {
			$customers = \Mage::getModel('Model\Customer');
			$customers = $customers->fetchAll();
		}
		$this->customers = $customers;
		return $this;
	}

	public function getCustomers() {

		if (!$this->customers) {
			$this->setCustomers();
		}
		return $this->customers;
	}

	public function getCustomerGroups($customer = null)
	{
		$customerModel = \Mage::getModel('Model\Customer');
		$name = '';
		if (!$this->groups) {
			$query = "SELECT groupId,name FROM customer_group";
			$this->groups = $customerModel->getAdapter()->fetchPairs($query);
			
		}
		$customerGroupId[] = $customer->groupId;
		foreach ($customerGroupId as $groupId) {
			if (array_key_exists($groupId, $this->groups)) {
					$name = $this->groups[$groupId];
				}	
		}	
		return $name;
	}

	public function getBillingAddress($customer)
	{	
		$customerModel = \Mage::getModel('Model\Customer');
		$id = $customer->customerId;
		$billingAddress = '';
		
		$query = "SELECT zipcode FROM `customer_address` WHERE `customerId` ='{$id}' AND `address_type`='1'";	
		$address = 	$customerModel->fetchAll($query);
		if($address){
			foreach ($address->getData() as $key => $value) 
			{
				$billingAddress = $value->zipcode;
			}
		}
		return $billingAddress;
	}

	public function getStatusName($customer)
	{
		if ($customer->status == 1)
		{
			return "Enable";
		}
		return "Disable";
	}
}
?>