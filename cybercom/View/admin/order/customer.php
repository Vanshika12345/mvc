<?php $order = $this->getOrder();?>
<?php $customer = $order->getCustomer();?>
<h4>Order Id: <?= $order->orderId; ?></h4>
<h4>Customer Name: <?= $customer->fname; ?>&nbsp;<?= $customer->lname;?></h4>