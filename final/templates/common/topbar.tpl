<nav id="topbar" class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="{$BASE_URL}">ToolBox</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

  {if $USERNAME == NULL}
  	<ul id="loginButton" class="nav navbar-nav navbar-right">
  		<li><a href="pages/auth/login.php">Login</a></li>
  	</ul>
  {else}	  
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle username" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{$USERNAME}<span class="caret"></span></a>
          <ul class="dropdown-menu">
            {if $USER_TYPE == 'Client'}
              <li><a href="pages/user/user.php">Profile</a></li>
              <li><a href="pages/user/user.php#bookings">My Reservations</a></li>
              <li><a href="pages/user/user.php#history">Item History</a></li>
              <li role="separator" class="divider"></li>
            {/if}
            <li><a href="pages/user/settings.php">Account Settings</a></li>
            <li><a href="actions/auth/logout.php">Logout</a></li>
          </ul>
        </li>
      </ul>
  {/if}

      <form class="navbar-form navbar-right" method="get" role="search" action="pages/inventory/search.php">
        <div class="form-group">
          <input type="text" name="word" class="form-control" placeholder="Search" required>
        </div>
        <button type="submit" class="btn btn-default">Search</button>
      </form>

    </div>
  </div>
</nav>

