<?php
namespace Block\Admin\Product\Edit\Tabs;
\Mage::loadFileByClassName('Block\Core\Template'); 	

class Form extends \Block\Core\Template
{
	
	protected $products = null;
	protected $tableRow = null;
	function __construct() {
		parent::__construct();
		$this->setTemplate('./View/admin/product/edit/tabs/form.php');
	}

	/*public function setProducts($products = null) {

		if ($products) {
			$this->products = $products;
			return $this;
		}
		$products = \Mage::getModel('Model\Product');
		if ($id= $this->getRequest()->getGet('productId')) {
			$products = $products->load($id);
			if (!$products) {
				echo "No records found";
				$this->setTemplate('./View/admin/product/grid.php');
				
			}
		}
		$this->products = $products;
		return $this;
	}

	public function getProducts() {

		if (!$this->products) {
			$this->setProducts();
		}
		return $this->products;
	}*/

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