<?php 
	$paymentDetails = $this->getPaymentDetails()->getData(); 
	$cart = $this->getCart();
?>
<h4 class="mt-2 text-center">Payment Methods</h4>
<?php if ($cart): ?>
	<?php foreach ($paymentDetails as $paymentDetail): ?>
		<input type="radio" name="paymentMethod" <?php if ($cart->paymentMethodId == $paymentDetail->paymentMethodId): ?>
			checked
		<?php endif ?> value="<?= $paymentDetail->paymentMethodId ?>"> <?= $paymentDetail->name ?> <br>
	<?php endforeach ?>
	<div class="form-group mt-3">
		<button class="btn btn-success" type="button" onclick="object.resetParam().setForm('#cartForm').setUrl('<?= $this->getUrl()->getUrl('updatePayment') ?>').load()">Update</button>
	</div>
<?php endif ?>