<?php $cartDetails = $this->getCart(); ?>

<table class="table mt-4 text-left">
	<tr>
		<td>
			Total :
		</td>
		<td>
			<?php if ($cartDetails): ?>
				$<?= $cartDetails->total ?>
			<?php else: ?>
				$0.00
			<?php endif ?>
		</td>
	</tr>
	<tr>
		<td>
			Shipping Charges :
		</td>
		<td>
			<?php if ($cartDetails): ?>
				$<?= $cartDetails->shippingAmount ?>
			<?php else: ?>
				$0.00
			<?php endif ?>
		</td>
	</tr>
	<tr>
		<td>
			Grand Total :
		</td>
		<td>
			<?php if ($cartDetails): ?>
				$<?= $cartDetails->total + $cartDetails->shippingAmount ?>
			<?php else: ?>
				$0.00
			<?php endif ?>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" class="btn btn-success" onclick="object.setUrl('<?php echo $this->getUrl()->getUrl('placeOrder','admin_cart');?>').resetParam().load();">Place Order</button>
		</td>
	</tr>
</table>