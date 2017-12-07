<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="menu">
	<ul>
		<jsp:include page="generaloptions.html"/>
	</ul>
</div>

	<h1 align="right"><jsp:include page="header.html"/></h1>
	

<hr />
<div id="page">
	<div id="content">
		<div class="post">
			<h2 class="title"><a href="#">Welcome to Customer</a></h2>
	  <div class="entry">
				<p>&nbsp;</p>
			
		  </div>
			
	  </div>
		
	</div>
	<!-- end #content -->
	<div id="sidebar">
		<ul>
			<li id="search">
				<h2>Login</h2>
				<form name=form1  action="login" >
				  <table width="206" border="0">
                    <tr>
                      <td width="82"><strong>User name</strong></td>
                      <td width="108"><label>
                      <input name="name" type="text" size="17" />
                      </label></td>
                    </tr>
                    <tr>
                      <td><strong>Password</strong></td>
                      <td><label>
                        <input name="pwd" type="password" id="textfield2" size="17" />
                      </label></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td colspan="2"><input type="hidden" value="10" name="role"/>
                        <div align="center">
                          <input type="submit" name="button" id="button" value="Sign In" />
                          </div>                      </td>
                    </tr>
                    <tr>
                      <td colspan="2"><div align="center"><a href="newuser.jsp"><font color="blue">NEW USER !!!</a></div></td>
                    </tr>
                  </table>
					
			  </form>
			</li>
			
	  </ul>
  </div>
	<!-- end #sidebar -->
</div>
<!-- end #page -->
<div id="footer">
	
</div>
</body>
</html>
