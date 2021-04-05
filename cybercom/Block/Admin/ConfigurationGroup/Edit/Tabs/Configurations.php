<?php

namespace Block\Admin\ConfigurationGroup\Edit\Tabs;
\Mage::loadFileByClassName('Block\Core\Template');

class Configurations extends \Block\Core\Template
{
	protected $configurations = [];
	protected $tableRow = null;	
	
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/configuration_group/edit/tabs/configuration.php');
	}

	public function setConfigurations($configurations = null)
	{
		if (!$configurations) {
			$configurations = \Mage::getModel('Model\ConfigurationGroup\Configuration');
			$configurations = $configurations->fetchAll();
		}
		$this->configurations = $configurations;
		return $this;
	}

	public function getConfigurations()
	{
		if (!$this->configurations) {
			$this->setConfigurations();
		}
		return $this->configurations;
	}

	public function setTableRow(\Model\ConfigurationGroup $tableRow)
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