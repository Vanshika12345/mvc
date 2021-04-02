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

    public function prepareChildren()
    {
        $this->addChild($this->getBlock('Block\Customer\Layout\Content'),'content');
        $this->addChild($this->getBlock('Block\Customer\Layout\Header'),'header');
        $this->addChild($this->getBlock('Block\Customer\Layout\Left'),'left');
        $this->addChild($this->getBlock('Block\Customer\Layout\Right'),'right');
        $this->addChild($this->getBlock('Block\Customer\Layout\Footer'),'footer');
    
    }

    public function getContent()
    {
        return $this->getChild('content');
    }

    
    public function getHeader()
    {
        return $this->getChild('header');
    }

    
    public function getLeft()
    {
        return $this->getChild('left');
    }

    
    public function getRight()
    {
        return $this->getChild('right');
    }

    public function getFooter()
    {
        return $this->getChild('footer');
    }
    
    
}


?>