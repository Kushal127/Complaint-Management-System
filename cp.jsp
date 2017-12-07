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
.style2 {
	color: #000000;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<%String role=(String)session.getAttribute("roleid");%>
<div id="menu">
<ul>
   
		<jsp:include page="customeroptions.html"/>
      
	
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
				      <table width="420">
<tr><td width="261"><div align="left" class="style2">Customer Name  </div></td>
<td width="147">
<input type=text name="cname"  value="<%=(String)session.getAttribute("cusname")%>" readonly></td></tr> 
<tr><td width="261"><div align="left" class="style2">Account Number </div></td>
<td width="147">
<input type=text name="accno"  value="<%=(String)session.getAttribute("accno")%>" readonly></td></tr> 
<tr><td width="261"><div align="left" class="style2">ATM Number </div></td>
<td width="147">
<input type=text name="atm"  value="<%=(String)session.getAttribute("atmno")%>" readonly></td></tr> 

<tr><td width="261"><div align="left" class="style2">Online Transaction Number </div></td>
<td width="147">
<input type=text name="otno"  value="<%=(String)session.getAttribute("bankno")%>" readonly></td></tr> 


<tr><td width="261"><div align="left" class="style2">Email </div></td>
<td width="147">
<input type=text name="email"  value="<%=(String)session.getAttribute("email")%>" readonly></td></tr> 

<tr><td width="261"><div align="left" class="style2">Address</div></td>
<td width="147">
<input type=text name="addr"  value="<%=(String)session.getAttribute("addr")%>" readonly></td></tr> 


 
<tr><td width="261"><div align="left" class="style2">Phone Number</div></td>
<td width="147">
<input type=text name="addr"  value="<%=(String)session.getAttribute("phno")%>" readonly></td></tr>
 

<tr>
  <td colspan="2">    
    
    <div align="center">
      <input type="button" value=" OK " onClick="window.location='custhome.jsp'" style="color: #000080; font-family: Verdana; font-weight: bold"/>
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
