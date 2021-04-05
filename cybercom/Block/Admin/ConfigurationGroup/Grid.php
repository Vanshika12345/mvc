<?php  

namespace Block\Admin\ConfigurationGroup;
\Mage::loadFileByClassName('Block\Core\Grid');
class Grid extends \Block\Core\Grid
{
	protected $configurationGroup = null;
	protected $filter = null;
	protected $pages = null;
	
	public function prepareCollection()
	{
			
		$configurationGroup = \Mage::getModel('Model\ConfigurationGroup');
		$offset = ($this->getPages()->getCurrentPage() - 1) * $this->getPages()->getRecordsPerPage();
			
		
		$query = "SELECT * FROM {$configurationGroup->getTableName()}";
		if($this->getFilter()->hasFilters()){
			foreach ($this->getFilter()->getFilters() as $controller => $filters) {
					if($controller == 'configurationGroup'){
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
		//echo $query;
		$configurationGroup = $configurationGroup->fetchAll($query);
		$this->setCollection($configurationGroup);
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
		return $this;
	}

	public function prepareButton()
	{
		$this->addButton('addNew',[
			'label' => 'Add ConfigurationGroup',
			'method' => 'getaddNewUrl',
			'ajax' => true
		]);
		$this->addButton('addfilter',[
			'label' => 'Apply filter',
			'method' => 'getaddFilterUrl',
			'ajax' => true
		]);
		$this->addButton('clearfilter',[
			'label' => 'Clear filter',
			'method' => 'getclearFilterUrl',
			'ajax' => true
		]);
		return $this;
	}

	public function prepareColumns()
	{
		$this->addColumn('configurationGroupId',[
			'label' => 'ConfigurationGroup Id',
			'field' => 'groupId',
			'type' => 'number',
			'controller' => 'configurationGroup'
		]);
		$this->addColumn('name',[
			'label' => 'name',
			'field' => 'name',
			'type' => 'text',
			'controller' => 'configurationGroup'
		]);
		$this->addColumn('createdAt',[
			'label' => 'createdAt',
			'field' => 'createdAt',
			'type' => 'datetime',
			'controller' => 'configurationGroup'
		]);
		
		return $this;
	}

	public function getTitle()
	{
		return 'Manage ConfigurationGroup';
	}
	
	public function getEditUrl($row)
	{
		$url = $this->getUrl()->getUrl('edit','admin_configurationGroup',['configurationGroupId'=>$row->groupId]);
		return "object.setUrl('{$url}').resetParam().load();";
	}

	public function getaddFilterUrl()
	{
		$url = $this->getUrl()->getUrl('filter','admin_configurationGroup',null);
		return "object.setUrl('{$url}').resetParam().setParams($('#gridForm').serializeArray()).setMethod('POST').load()";

	}
	
	public function getclearFilterUrl()
	{
		$url = $this->getUrl()->getUrl('clearFilter','admin_configurationGroup',null,true);
		return "object.setUrl('{$url}').resetParam().load()";
	}

	public function getDeleteUrl($row)
	{
		$url = $this->getUrl()->getUrl('delete','admin_configurationGroup',['configurationGroupId'=>$row->groupId]);
		return "object.setUrl('{$url}').resetParam().load();";
	}
	
	public function getaddNewUrl()
	{
		$url = $this->getUrl()->getUrl('edit','admin_configurationGroup',null,true);
		return "object.setUrl('{$url}').resetParam().load()";
	}

	public function setPages(){

		$this->pages = \Mage::getController('Controller\Core\Pager');
		$configurationGroupModel = \Mage::getModel('Model\ConfigurationGroup');

		$query = "SELECT * FROM `{$configurationGroupModel->getTableName()}`";	
		$configurationGroupCount = $configurationGroupModel->getAdapter()->fetchOne($query);
		$this->pages->setTotalRecords($configurationGroupCount);
		$this->pages->setRecordsPerPage(3);
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