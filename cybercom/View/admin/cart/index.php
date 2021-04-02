<form action="" method="POST" id="cartForm">
	<div class="container">
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<?php echo $this->getBlock('Block\Admin\Cart\Customer')->toHtml() ?>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-md-10 offset-md-1" id="cartContent">
				<?php echo $this->getBlock('Block\Admin\Cart\Cart')->toHtml() ?>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col" style="overflow-y: scroll; height: 450px" id="productContent">
				<?php echo $this->getBlock('Block\Admin\Cart\Products')->toHtml() ?>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col col-md-10 offset-md-1" id="addressContent">
				<?php echo $this->getBlock('Block\Admin\Cart\Address')->toHtml() ?>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col col-md-5 border offset-md-1" id="shippingContent">
				<?php echo $this->getBlock('Block\Admin\Cart\Shipping')->toHtml() ?>
			</div>
			<div class="col col-md-5 border ml-3" id="paymentContent">
				<?php echo $this->getBlock('Block\Admin\Cart\Payment')->toHtml() ?>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col col-md-5 border offset-md-1" id="cartDetails">
				<?php echo $this->getBlock('Block\Admin\Cart\CartDetails')->toHtml() ?>
			</div>
		</div> 
	</div>
</form>
