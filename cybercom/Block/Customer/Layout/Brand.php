<?php

namespace Block\Customer\Layout;
\Mage::loadFileByClassName('Block\Core\Template');

class Brand extends \Block\Core\Template
{
    public function __construct()
    {
        $this->setTemplate('./View/customer/layout/brand.php');
    }

    public function getBrandIcons()
    {
    	$brandModel = \Mage::getModel('Model\Brand');
    	$query = "SELECT `image` FROM `{$brandModel->getTableName()}`";
    	$brandModel = $brandModel->fetchAll($query);
    	return $brandModel;
    }
}

?>