<?php $attributes = $this->getProductAttribute()->getData();?>
<?php $options = $this->getAttributeOptions(); ?>
<?php $id = $this->getRequest()->getGet('productId'); ?>
<div class="container">
<h4>Product Attribute:</h4>

<?php foreach ($attributes as $attribute): ?>
<div class="form-group">
		<label><?php echo $attribute->name;?></label>
		<?php if ($attribute->inputType == "select"): ?>
			<select name="productAttribute[<?= $attribute->code; ?>]" class="form-control">
				<?php foreach ($options->getData() as $option): ?>
					<?php if($option->attributeId == $attribute->attributeId):?>
					<option value="<?= $option->optionId; ?>">
						<?= $option->name; ?>
					</option>
					<?php endif; ?>
				<?php endforeach; ?>
			</select>
	</div>
	<div>
	<?php elseif($attribute->inputType == "radio"): ?>
		<?php foreach ($options->getData() as $option): ?>
				<?php if($option->attributeId == $attribute->attributeId):?>
					<input type="radio" name="productAttribute[<?= $attribute->code; ?>]" value="<?= $option->name; ?>" class="form-control">
				<?php endif; ?>
		<?php endforeach; ?>
	</div>
	<div>
	<?php elseif ($attribute->inputType == "checkbox") :?>
		<?php foreach ($options->getData() as $option): ?>
				<?php if($option->attributeId == $attribute->attributeId):?>
					<td><input type="checkbox" name="productAttribute[<?= $attribute->code; ?>]" value="<?= $option->name; ?>" class="form-control"></td>
				<?php endif; ?>
		<?php endforeach; ?>
	</div>
	<div>
	<?php elseif ($attribute->inputType == "text") :?>
		<?php foreach ($options->getData() as $option): ?>
				<?php if($option->attributeId == $attribute->attributeId):?>
					<td><input type="text" name="productAttribute[<?= $attribute->code; ?>]" value="<?= $option->name; ?>" class="form-control"></td>
				<?php endif; ?>
		<?php endforeach; ?>
	</div>
	<div>
		<?php elseif ($attribute->inputType == "textarea") :?>
		<?php foreach ($options->getData() as $option): ?>
				<?php if($option->attributeId == $attribute->attributeId):?>
					<td><textarea name="productAttribute[<?= $attribute->code; ?>]"><?php echo $option->name; ?></textarea class="form-control"></td>
				<?php endif; ?>
		<?php endforeach; ?>
	</div>
	<?php endif; ?>
<?php endforeach ?>

<div class="form-group">
<button type="button" onclick="object.setUrl('<?php echo $this->getUrl()->getUrl('save','admin_product',['productId'=>$id]); ?>').resetParam().setParams($('#editForm').serializeArray()).setMethod('POST').load();" name="save" class="btn btn-success">Save</button>
</div>
</div>