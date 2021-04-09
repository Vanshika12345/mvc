<div class="container">
	<div class="row mt-4">
		<div class="col-md-10 offset-md-1">
			<?php echo $this->getBlock('Block\Admin\Order\Customer')->toHtml() ?>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col" style="overflow-y: scroll; height: 200px" id="orderProductContent">
			<?php echo $this->getBlock('Block\Admin\Order\Products')->toHtml() ?>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col col-md-10 offset-md-1" id="productAddressContent">
			<?php echo $this->getBlock('Block\Admin\Order\Address')->toHtml() ?>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col col-md-5 border offset-md-1" id="productOrderDetails">
			<?php echo $this->getBlock('Block\Admin\Order\OrderDetails')->toHtml() ?>
		</div>
	</div>

</div>

<?php
/*
<div class="container">
    <h4 class="text-muted text-weight-bold">Order Details</h4>
	<hr>
	<br>
	<table class="table">
		<thead>
			<tr>
				<th>Order Id: <?= $order->orderId; ?></th>
				<th>Customer Name: <?= $customer->fname; ?>&nbsp;<?= $customer->lname;?></th>
			</tr>
					
					
		</thead>	
	</table>	
</div>


<div class="container mx-auto m-5">
	<section>
		   <div class="container">
     			<h4 class="text-muted text-weight-bold">Order Details</h4>
				<hr>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th>Order Id: <?= $order->orderId; ?></th>
						<th>Customer Name: <?= $customer->fname; ?>&nbsp;<?= $customer->lname;?></th>
					</tr>
					
					
				</thead>
				<tbody>
						<td>Product Details</td>
					<tr>
						<?php foreach($itemName->getData() as $key => $name):?>
							
							<td><?= $name->productName;?></td>

						<?php endforeach; ?>
					</tr>
						
					<tr>
						<?php foreach($itemPrice->getData() as $key => $price):?>
							
							<td>Rs.<?= $price->price; ?></td>
						
						<?php endforeach; ?>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
</div> */
?>