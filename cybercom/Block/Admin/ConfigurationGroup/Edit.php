<?php  

namespace Block\Admin\ConfigurationGroup;
\Mage::loadFileByClassName('Block\Core\Edit');
class Edit extends \Block\Core\Edit
{
	function __construct() {
		parent::__construct();
		$this->setTabClass(\Mage::getBlock('Block\Admin\ConfigurationGroup\Edit\Tabs'));
	}
	
	public function getTitle()
	{
		return '<h4 class="text-muted text-weight-bold">Add/Update ConfigurationGroup</h4>
		';
	}
	public function getFormUrl()
	{
		return $this->getUrl()->getUrl('save');
	}
}

?>