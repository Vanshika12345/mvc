<?php $customers = $this->getCustomers()->getData();?>
<?php $customer = $this->getCart()->getCustomer();?>
<div class="mt-3">
	<select class="form-control" onchange="object.resetParam().setForm('#cartForm').setUrl('<?php echo $this->getUrl()->getUrl('selectCustomer','admin_cart') ?>').load()" name="customerId">
		<option>Select Customer</option>
		<?php foreach ($customers as $key => $value): ?>
			 <option value="<?= $value->customerId ?>" <?php if($customer):?><?php if($customer->customerId == $value->customerId):?>selected<?php endif;?><?php endif;?>><?= $value->fname ?></option>
		<?php endforeach ?>
	</select>
</div>