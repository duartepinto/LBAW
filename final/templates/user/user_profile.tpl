<html>
{include file='common/header.tpl'}
<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/inventory/item.css">


<body>
	{include file='common/topbar.tpl'}
	
	<div class="container-fluid">
	    <div class="row">
	      	{include file='common/sidebar.tpl'}
	    	
	    	<div class="col-sm-0 col-sm-offset-3 col-md-0 col-md-offset-2 main">
	    		<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Users</a></li>
					<li class="active">{$USERNAME}</li>
				</ol>
				<div>
					<!-- Nav tabs -->
					<div class="row">
						<ul class="nav nav-tabs nav-justified" role="tablist">
							<li role="presentation" class="active"><a href="#profile" aria-controls="info" role="tab" data-toggle="tab">Info</a></li>
							<li role="presentation"><a href="#bookings" aria-controls="info" role="tab" data-toggle="tab">Bookings</a></li>
							<li role="presentation"><a href="#history" aria-controls="info" role="tab" data-toggle="tab">History</a></li>
						</ul>
					</div>

					<div class="tab-content">
						<div id="profile" class="tab-pane fade in active">
							<div class="row" id="item-pane">
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="info">
										<div class="row">
											<div class="col-sm-4">
												<a href="#" class="thumbnail">
													{if $PICTURE == NULL}
													<img src="images/users/teste.png" alt="User_Photo" class="img-thumbnail">
													{else}
													<img src="images/users/{$PICTURE}" alt="User_Photo" class="img-thumbnail">
													{/if}
												</a>
											</div>
											<div class="col-sm-4">
												<div class="panel panel-default">
													<div class="panel-heading">
														<h3 class="panel-title">{$USER}</h3>
													</div>
													<div class="panel-body">
														<p><strong>Address: </strong>{$ADDRESS}</p>
														<p><strong>Phone: </strong>{$PHONE}</p>
														<p><strong>E-mail: </strong>   {mailto address=$EMAIL}</a></p>
														<p><strong>CIVIL ID No: </strong>{$IDCARD}</p>
  
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="bookings" class="tab-pane fade">
							<div class="table-responsive">
					            <table class="table table-striped">
					              <thead>
					                  <tr>
					                    <th>Name</th>
					                    <th>Category</th>
					                    <th>Sub-Category</th>
					                    <th>Start Date</th>
					                    <th>Due Date</th>
					                    <th>Action</th>
					                  </tr>
					              </thead>
					              <tbody id="bookings-body">
					                <tr>
					                  <td><a href="{$BASE_URL}pages/inventory/item.php">Hammer</a></td>
					                  <td><a href="#">Tools</a></td>
					                  <td><a href="#">Hand Tools</a></td>
					                  <td>12/03/2016</td>
					                  <td>14/03/2016</td>
					                  <td>Edit</td>
					                  <td><a href="" title="Remove Booking"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
					                </tr>
					                <tr>
					                  <td><a href="#">Item 2</a></td>
					                  <td><a href="#">Tools</a></td>
					                  <td><a href="#">Power Tools</a></td>
					                  <td>14/03/2016</td>
					                  <td>14/03/2016</td>
					                  <td>Edit</td>
										<td><a href="" title="Remove Booking"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
					                </tr>
					                <tr>
					                  <td><a href="#">Item 3</a></td>
					                  <td><a href="#">Tools</a></td>
					                  <td><a href="#">Hand Tools</a></td>
					                  <td>15/03/2016</td>
					                  <td>16/03/2016</td>
					                  <td>Edit</td>
										<td><a href="" title="Remove Booking"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
					                </tr>               
					              </tbody>
					            </table>
					          </div>
					        </div>

					    <div id="history" class="tab-pane fade">
							<div class="table-responsive">
					            <table class="table table-striped">
					              <thead>
					                  <tr>
					                    <th>Date</th>
					                    <th>Type</th>
					                    <th>Name</th>
					                    <th>Category</th>
					                    <th>Sub-Category</th>
					                  </tr>
					              </thead>
					              <tbody id="history-body">
					                <tr>
					                  <td><a href="{$BASE_URL}pages/inventory/item.php">Hammer</a></td>
					                  <td><a href="#">Tools</a></td>
					                  <td><a href="#">Hand Tools</a></td>
					                  <td>10/03/2016</td>
					                  <td>12/03/2016</td>
					                </tr>
					                <tr>
					                  <td><a href="#">Item 2</a></td>
					                  <td><a href="#">Tools</a></td>
					                  <td><a href="#">Power Tools</a></td>
					                  <td>11/03/2016</td>
					                  <td>11/03/2016</td>
									</tr>
					                <tr>
					                  <td><a href="#">Item 3</a></td>
					                  <td><a href="#">Tools</a></td>
					                  <td><a href="#">Hand Tools</a></td>
					                  <td>12/03/2016</td>
					                  <td>13/03/2016</td>
									</tr>               
					              </tbody>
					            </table>
					            <nav>
								  <ul id="pagination" class="pagination">
								    <li class="disabled">
								      <a href="#" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
								    <li class="active"><a href="#">1</a></li>
								    <li>
								      <a href="#" aria-label="Next">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
								  </ul>
								</nav>
					          </div>
					        </div>

					    </div>
				</div>
			</div>
		</div>
	</div>
	<script src="{$BASE_URL}lib/jquery-1.12.1.min.js"></script>
	<script src="{$BASE_URL}lib/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">username = '{$USERNAME}'</script>
	<script src="{$BASE_URL}javascript/user/user_profile.js"></script>
</body>
</html>