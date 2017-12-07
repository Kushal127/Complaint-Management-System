<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<%String role=(String)session.getAttribute("roleid");%>
<div id="menu">
<ul>
   <% if(role.equals("1")){%>
		<jsp:include page="gadminoptions.html"/>
      <%}%>  
      <% if(role.equals("2")){%>
		<jsp:include page="gadminoptions.html"/>
      <%}%>  
	
    <% if(role.equals("3")){%>
		<jsp:include page="gadminoptions.html"/>
      <%}%>  
	
    <% if(role.equals("4")){%>
		<jsp:include page="gadminoptions.html"/>
      <%}%>  
	
	</ul>
</div>

	<h1 align="right"><jsp:include page="header.html"/></h1>
	

<hr />
<div id="page">
	<div id="content1">
		<div class="post">
			<h2 class="title">&nbsp;</h2>
	        <div class="entry">
				<form name=form1  action="addasso">
				  <fieldset>
                    <legend><span class="style1">Add Associate</span></legend>
				    <div align="center">
				      <p>&nbsp;</p>
				      <table width="350">
                        <tr>
                          <td><font size="3" color="#000080">
                          <div align="left"><b><font face="Verdana"> Name </font></b> </div></td>
                          <td><input type="text" name="name" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080">
                          <div align="left"><b><font face="Verdana">Login Id</font></b> </div></td>
                          <td><input type="text" name="lid" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080">
                          <div align="left"><b><font face="Verdana">Password</font></b> </div></td>
                          <td><input type="password" name="pwd" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080">
                          <div align="left"><b><font face="Verdana">Role </font></b> </div></td>
                          <td><select name="role">
                              <option value="6">Banking Team</option>
                              <option value="5">ATM Team</option>
                              <option value="7">Online Team</option>
                          </select></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080">
                          <div align="left"><b><font face="Verdana">Address</font></b> </div></td>
                          <td><input type="text" name="addr" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080">
                          <div align="left"><b><font face="Verdana">City</font></b> </div></td>
                          <td><input type="text" name="city" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080">
                          <div align="left"><b><font face="Verdana">State</font></b> </div></td>
                          <td><input type="text" name="state" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080">
                          <div align="left"><b><font face="Verdana">Country</font></b> </div></td>
                          <td><input type="text" name="country" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080">
                          <div align="left"><b><font face="Verdana">Pincode</font></b> </div></td>
                          <td><input type="text" name="pin" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080">
                          <div align="left"><b><font face="Verdana">Phone Number</font></b> </div></td>
                          <td><input type="text" name="phno" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080">
                          <div align="left"><b><font face="Verdana">Email </font></b> </div></td>
                          <td><input type="text" name="email" /></td>
                        </tr>
                        <tr>
                          <td colspan="2"><div align="center">
                            <input type="submit" value=" ADD "  style="color: #000080; font-family: Verdana; font-weight: bold" />
                            <input type="button" value=" BACK " onclick="window.location='gadminhome.jsp'" style="color: #000080; font-family: Verdana; font-weight: bold" />
                          </div></td>
                        </tr>
			          </table>
<p><br />
			              </p>
			      </div>
			      <div align="center"></div>
				  </fieldset>
              </form>
				<p>&nbsp;</p>
			
		  </div>
			
	  </div>
		
	</div>
	<!-- end #content -->
	<!-- end #sidebar -->
</div>
<!-- end #page -->
<div id="footer">
	
</div>
</body>
</html>
