<?php $shippingDetails = $this->getShippingDetails()->getData(); ?>
<?php $cart = $this->getCart(); ?>
<h4 class="mt-2 text-center">Shipping Methods</h4>
<?php if ($cart): ?>
	<?php foreach ($shippingDetails as $shippingDetail): ?>
		<input type="radio" name="shippingMethod" <?php if ($cart->shippingMethodId == $shippingDetail->shippingMethodId): ?>
			checked
		<?php endif ?> value="<?= $shippingDetail->shippingMethodId ?>"> <?= $shippingDetail->name ?> (<?= $shippingDetail->description ?> - Rs.<?= $shippingDetail->amount ?>) <br>
	<?php endforeach ?>
	<div class="form-group mt-3">
		<button class="btn btn-success" type="button" onclick="object.resetParam().setForm('#cartForm').setUrl('<?= $this->getUrl()->getUrl('updateShipping') ?>').load()">Update</button>
	</div>
<?php endif ?>