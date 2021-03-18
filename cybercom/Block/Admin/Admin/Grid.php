<?php
namespace Block\Admin\Admin;
\Mage::loadFileByClassName('Block\Core\Template'); 	

class Grid extends \Block\Core\Template
{
	protected $template = null;	
	protected $admin = null;
	
	function __construct() {
		parent::__construct();
		$this->setTemplate('./View/admin/admin/grid.php');
	}

	public function setAdmin($admin = null) {

		if (!$admin) {
			$admin = \Mage::getModel('Model\Admin');
			$admin = $admin->fetchAll();
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

	public function getStatusName($admin)
	{
		if ($admin->status == 1) {
			return "Enable";
		}
		return "Disable";
	}
}
?>