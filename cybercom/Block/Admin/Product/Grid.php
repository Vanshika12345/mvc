<?php

namespace Block\Admin\Product;
\Mage::loadFileByClassName('Block\Core\Grid'); 	

class Grid extends \Block\Core\Grid
{
	protected $product = null;
	protected $filter = null;
	protected $pages = null;

	public function prepareCollection()
	{
			$products = \Mage::getModel('Model\Product');	
			
			$offset = ($this->getPages()->getCurrentPage() - 1) * $this->getPages()->getRecordsPerPage();
			
			$query = "SELECT * FROM {$products->getTableName()}"; 

			if($this->getFilter()->hasFilters()){
				foreach ($this->getFilter()->getFilters() as $controller => $filters) {
					if($controller == 'product'){
						$query.= " WHERE 1 = 1";
						foreach ($filters as $type => $filter) {
							if ($type == 'text') {
								foreach ($filter as $key => $value) {
									$query.= " AND (`{$key}` LIKE '%{$value}%')";		
								}
							}
						}
					}
				}
			}
		$query.= " LIMIT {$offset},{$this->getPages()->getRecordsPerPage()}";
		
		$products = $products->fetchAll($query);
		$this->setCollection($products);
		return $this;
		
	}

	public function getFilter()
	{
		if(!$this->filter){
			$this->filter = \Mage::getModel('Model\Admin\Filter');
		}
		return $this->filter;
	}

	public function prepareActions()
	{
		$this->addActions('edit',[
			'label' => 'Edit',
			'method' =>'getEditUrl',
			'ajax' => true
		]);
		$this->addActions('delete',[
			'label' => 'Delete',
			'method' =>'getDeleteUrl',
			'ajax' => true
		]);
		
		$this->addActions('addtoCart',[
			'label' => 'Add Cart',
			'method' =>'getaddToCartUrl',
			'ajax' => true
		]);
		return $this;
	}

	public function prepareButton()
	{
		$this->addButton('addNew',[
			'label' => 'Add Product',
			'method' => 'getaddNewUrl',
			'ajax' => true
		]);
		$this->addButton('addfilter',[
			'label' => 'Add filter',
			'method' => 'getaddFilterUrl',
			'ajax' => true
		]);
		$this->addButton('addtoCart',[
			'label' => 'Add Cart',
			'method' =>'getaddCartUrl',
			'ajax' => true
		]);
		return $this;
	}
	public function prepareColumns()
	{
		$this->addColumn('productId',[
			'label' => 'ProductId',
			'field' => 'productId',
			'type' => 'number',
			'controller' => 'product'
		]);
		$this->addColumn('name',[
			'label' => 'Name',
			'field' => 'name',
			'type' => 'text',
			'controller' => 'product'
		]);
		$this->addColumn('price',[
			'label' => 'Price(in Rs.)',
			'field' => 'price',
			'type' => 'number',
			'controller' => 'product'
		]);
		$this->addColumn('discount',[
			'label' => 'Discount(in Rs.)',
			'field' => 'discount',
			'type' => 'number',
			'controller' => 'product'
		]);
		$this->addColumn('quantity',[
			'label' => 'Quantity',
			'field' => 'quantity',
			'type' => 'number',
			'controller' => 'product'
		]);
		return $this;
	}

	public function getTitle()
	{
		return 'Manage Product';
	}
	
	public function getEditUrl($row)
	{
		$url = $this->getUrl()->getUrl('edit','admin_product',['productId'=>$row->productId]);
		return "object.setUrl('{$url}').resetParam().load();";
	}

	public function getaddCartUrl()
	{
		$url = $this->getUrl()->getUrl('index','admin_cart');
		return "object.setUrl('{$url}').resetParam().load();";
	}

	public function getaddToCartUrl($row)
	{
		$url = $this->getUrl()->getUrl('addToCart','admin_cartCont',['productId'=>$row->productId]);
		return "object.setUrl('{$url}').resetParam().load();";
	}

	public function getDeleteUrl($row)
	{
		$url = $this->getUrl()->getUrl('delete','admin_product',['productId'=>$row->productId]);
		return "object.setUrl('{$url}').resetParam().load();";
	}
	
	public function getaddNewUrl()
	{
		$url = $this->getUrl()->getUrl('edit','admin_product',null,true);
		return "object.setUrl('{$url}').resetParam().load()";
	}

	public function getaddFilterUrl()
	{
		$url = $this->getUrl()->getUrl('filter','admin_product',null);
		return "object.setUrl('{$url}').resetParam().setParams($('#gridForm').serializeArray()).setMethod('POST').load()";
	}

	public function setPages(){

		$this->pages = \Mage::getController('Controller\Core\Pager');
		$productModel = \Mage::getModel('Model\Product');

		$query = "SELECT * FROM `{$productModel->getTableName()}`";	
		$productCount = $productModel->getAdapter()->fetchOne($query);
		$this->pages->setTotalRecords($productCount);
		$this->pages->setRecordsPerPage(40);
		if(isset($_GET['page'])) {
			$this->pages->setCurrentPage($_GET['page']);	
		} else {
			$this->pages->setCurrentPage(1);	
		}
		
		$this->pages->calculate();


	}

	public function getPages()
	{
		if(!$this->pages){
			$this->setPages();
		}
		return $this->pages;
	}
}
?>