<?php

namespace Block\Admin\Cms\Edit\Tabs;
\Mage::loadFileByClassName('Block\Core\Template'); 	

class Form extends \Block\Core\Template
{
	
	protected $pages = null;
	protected $tableRow = null;
	function __construct() {
		parent::__construct();
		$this->setTemplate('./View/admin/cms/edit/tabs/form.php');
	}

    /*public function setPages($pages = null) {

		if ($pages) {
			$this->pages = $pages;
			return $this;
		}
		$pages = \Mage::getModel('Model\Cms');
		if ($id= $this->getRequest()->getGet('pageId')) {
			$pages = $pages->load($id);
			if (!$pages) {
				echo "No records found";
				$this->setTemplate('./View/admin/cms/grid.php');
				
			}
		}
		$this->pages = $pages;
		return $this;
	}

	public function getPages() {

		if (!$this->pages) {
			$this->setPages();
		}
		return $this->pages;
	}*/

	public function setTableRow(\Model\Cms $tableRow)
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