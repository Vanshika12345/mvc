<?php
namespace Controller;
\Mage::loadFileByClassName('Controller\Core\Customer');

class Home extends Core\Customer
{
	
	function indexAction()
	{
		$layout = $this->getLayout();
		$content = $layout->getContent();
		$index = \Mage::getBlock('Block\Home\Index');
		$content->addChild($index,'index');
		// $productList = \Mage::getBlock('Block\Customer\Layout\ProductList');
		// $content->addChild($productList,'productList');
		//$categoryList = \Mage::getBlock('Block\Customer\Layout\CategoryList');
		//$content->addChild($categoryList,'categoryList');
		//echo $content->toHtml();
		echo $this->renderLayout();
	
	}

	public function pageAction()
	{
		$pager = \Mage::getController('Controller\Core\Pager');
		$productModel = \Mage::getModel('Model\Product');
		$query = "SELECT * FROM `{$productModel->getTableName()}`";	
		$productCount = $productModel->getAdapter()->fetchOne($query);

		$pager->setTotalRecords(100);
		$pager->setRecordsPerPage(8);
		$pager->setCurrentPage($_GET['p']);
		$pager->calculate();
		echo "<pre>";
		print_r($pager);
	}
}

?>