<?php $cart = $this->getCart(); ?>
<?php if ($cart): ?>
	<?php $items = $cart->getCartItems();?>
	<table class="table">
		<tr>
			<td colspan="4"></td>
			<td><button type="button" class="btn btn-success" onclick="object.resetParam().setForm('#cartForm').setUrl('<?= $this->getUrl()->getUrl('update','admin_cart') ?>').load()">Update Cart</button></td>
		</tr>
		<tr>
			<th>Product Name</th>
			<th>Quantity</th>
			<th>Base Price</th>
			<th>Price</th>
			<th>Discount</th>
			<th>Delete</th>
		</tr>
		
		<?php if ($items->count()): ?>
			<?php foreach ($items->getData() as $item): ?>
				<tr>
					<td><?= $item->getProduct()->name ?></td>
					<td><input type="number" class="form-control" name="quantity[<?= $item->cartItemId ?>]" value="<?= $item->quantity ?>"></td>
					<td><?= $item->basePrice; ?></td>
					<td><input type="text" class="form-control" name="price[<?= $item->cartItemId ?>]" value="<?= $item->price ?>"></td>
					<td><?= $item->discount * $item->quantity ?></td>
					<td><button type="button" class="btn btn-danger" onclick="object.resetParam().setUrl('<?= $this->getUrl()->getUrl('delete','admin_cart',['id' => $item->cartItemId]) ?>').load()">&times;</button></td>
				</tr>
			<?php endforeach ?>	
			<!-- <tr>
				<td colspan="3"></td>
				<td>Total :</td>
				<td>0.0</td>
			</tr> -->
		<?php else: ?>
			<tr>
				<td colspan="5" class="text-center">Cart is Empty</td>
			</tr>	
		<?php endif ?>
		
	</table>
<?php endif ?>

