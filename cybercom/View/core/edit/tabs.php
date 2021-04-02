
<?php

$tabs = $this->getTabs();
foreach($tabs as $key => $tab) : ?>
<div class="container mt-5">

<a class="bg-success text-white w-100 p-3" onclick="object.setUrl('<?php echo $this->getUrl()->getUrl(null,null,['tab'=>$key],false);?>').resetParam().load();" href="javascript:void(0);"><?php echo $tab['label'];?></a>

</div>

<?php endforeach;?>

