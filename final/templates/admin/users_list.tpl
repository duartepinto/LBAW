{extends file="common/main.tpl"}


{block name="title"} Users List {/block}
{block name="css" append}
  <link rel="stylesheet" type="text/css" href="{$BASE_URL}css/admin/admin_user_list.css">
{/block}

{block name="content"}
	{include file='common/topbar.tpl'}

	<div class="container-fluid">
    <div class="row">
      {include file='common/sidebar.tpl'}
      <div class="col-sm-0 col-sm-offset-3 col-md-0 col-md-offset-2 main">
        <div class="generic-element">
          <div class="table-top-header">
            <h2 class="sub-header">Users List</h2>
            <button id="add-user-button" type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#add-user-modal" data-whatever="@getbootstrap">           
              <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Inventory Manager
            </button>
          </div>
          <div class="table-responsive">
            <table id="active-users" class="table table-striped">
              <thead>
                  <tr>
                    <th>#</th>
                    <th>Account Type</th>
                    <th></th>
                  </tr>
              </thead>
              <tbody>                
              </tbody>
            </table>
          </div>

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
        
        <div class="generic-element">
          <h2 class="sub-header">Blocked Users</h2>
          <div class="table-responsive">
            <table id="banned-users" class="table table-striped">
              <thead>
                  <tr>
                    <th>#</th>
                    <th>Account Type</th>
                    <th></th>
                  </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
          </div>
            <nav>
              <ul id="pagination-banned" class="pagination">
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
      <div id="add-user-modal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">Add Inventory Manager</h4>
            </div> 
            <div class="modal-body">
              <form id="add-user-form" action="{$BASE_URL}api/admin/create_inventory_manager.php" method="post">
                <p>Email:</p>
                <input type="email" name="email" required>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" id="submit_form_button" class="btn btn-primary">Send registration email</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->
    </div>
  </div>
{/block}
{block name="js-code" append}
  {if $ERROR_MESSAGES != NULL}
    <script>alert('{$ERROR_MESSAGES[0]}');</script>
  {/if}
{/block}

{block name="js" append}
  <script src="{$BASE_URL}lib/jquery.validate.js"></script>
  <script src="https://cdn.rawgit.com/alertifyjs/alertify.js/v1.0.10/dist/js/alertify.js"></script>
  <script src="{$BASE_URL}javascript/admin/users_list.js"></script>
{/block}