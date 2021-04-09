<?php $customers = $this->getCustomers()->getData();?>
<div class="mt-3">
	<select class="form-control" onchange="object.resetParam().setForm('#cartForm').setUrl('<?php echo $this->getUrl()->getUrl('selectCustomer','admin_cart') ?>').setMethod('POST').load()" name="customerId">
		<option>Select Customer</option>
		<?php foreach ($customers as $key => $value): ?>
			 <option value="<?= $value->customerId ?>"><?= $value->fname ?></option>
		<?php endforeach ?>
	</select>
</div>