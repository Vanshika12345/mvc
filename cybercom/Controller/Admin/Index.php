<?php

namespace Controller\Admin;
\Mage::loadFileByClassName('Controller\Core\Admin');
class Index extends \Controller\Core\Admin
{
	
	function indexAction()
	{
		$layout = $this->getLayout();
		echo $this->renderLayout();
	}
}

?>