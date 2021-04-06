<?php $customers = $this->getCustomers()->getData();?>
<div class="mt-3">
	<select class="form-control" onchange="object.resetParam().setForm('#cartForm').setUrl('<?php echo $this->getUrl()->getUrl('selectCustomer','admin_cart') ?>').load()" name="customerId">
		<option>Select Customer</option>
		<?php foreach ($customers as $key => $value): ?>
			 <option value="<?= $value->customerId ?>"><?= $value->fname ?></option>
		<?php endforeach ?>
		<?php if($this->getCart()):?>
			<?php $customer = $this->getCart()->getCustomer();?>
			<?php foreach ($customers as $key => $value): ?>
			 <option value="<?= $value->customerId ?>" <?php if($value->customerId == $customer->customerId):?>selected <?php endif;?>><?= $value->fname ?></option>
		<?php endforeach; ?>
	<?php endif;?>
	</select>
</div>