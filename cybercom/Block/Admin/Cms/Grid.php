<?php
namespace Block\Admin\Cms;
\Mage::loadFileByClassName('Block\Core\Template'); 	

class Grid extends \Block\Core\Template
{
	protected $pages = null;
	function __construct() {

		parent::__construct();
		$this->setTemplate('./View/admin/cms/grid.php');
	}

	public function setPages($pages = null) {

		if (!$pages) {
			$pages = \Mage::getModel('Model\Cms');
			$pages = $pages->fetchAll();
		}
		$this->pages = $pages;
		return $this;
	}

	public function getPages() {

		if (!$this->pages) {
			$this->setPages();
		}
		return $this->pages;
	}

	public function getStatusName($page)
	{
		if ($page->status == 1) {
			return "Enable";
		}
		return "Disable";
	}
}
?>