<?php $cartItems = $this->getCart()->getItems(); ?>
<?php $customers = $this->getCustomers(); ?>
<?php $customer = $this->getCart()->getCustomer(); ?>
<?php $billingAddress = $this->getBillingAddress(); ?>
<?php $shippingAddress = $this->getShippingAddress(); ?>
<?php $paymentMethod = $this->getCart()->getPaymentMethod();?>
<form action="" id="cartForm">
<div class="container mx-auto m-5">
	<section>
		  <div class="container">
     			<div>
					<select name="customer" class="form-control" id="customer">
						<option value="">Select</option>
						<?php foreach ($customers as $key => $value) :?>
							<option value="<?= $value->customerId?>"<?php if($customer):?><?php if($value->customerId == $customer->customerId):?>selected <?php endif;?><?php endif;?>><?= $value->fname;?></option>
						<?php endforeach; ?>
					</select>
					
					<button type="button" onclick="object.setUrl('<?php echo $this->getUrl()->getUrl('selectCustomer','admin_cartCont');?>').resetParam().setParams($('#cartForm').serializeArray()).setMethod('POST').load()" class="btn btn-primary">Go</button>
				
				</div>
				
				<hr><a onclick="object.setUrl('<?php echo $this->getUrl()->getUrl('grid','admin_product',null,true);?>').resetParam().load();" class="btn btn-success">Back To items</a>
				
				<a onclick="object.setUrl('<?php echo $this->getUrl()->getUrl('update','admin_cart');?>').resetParam().setParams($('#cartForm').serializeArray()).setMethod('POST').load();" class="btn btn-success">Update item</a>
			</div>	
			<div class="container mt-5">
				<div class="form-row">
				<div class="col">
					<h4 class="text-muted text-weight-bold">Billing Form</h4>
					<?php if($billingAddress):?>
					<div class="form-group">
						<input type="text" name="billingAddress[address]" class="form-control" placeholder="Address" value="<?= $billingAddress->address;?>">
					</div>
					<div class="form-group">
						<input type="text" name="billingAddress[country]" class="form-control" placeholder="Country" value="<?= $billingAddress->country;?>">
					</div>
					<div class="form-group">
						<input type="text" name="billingAddress[state]" class="form-control" placeholder="State" value="<?= $billingAddress->state;?>">
					</div>
					<div class="form-group">
						<input type="text" name="billingAddress[city]" class="form-control" placeholder="City" value="<?= $billingAddress->city;?>">
					</div>
					<div class="form-group">
						<input type="text" name="billingAddress[zipcode]" class="form-control" placeholder="Zipcode" value="<?= $billingAddress->zipcode;?>">
					</div>
					<div>
						<input type="checkbox" name="saveInaddress"> Save in address book
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary" onclick="object.setUrl('<?php echo $this->getUrl()->getUrl('saveBillingAddress','admin_cart');?>').resetParam().setParams($('#cartForm').serializeArray()).setMethod('POST').load();">Save</button>
					</div>
				<?php endif; ?>
				</div>		
				<div class="col">
					<h4 class="text-muted text-weight-bold">Shipping Form</h4>
					<?php if($shippingAddress):?>
					<div class="form-group">
						<input type="text" name="shippingAddress[address]" class="form-control" placeholder="Address" value="<?= $shippingAddress->address; ?>">
					</div>
					<div class="form-group">
						<input type="text" name="shippingAddress[country]" class="form-control" placeholder="Country" value="<?= $shippingAddress->country; ?>">
					</div>
					<div class="form-group">
						<input type="text" name="shippingAddress[state]" class="form-control" placeholder="State" value="<?= $shippingAddress->state; ?>">
					</div>
					<div class="form-group">
						<input type="text" name="shippingAddress[city]" class="form-control" placeholder="City" value="<?= $shippingAddress->city; ?>">
					</div>
					<div class="form-group">
						<input type="text" name="shippingAddress[zipcode]" class="form-control" placeholder="Zipcode" value="<?= $shippingAddress->zipcode; ?>">
					</div>
					<div>
						<input type="checkbox" name="saveInaddress"> Save in address book
					</div>
					<div>
						<input type="checkbox" name="shippingAddress[sameAsBilling]" value=""> Same As Billing
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary" onclick="object.setUrl('<?php echo $this->getUrl()->getUrl('saveShippingAddress','admin_cart'); ?>').resetParam().setParams($('#cartForm').serializeArray()).setMethod('POST').load();">Save</button>
					</div>
				<?php endif; ?>
				</div>
			</div> 
		</div>

		<div class="container">
			<h4 class="text-muted text-weight-bold">Cart</h4>	
		<br>
		<table class="table">
			<thead>
					<tr>
						<th>Cart Id</th>
						<th>Product Id</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Row Total</th>
						<th>Discount</th>
						<th>Grand Total</th>
						<th>Action</th>
					</tr>
			</thead>
			<tbody>
					<?php //if($customer):?>
					<?php if($cartItems):?>
					<?php foreach ($cartItems->getData() as $key => $item) :?>
					 <tr>
					 	<td><?php echo $item->cartItemId; ?></td>
					 	<td><?php echo $item->productId;?></td>
					 	<td><input type="number" name="quantity[<?php echo $item->cartItemId; ?>]" class="form-control" value="<?php echo $item->quantity;?>"></td>
					 	<td><?php echo $item->price;?></td>
					 	<td><?php echo $item->quantity * $item->price; ?></td>
					 	<td><?php echo $item->discount* $item->quantity; ?></td>
					 	<td><?php echo ($item->quantity * $item->price)- $item->discount;?></td>
					 	<td><button type="button" class='btn-danger' onclick ="object.setUrl('<?php echo $this->getUrl()->getUrl('delete','admin_cart',['itemId'=>$item->cartItemId],true); ?>').resetParam().load();"><i class='fas fa-trash-alt'></i></button>
				 		</td>
				 	</tr>
					<?php endforeach; ?>
				<?php endif; ?>
			<?php // endif; ?>
			</tbody>
		</table>
		</div>
	</section>
</div>
</form>
<?php //$payment = $this->getCart()->getPaymentMethod()->getData(); ?>
<?php //$shipping = $this->getCart()->getShippingMethod()->getData(); ?>
<?php //cartmodel shipping and payemntId //Grid me billing and shipping address?>
<!-- 		<div class="container mt-5">
			<div class="form-row">
				<div class="col">	
					<h4 class="text-muted text-weight-bold">Payment Method</h4>
					<div class="form-group">
						<?php //foreach ($payment as $key => $value): ?>
						<input type="radio" name="cart[paymentMethodId]" value="<?= $value->paymentMethodId?>" placeholder="Address">&nbsp;&nbsp;<label><?= $value->name; ?></label><br>
					<?php //endforeach; ?>
					</div>
				</div>
				<div class="col">	
					<h4 class="text-muted text-weight-bold">Shipping Method</h4>
					<div class="form-group">
						<?php //foreach ($shipping as $key => $value): ?>
						<input type="radio" name="cart[shippingMethodId]" value="<?= $value->shippingMethodId?>" placeholder="Address">&nbsp;&nbsp;<label><?= $value->name; ?></label><br>
					<?php// endforeach; ?>
					</div>
				</div> -->