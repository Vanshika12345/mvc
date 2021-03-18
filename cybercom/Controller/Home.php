<?php
namespace Controller;
\Mage::loadFileByClassName('Controller\Core\Customer');

class Home extends Core\Customer
{
	
	function indexAction()
	{
		$layout = $this->getLayout();
		$content = $layout->getContent();
		$category = \Mage::getBlock('Block\Home\Index');
		$content->addChild($category,'content');
		echo $content->toHtml();
		
	}
}

?>