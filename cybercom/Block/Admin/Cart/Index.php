<?php  
namespace Block\Admin\Cart;


class Index extends \Block\Core\Template
{
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/cart/index.php');
	}
}

?>