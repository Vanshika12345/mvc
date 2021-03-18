<?php
namespace Block\Customer;
\Mage::loadFileByClassName('Block\Core\Layout');
class Layout extends \Block\Core\Layout
{
    public function __construct()
    {
        $this->setTemplate('./View/customer/layout.php');
        $this->prepareChildren();
    }
    
    
}


?>