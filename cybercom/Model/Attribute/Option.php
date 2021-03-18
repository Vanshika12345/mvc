<?php
namespace Model\Attribute;
\Mage::loadFileByClassName('Model\Core\Table');

class Option extends \Model\Core\Table{

	const STATUS_ENABLED = 1;
	const STATUS_DISABLED = 0;
	
	public function __construct() {
		$this->setTableName('attribute_option');
		$this->setPrimaryKey('optionId');
	}
	
	public function getStatusOptions() {
		return  [
			self::STATUS_ENABLED =>"Enable",
			self::STATUS_DISABLED =>"Disable"
		];
	}


}

?>