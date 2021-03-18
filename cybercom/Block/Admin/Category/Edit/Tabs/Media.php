<?php
namespace Block\Admin\Category\Edit\Tabs;
\Mage::loadFileByClassName('Block\Core\Template');
class Media extends \Block\Core\Template
{
	protected $tableRow = null;
	
    public function __construct()
    {
        parent::__construct();
        $this->setTemplate('./View/admin/category/edit/tabs/media.php');
    }

    public function setTableRow(\Model\Category $tableRow)
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