<?php

namespace Block\Admin\ConfigurationGroup\Edit;
\Mage::loadFileByClassName('Block\Core\Edit\Tabs');
class Tabs extends \Block\Core\Edit\Tabs
{
    protected $tabs = [];
    protected $defaultTab = null;
    public function __construct()
    {
        parent::__construct();
        $this->prepareTabs();
    }

    public function prepareTabs()
    {
        $this->addTab('configurationgroup',['label'=>'ConfigurationGroup Information','block'=>'Block\Admin\ConfigurationGroup\Edit\Tabs\Form']);
        $this->addTab('configuration',['label'=>'Configuration','block'=>'Block\Admin\ConfigurationGroup\Edit\Tabs\Configurations']);
        $this->setDefaultTab('configurationgroup');
        return $this;
    }

    
}

?>