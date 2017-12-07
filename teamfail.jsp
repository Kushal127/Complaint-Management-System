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
	font-size: 14px;
	font-weight: bold;
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
			<h2 class="title"><a href="#">Welcome to Complaint Team</a></h2>
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
				  <table width="221" border="0">
                    <tr>
                      <td width="77"><strong>User name</strong></td>
                <td width="134"><label>
                        <input name="name" type="text" id="textfield" size="18" />
                      </label></td>
                    </tr>
                    <tr>
                      <td><strong>Password</strong></td>
                      <td><label>
                        <input name="pwd" type="password" id="textfield2" size="18" />
                      </label></td>
                    </tr>
                    <tr>
                      <td><strong>Role</strong></td>
                      <td><select name="role">
                      <option  value="5">ATM HANDLE </option>
                      <option value="6">BANKING </option>
                      <option value="7">ONLINE BANKING</option>
                      </select>
                      </td>
                    </tr>
                    <tr>
                    
                      <td colspan="2"><label>
                        <div align="center">
                          <input type="submit" name="button" id="button" value="Sign In" />
                          </div>
                      </label></td>
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
