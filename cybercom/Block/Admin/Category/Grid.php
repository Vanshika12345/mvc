<?php

namespace Block\Admin\Category;
\Mage::loadFileByClassName('Block\Core\Template'); 	

class Grid extends \Block\Core\Template
{
	protected $template = null;	
	protected $categories = null;
	protected $categoriesOptions = [];
	function __construct() {

		parent::__construct();
		$this->setTemplate('./View/admin/category/grid.php');
	}

	public function setCategories($categories = null) {

		if (!$categories) {
			$categories = \Mage::getModel('Model\Category');
			$categories = $categories->fetchAll();
		}
		$this->categories = $categories;
		return $this;
	}

	public function getCategories() {

		if (!$this->categories) {
			$this->setCategories();
		}
		return $this->categories;
	}

	
	public function getName($category)
	{
		$categoryModel = \Mage::getModel('Model\Category');
		if (!$this->categoriesOptions) {
			$query = "SELECT `categoryId`, `name` FROM 	`{$categoryModel->getTableName()}`";
			$this->categoryOptions = $categoryModel->getAdapter()->fetchPairs($query);
		
		}
		$pathId = explode('=',$category->path);

		foreach ($pathId as $key => &$ids) {
			if (array_key_exists($ids, $this->categoryOptions)) {
				$ids = $this->categoryOptions[$ids];
			}
		}
		$name = implode('=>',$pathId);	
		
		return $name;
	}

	public function getStatusName($category)
	{
		if ($category->status == 1) {
			return "Enable";
		}
		return "Disable";
	}

	public function getFeatureName($category)
	{
		if ($category->featured == 1) {
			return "Yes";
		}
		return "No";
	}
}
?>