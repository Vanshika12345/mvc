<?php

namespace Block\Customer\Layout;
\Mage::loadFileByClassName('Block\Core\Template');

class ProductSection extends \Block\Core\Template
{
    public function __construct()
    {
        $this->setTemplate('./View/customer/layout/product_section.php');
    }

    public function getProductImages()
    {
    	$productModel = \Mage::getModel('Model\Product');
    	$query = "SELECT p.name, p.quantity,c.name as categoryName,p.price, p.description,p.discount,pm.image 
        FROM {$productModel->getTableName()} as p 
        INNER JOIN product_media as pm 
            ON pm.productId = p.productId 
        INNER JOIN product_category as pc  
            ON pc.productId = p.productId
        INNER JOIN category as c 
            ON c.categoryId = pc.categoryId";
    		//echo $query;
    	 $productModel = $productModel->fetchAll($query);
    	 return $productModel;
    }
}

?>