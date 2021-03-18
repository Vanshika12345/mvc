<?php
namespace Controller\Admin;
\Mage::loadFileByClassName('Controller\Core\Admin');

class Attribute extends \Controller\Core\Admin
{
	
		public function indexAction()
		{
			$layout = \Mage::getBlock('Block\Admin\Core\Layout');
			echo $this->renderLayout();
		}

		public function gridAction()
		{
			$grid = \Mage::getBlock('Block\Admin\Attribute\Grid')->toHtml();
			$response = [
				'status' => 'success',
				'message' => 'grid of attribute',
				'element' => [
					[
						'selector' => '#moduleGrid',
						'html' => $grid
					]
				]
			];

			header('Content-type: application/json');
			echo json_encode($response);
		}

		public function editAction()
		{
			$attribute = \Mage::getModel('Model\Attribute');
			if($id = $this->getRequest()->getGet('attributeId')){
				$attribute = $attribute->load($id);
				if (!$attribute) {
					throw new Exception("No Data Found");
				}
			}

			$edit = \Mage::getBlock('Block\Admin\Attribute\Edit')->setTableRow($attribute)->toHtml();

			$response = [
				'status' => 'success',
				'message' => 'grid of attribute',
				'element' => [
					[
						'selector' => '#moduleGrid',
						'html' => $edit
					]

				]

			];

			header('Content-type: application/json');
			echo json_encode($response);

		}

		public function saveAction()
		{
			
				$attribute = \Mage::getModel('Model\Attribute');
				if ($id = $this->getRequest()->getGet('attributeId')) {
					$attribute = $attribute->load($id);
					if (!$attribute) {
						$this->getMessage()->setFailure('No records Found');
					}
					$this->getMessage()->setSuccess('Records Updated Successfully');
				} else {
					$this->getMessage()->setSuccess('Records Inserted Successfully');
				}

				$attributeData = $this->getRequest()->getPost('attribute');
				$attribute->setData($attributeData);
				$attribute->save();
				$attribute->setEntityAttributes();
			$grid = \Mage::getBlock('Block\Admin\Attribute\Grid')->toHtml();
			$response = [
				'status' => 'success',
				'message' => 'grid of attribute',
				'element' => [
					[
						'selector' => '#moduleGrid',
						'html' => $grid
					]

				]
			];

			header('Content-type: application/json');
			echo json_encode($response);

		}

	
		public function deleteAction()
		{
			$id = (int)$this->getRequest()->getGet('attributeId');
			if (!$id) {
				$this->getMessage()->setFailure('Id Not Found');
			}
			$attribute = \Mage::getModel('Model\Attribute');
			$attribute->load($id);
			
			if (!$attribute->delete()) {
				$this->getMessage()->setFailure('Id Invalid');
			}
			$attribute->deleteEntity();
			$this->getMessage()->setSuccess('Record Deleted Successfully');
		
			$grid = \Mage::getBlock('Block\Admin\Attribute\Grid')->toHtml();
			$response = [
				'status' => 'success',
				'message' => 'grid of attribute',
				'element' => [
					[
						'selector' => '#moduleGrid',
						'html' => $grid
					]

				]
			];

			header('Content-type: application/json');
			echo json_encode($response);			
		}

		
}


?>