<?php $customers = $this->getCustomers()->getData();?>

<div>
	<select class="form-control" onchange="object.resetParam().setForm('#cartForm').setUrl('<?php echo $this->getUrl()->getUrl('selectCustomer','admin_cart') ?>').load()" name="customerId">
		<option>Select Customer</option>
		<?php foreach ($customers as $key => $customer): ?>
			 <option value="<?= $customer->customerId ?>"><?= $customer->fname ?></option>
		<?php endforeach ?>
	</select>
</div>