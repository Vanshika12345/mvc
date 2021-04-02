<?php $shipping = $this->getCartShippingAddress(); ?>
<?php $billing = $this->getCartBillingAddress(); ?>

<div class="row">
	<div class="col p-4 border">
		<h4>Billing Address</h4>
		<?php if($billing): ?>
			<div class="form-group">
			    <label for="address">Address</label>
			    <textarea class="form-control" name="billing[address]" id="address">
			        <?=$billing->address;?>
			    </textarea>
			</div>
			<div class="form-group">
			    <label for="city">City</label>
			    <input type="text" class="form-control" placeholder="Enter City" id="city" name="billing[city]" value="<?=$billing->city?>">
			</div>
			<div class="form-group">
			    <label for="state">State:</label>
			    <input type="text" class="form-control" placeholder="Enter state" id="state" name="billing[state]" value="<?=$billing->state?>">
			</div>
			<div class="form-group">
			    <label for="zipcode">ZipCode:</label>
			    <input type="text" class="form-control" placeholder="Enter zipcode" id="zipcode" name="billing[zipcode]" value="<?=$billing->zipcode?>">
			</div>
			<div class="form-group">
			    <label for="country">Country:</label>
			    <input type="text" class="form-control" placeholder="Enter country" id="country" name="billing[country]" value="<?=$billing->country?>">
			</div>
			<input type="checkbox" id="billingAddressBook" name="billingAddressBook"> Save In AddressBook
			<div class="form-group mt-3">
			    <button class="btn btn-success" type="button" onclick="object.resetParam().setForm('#cartForm').setUrl('<?= $this->getUrl()->getUrl('updateAddress',null,['type' => 'billing']) ?>').load()">Update</button>
			</div>
		<?php endif; ?>
	</div>
	<div class="col ml-4 p-4 border">
		<h4>Shipping Address</h4>
		<?php if ($shipping): ?>

			<input type="checkbox" id="sameAsBilling" name="sameAsBilling"> Same as Billing 

			<div class="form-group mt-2">
			    <label for="address">Address</label>
			    <textarea class="form-control" name="shipping[address]" id="address">
			        <?=$shipping->address;?>
			    </textarea>
			</div>
			<div class="form-group">
			    <label for="city">City</label>
			    <input type="text" class="form-control" placeholder="Enter City" id="city" name="shipping[city]" value="<?=$shipping->city?>">
			</div>
			<div class="form-group">
			    <label for="state">State:</label>
			    <input type="text" class="form-control" placeholder="Enter state" id="state" name="shipping[state]" value="<?=$shipping->state?>">
			</div>
			<div class="form-group">
			    <label for="zipcode">ZipCode:</label>
			    <input type="text" class="form-control" placeholder="Enter zipcode" id="zipcode" name="shipping[zipcode]" value="<?=$shipping->zipcode?>">
			</div>
			<div class="form-group">
			    <label for="country">Country:</label>
			    <input type="text" class="form-control" placeholder="Enter country" id="country" name="shipping[country]" value="<?=$shipping->country?>">
			</div>	
			<input type="checkbox" id="shippingAddressBook" name="shippingAddressBook"> Save In AddressBook
			<div class="form-group mt-3">
			    <button class="btn btn-success" type="button" onclick="object.resetParam().setForm('#cartForm').setUrl('<?= $this->getUrl()->getUrl('updateAddress',null,['type' => 'shipping']) ?>').load()">Update</button>
			</div>
		<?php endif ?>
	</div>
</div>