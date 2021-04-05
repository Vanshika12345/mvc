<?php
namespace Controller\Admin;


class ConfigurationGroup extends \Controller\Core\Admin
{
	
		public function indexAction()
		{
			$layout = \Mage::getBlock('Block\Admin\Core\Layout');
			echo $this->renderLayout();
		}

		public function gridAction()
		{
			$grid = \Mage::getBlock('Block\Admin\ConfigurationGroup\Grid')->toHtml();
			$response = [
				'status' => 'success',
				'message' => 'grid of configurationGroup',
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
			try{
			$configurationGroup = \Mage::getModel('Model\ConfigurationGroup');
			if($id = $this->getRequest()->getGet('configurationGroupId')){
				$configurationGroup = $configurationGroup->load($id);
				if (!$configurationGroup) {
					throw new \Exception("No Data Found");
				}
			}

			$edit = \Mage::getBlock('Block\Admin\ConfigurationGroup\Edit')->setTableRow($configurationGroup)->toHtml();

			$response = [
				'status' => 'success',
				'message' => 'grid of configurationGroup',
				'element' => [
					[
						'selector' => '#moduleGrid',
						'html' => $edit
					]

				]

			];

			header('Content-type: application/json');
			echo json_encode($response);
		}catch(\Exception $e) {
			echo $e->getMessage();
		}
		}

		public function saveAction()
		{
			try{
				$configurationGroup = \Mage::getModel('Model\ConfigurationGroup');
				if ($id = $this->getRequest()->getGet('configurationGroupId')) {
					$configurationGroup = $configurationGroup->load($id);
					if (!$configurationGroup) {
						$this->getMessage()->setFailure('No records Found');
					}
					$this->getMessage()->setSuccess('Records Updated Successfully');
				} else {
					$this->getMessage()->setSuccess('Records Inserted Successfully');
				}

				$configurationGroupData = $this->getRequest()->getPost('configurationGroup');
				$configurationGroup->setData($configurationGroupData);
				$configurationGroup->save();
			$grid = \Mage::getBlock('Block\Admin\ConfigurationGroup\Grid')->toHtml();
			$response = [
				'status' => 'success',
				'message' => 'grid of configurationGroup',
				'element' => [
					[
						'selector' => '#moduleGrid',
						'html' => $grid
					]

				]
			];

			header('Content-type: application/json');
			echo json_encode($response);
		}catch(\Exception $e) {
			echo $e->getMessage();
		}

		}

	
		public function deleteAction()
		{
			try{
			$id = (int)$this->getRequest()->getGet('configurationGroupId');
			if (!$id) {
				$this->getMessage()->setFailure('Id Not Found');
			}
			$configurationGroup = \Mage::getModel('Model\ConfigurationGroup');
			$configurationGroup->load($id);
			if (!$configurationGroup->delete()) {
				$this->getMessage()->setFailure('Id Invalid');
			}	
			
			$this->getMessage()->setSuccess('Record Deleted Successfully');
		
			$grid = \Mage::getBlock('Block\Admin\ConfigurationGroup\Grid')->toHtml();
			$response = [
				'status' => 'success',
				'message' => 'grid of configurationGroup',
				'element' => [
					[
						'selector' => '#moduleGrid',
						'html' => $grid
					]

				]
			];

			header('Content-type: application/json');
			echo json_encode($response);			
		}catch(\Exception $e) {
			echo $e->getMessage();
		}
		}


		public function filterAction()
		{
			$filters = $this->getRequest()->getPost('filter');
			
			$filterModel = \Mage::getModel('Model\Admin\Filter');
			$filterModel->setFilter($filters);
			
			$gridHtml = \Mage::getBlock('Block\Admin\ConfigurationGroup\Grid')->toHtml();
				$response = [
					'status' => 'success',
					'message' => 'you did it',
					'element' => [
						[
							'selector' => '#moduleGrid',
							'html' => $gridHtml
						]
					]
			];

			header("Content-type: application/json; charset=utf-8");
			echo json_encode($response);
	    }

		

		
}


?>