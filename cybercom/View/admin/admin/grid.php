<?php
$adminData = $this->getAdmin();
?>
<div class="container mx-auto m-5">
		
		<section>
			   <div class="container">
         			<h4 class="text-muted text-weight-bold">Admin</h4>
					<hr><a onclick="object.setUrl('<?php echo $this->getUrl()->getUrl('edit','admin_admin',null,true);?>').resetParam().load();" class="btn btn-success" >Add Admin</a>
				
					<br>
				<table class="table">
					<thead>
						<tr>
						<th>Id</th>
						<th>Username</th>
						<th>Status</th>
						<th>Created At</th>
						<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php
						if (!$adminData) :?>
							<tr>
						 	<td>No records found</td>
						 </tr>
						<?php else :?>	
						<?php foreach ($adminData->getData() as $key => $admin) :?>
						 <tr>
						 	<td><?php echo $admin->adminId; ?></td>
						 	<td><?php echo $admin->username; ?></td>
						 	<td><?php echo $this->getStatusName($admin); ?></td>
						 	<td><?php echo $admin->createdAt; ?></td>

						 	<td><button class='btn-warning' onclick="object.setUrl('<?php echo $this->getUrl()->getUrl('edit','admin_admin',['adminId'=>$admin->adminId],true);?>').resetParam().load();"><i class='far fa-edit'></i></button>&nbsp;&nbsp;<button class='btn-danger' onclick ="object.setUrl('<?php echo $this->getUrl()->getUrl('delete','admin_admin',['adminId'=>$admin->adminId],true); ?>').resetParam().load();"><i class='fas fa-trash-alt'></i></button>
						 	</td>
						 </tr>
						<?php endforeach; ?>
					<?php endif; ?>
			</tbody>
			</table>
		</div>
	</section>
</div>