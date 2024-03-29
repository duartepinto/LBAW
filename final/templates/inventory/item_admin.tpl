{extends file="common/main.tpl"}

{block name="title"} {$item.name} Item Page {/block}
{block name="css" append}
	<link rel="stylesheet" type="text/css" href="css/inventory/item.css">
{/block}

{block name="content"}
	{function name=print_stars}
		{for $i = 1 to $n_stars}
			<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
		{/for}
		{for $i = $n_stars + 1 to 5}
			<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
		{/for}
	{/function}
	{include file='common/topbar.tpl'}
	<div class="container-fluid">
	    <div class="row">
	      	{include file='common/sidebar.tpl'}	
	    	<div class="col-sm-0 col-sm-offset-3 col-md-0 col-md-offset-2 main">
	    		<ol class="breadcrumb">
					<li><a href="">Home</a></li>
					<li><a href="pages/inventory/category.php?category={$item.category|escape:'url'}">{$item.category}</a></li>
					<li><a href="pages/inventory/subcategory.php?category={$item.category|escape:'url'}&amp;subcategory={$item.subcategory|escape:'url'}">{$item.subcategory}</a></li>
					<li class="active">{$item.name}</li>
				</ol>
				<div>
					<!-- Nav tabs -->
					<div class="row">
						<ul class="nav nav-tabs nav-justified" role="tablist">
							<li role="presentation" class="active"><a href="#info" aria-controls="info" role="tab" data-toggle="tab">Info</a></li>
							<li role="presentation"><a href="#history" aria-controls="history" role="tab" data-toggle="tab">History</a></li>
							<li role="presentation"><a href="#instances" aria-controls="instances" role="tab" data-toggle="tab">Instances</a></li>
						</ul>
					</div>

					<!-- Tab panes -->
					<div class="row" id="item-pane">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="info">
								<div class="row">
									<div class="col-sm-6">
										<a href="#" class="thumbnail">
											<img src="images/res/{$item.picture}" alt="{$item.name}" class="img-thumbnail">
										</a>
									</div>
									<div class="col-sm-6">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h3 class="panel-title">{$item.name}</h3>
											</div>
											<div class="panel-body">
												{$item.description}
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div role="tabpanel" class="tab-pane" id="history">
								{include file="inventory/item_history.tpl"}
							</div>
							<div role="tabpanel" class="tab-pane" id="instances">
								{include file="inventory/item_instances.tpl"}
							</div>
						</div>
						<div role="tabpanel" class="tab-pane" id="settings">...</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="add-instance-modal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              	<span aria-hidden="true">&times;</span>
              </button>
              <h4 class="modal-title">Add Instance</h4>
            </div> 
            <div class="modal-body">
              <form id="add-instance-form" action="actions/management/create_instance.php" method="post">
              	<input type="hidden" name="id-item" value="{$item['id']}">
              </form>
              <label>Condition</label>
            	<select name="condition" form="add-instance-form">
              		<option value="1">1</option>
              		<option value="2">2</option>
              		<option value="3">3</option>
              		<option value="4">4</option>
              		<option value="5">5</option>
              </select>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary submit_form_button">Add Instance</button>
	      </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	  </div><!-- /.modal -->
	 </div>
{/block}
{block name="js" append} 
<script src="javascript/management/item_instances.js"></script>
{/block}

