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
		<jsp:include page="atmadminoptions.html"/>
      <%}%>  
	
    <% if(role.equals("3")){%>
		<jsp:include page="bankadminoptions.html"/>
      <%}%>  
	
    <% if(role.equals("4")){%>
		<jsp:include page="onlineadminoptions.html"/>
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
				<form id="form1" method="post" action="">
				  <fieldset>
                    <legend><span class="style1">View profile</span></legend>
				    <div align="center">
				      <p>&nbsp;</p>
				      <table width="350">
<tr><td width="300"><font size="3" color="#000080"><b><font face="Verdana"> Name </font></b> </td><td width="150">
<input type=text name="cname" value="<%=(String)session.getAttribute("name")%>" readonly></td></tr> <tr><td>&nbsp;</td></tr>
<tr><td width="300"><font size="3" color="#000080"><b><font face="Verdana">Login Id</font></b> </td><td width="150">
<input type=text name="accno" value="<%=(String)session.getAttribute("lid")%>" readonly></td></tr> <tr><td>&nbsp;</td></tr>
<tr><td width="300"><font size="3" color="#000080"><b><font face="Verdana">Role ID</font></b> </td><td width="150">
<input type=text name="atm" value="<%=(String)session.getAttribute("roleid")%>" readonly></td></tr> <tr><td>&nbsp;</td></tr>

<tr><td width="300"><font size="3" color="#000080"><b><font face="Verdana">Address</font></b> </td><td width="150">
<input type=text name="addr"  value="<%=(String)session.getAttribute("addr")%>" readonly></td></tr> <tr><td>&nbsp;</td></tr>

<tr><td width="300"><font size="3" color="#000080"><b><font face="Verdana">City</font></b> </td><td width="150">
<input type=text name="otno"  value="<%=(String)session.getAttribute("city")%>" readonly></td></tr> <tr><td>&nbsp;</td></tr>

<tr><td width="300"><font size="3" color="#000080"><b><font face="Verdana">State</font></b> </td><td width="150">
<input type=text name="otno"  value="<%=(String)session.getAttribute("state")%>" readonly></td></tr> <tr><td>&nbsp;</td></tr>
<tr><td width="300"><font size="3" color="#000080"><b><font face="Verdana">Pincode</font></b> </td><td width="150">
<input type=text name="otno"  value="<%=(String)session.getAttribute("pin")%>" readonly></td></tr> <tr><td>&nbsp;</td></tr>
<tr><td width="300"><font size="3" color="#000080"><b><font face="Verdana">Phone Number</font></b> </td><td width="150">
<input type=text name="otno"  value="<%=(String)session.getAttribute("phno")%>" readonly></td></tr> <tr><td>&nbsp;</td></tr>

<tr><td width="300"><font size="3" color="#000080"><b><font face="Verdana">Email </font></b> </td><td width="150">
<input type=text name="email"  value="<%=(String)session.getAttribute("email")%>" readonly></td></tr>


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
