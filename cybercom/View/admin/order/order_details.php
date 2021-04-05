<?php $orderDetails = $this->getOrder(); ?>

<table class="table mt-4 text-left">
<tr>
	<td>
		Total :
	</td>
	<td>
		<?php if ($orderDetails): ?>
			Rs.<?= $orderDetails->total ?>
		<?php else: ?>
			Rs.0.00
		<?php endif ?>
		</td>
	</tr>
	<tr>
		<td>
			Shipping Charges :
		</td>
		<td>
			<?php if ($orderDetails): ?>
				Rs.
				<?= $orderDetails->shippingAmount ?>
			<?php else: ?>
				Rs.0.00
			<?php endif ?>
		</td>
	</tr>
	<tr>
		<td>
			Grand Total :
		</td>
		<td>
			<?php if ($orderDetails): ?>
				Rs.<?= $orderDetails->total + $orderDetails->shippingAmount ?>
			<?php else: ?>
				Rs.0.00
			<?php endif ?>
		</td>
	</tr>
</table>