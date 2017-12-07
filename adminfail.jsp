<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script language=JavaScript>
function check()
{
	if(document.form1.name.value=="")
		alert("Enter Valid Name");	
	
	else
	if(document.form1.pwd.value=="")
		alert("Enter Valid Password");
	 
}
</script>
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 14px;
}
-->
</style>
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
			<h2 class="title"><a href="#">Welcome to Admin Login</a></h2>
<div class="entry">
				<p class="style1">Invalid username and password</p>
		  </div>
			
	  </div>
		
	</div>
	<!-- end #content -->
	<div id="sidebar">
		<ul>
			<li id="search">
				<h2>Login</h2>
				<form name=form1  action="login" onsubmit="return check()">
				  <table  border="0">
                    <tr>
                      <td width="65"><font size="3" color="#000080"><b><font face="Verdana">User ID</font></b>&nbsp;</font></td>
                      <td width="199"><input name="name" type="text" size="17" /></td>
                    </tr>
				   			   
                    <tr>
                      <td><b><font face="Verdana" size="3" color="#000080">Password</font></b></td>
                      <td><input name="pwd" type="password" size="17" /></td>
                    </tr>
				    <tr>                  
			    
				  <td height="32"><b><font face="Verdana" size="3" color="#000080">Role ID</font></b></td>
				  <td><select name="role">
                    <option  value="1">GENERAL ADMIN</option>
                    <option value="2">ATM ADMIN</option>
                    <option value="3">BANKING ADMIN</option>
                    <option value="4">ONLINE ADMIN</option>
                  </select></td>
                  </tr>
                  <tr>
                    <td colspan="2">
                      <div align="center">
                        <input type="submit" name="button" id="button" value="Submit" />
                      </div>
                    </td>
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
