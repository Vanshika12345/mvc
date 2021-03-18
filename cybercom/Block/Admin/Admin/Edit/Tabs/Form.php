<?php

namespace Block\Admin\Admin\Edit\Tabs;
\Mage::loadFileByClassName('Block\Core\Template'); 	

class Form extends \Block\Core\Template
{
	
	protected $admin = null;
	protected $tableRow = null;
	
	function __construct() {
		parent::__construct();
		$this->setTemplate('./View/admin/admin/edit/tabs/form.php');
	}

    /*public function setAdmin($admin = null) {

		if ($admin) {
			$this->admin = $admin;
			return $this;
		}
		$admin = \Mage::getModel('Model\Admin');
		if ($id= $this->getRequest()->getGet('adminId')) {
			$admin = $admin->load($id);
			if (!$admin) {
				echo "No records found";
				$this->setTemplate('./View/admin/admin/grid.php');
				
				}
		}
		$this->admin = $admin;
		return $this;
	}

	public function getAdmin() {

		if (!$this->admin) {
			$this->setAdmin();
		}
		return $this->admin;
	}
*/
	public function setTableRow(\Model\Admin $tableRow)
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