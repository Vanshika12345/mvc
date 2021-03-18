<?php  

namespace Block\Admin\Attribute;
\Mage::loadFileByClassName('Block\Core\Template');
class Grid extends \Block\Core\Template
{
	protected $attribute = null;
	function __construct()
	{
		parent::__construct();
		$this->setTemplate('./View/admin/attribute/grid.php');
	}

	public function setAttribute($attribute = null)
	{
		if (!$attribute) {
			$attribute = \Mage::getModel('Model\Attribute');	
			$attribute = $attribute->fetchAll();
		}
		$this->attribute = $attribute;
		return $this;
	}

	public function getAttribute()
	{
		if (!$this->attribute) {
			$this->setAttribute();
		}
		return $this->attribute;
	}
}

?>