<?php $order = $this->getOrder();?>
<?php if($order):?>
<?php $customer = $order->getCustomer();?>
<h4>Order Id: <?php  echo $order->orderId; ?></h4>
<h4>Customer Name: <?php echo $customer->fname; ?>&nbsp;<?= $customer->lname;?></h4>
<?php endif;?>