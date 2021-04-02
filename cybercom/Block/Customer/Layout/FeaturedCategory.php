<?php

namespace Block\Customer\Layout;
\Mage::loadFileByClassName('Block\Core\Template');

class FeaturedCategory extends \Block\Core\Template
{
    public function __construct()
    {
        $this->setTemplate('./View/customer/layout/featured_category.php');
    }

    public function getCategoryImages()
    {
    	$categoryModel = \Mage::getModel('Model\Category');
    	$query = "SELECT c.name, cm.image FROM {$categoryModel->getTableName()} as c INNER JOIN category_media as cm ON cm.categoryId = c.categoryId AND c.featured = '1' AND cm.icon = '1'";
    	//return $query;
    	 $categoryModel = $categoryModel->fetchAll($query);
    	 return $categoryModel;
    }
}

?>