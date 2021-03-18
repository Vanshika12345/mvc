<?php

namespace Model\Core;

class Table {

	protected $adapter =null;
	protected $primaryKey = null;
	protected $tableName = null;
	public $data = [];
	
	public function setPrimaryKey($primaryKey) {
		$this->primaryKey = $primaryKey;
		return $this;
	}

	public function getPrimaryKey() {
		return $this->primaryKey;
	}

	public function setAdapter($adapter = null)
	{
		if (!$adapter) {
			$adapter = \Mage::getModel('Model\Core\Adapter');
		}
		$this->adapter = $adapter;
		return $this;
	}

	public function getAdapter()
	{
		if (!$this->adapter) {
			$this->setAdapter();
		}
		return $this->adapter;
	}
	
	public function setTableName($tableName) {
		$this->tableName = $tableName;
		return $this;
	}	

	public function getTableName() {
		return $this->tableName;
	}

	public function setData(array $data) {
		$this->data = array_merge($this->data,$data);
		return $this;
	}

	public function getData() {
		return $this->data;
	}
	
	public function __set($name, $value){
		 $this->data[$name] = $value; 
		return $this;
	}

	public function __get($name) {
		if (!array_key_exists($name, $this->data)) {
			return null;
		}
		return $this->data[$name];
	}


	public function save(){
		
		if (array_key_exists($this->getPrimaryKey(), $this->getData())) {

			$tableData = [];
			foreach ($this->getData() as $key => $value) {
				$tableData[] = "`".$key."` = '".$value."'";
			}
			$id = $this->getData()[$this->getPrimaryKey()];
			$keys = implode(", ", $tableData);
			$query = "UPDATE `{$this->getTableName()}` SET {$keys} WHERE `{$this->getPrimaryKey()}` = '{$id}'";
			return $this->getAdapter()->update($query);

		
		}
		else {
			$keys = implode(", ", array_keys($this->getData()));
			$values = array_values($this->getData());
			for($i=0;$i<count($values);$i++) {
				$values[$i] = "'".$values[$i]."'";
			}
			$values = implode(", ", $values);
			$query = "INSERT INTO `{$this->getTableName()}` ({$keys}) VALUES ({$values})";

			$id = $this->getAdapter()->insert($query);
		
		 }
		 $this->load($id);
		 return $this;

	}

	public function delete(){

		$query = "DELETE FROM `{$this->getTableName()}` WHERE `{$this->getPrimaryKey()}` = '{$this->data[$this->getPrimaryKey()]}'";
		$result = $this->getAdapter()->delete($query);
		return $result;
		
	}
	public function load($id){
		$id = (int)$id;
			$query = "SELECT * FROM `{$this->getTableName()}` WHERE `{$this->getPrimaryKey()}` = '{$id}'";
			return $this->fetchRow($query);
			
	}
	
	
	public function fetchRow($query) {
		$row = $this->getAdapter()->fetchRow($query);
			if (!$row) {
				return false;
			}
		$this->data = $row;
		return $this;
	}

	public function fetchAll($fetchAllquery = null) {

		if (!$fetchAllquery) {
		$fetchAllquery = "SELECT * FROM `{$this->getTableName()}`";
		}
		$rows = $this->getAdapter()->fetchAll($fetchAllquery);
		if (!$rows) {
			return false;
		}
		foreach($rows as $key => $row) {
			$keys = new $this;
			$keys->setData($row);
			$rowArray[] = $keys;
		}
		$this->setData($rowArray);

		$collectionClassName = get_class($this)."\Collection";
		$collection = \Mage::getModel($collectionClassName);
		$collection->setData($rowArray); 
		return $collection;
		
		} 

		public function alterTable($query){

			return $this->getAdapter()->alterTable($query);
		}
				
	}



	
	


?>