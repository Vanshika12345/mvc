<?php
namespace Block\Admin\Product\Edit\Tabs;
\Mage::loadFileByClassName('Block\Core\Template');
class Category extends \Block\Core\Template
{
    protected $tabs = [];
    protected $tableRow = null;
    public function __construct()
    {
        parent::__construct();
        $this->setTemplate('./View/admin/product/edit/tabs/category.php');
    }

    public function setTableRow(\Model\Product $tableRow)
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