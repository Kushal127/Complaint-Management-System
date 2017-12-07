<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*" %>
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
.style3 {color: #000000}
-->
</style>
</head>
 <% 
String from=request.getParameter("from");
System.out.println("from"+from);

 String email=(String)session.getAttribute("adminemail");
 String custemail=(String)session.getAttribute("custemail");
 System.out.println("custmail from"+custemail);
 
   %>
<body>
<%String roleid = (String)session.getAttribute("roleid"); %>
<div id="menu">
<ul>
	 <%
	    if(roleid.equals("5"))
	    {
	  %>
		<jsp:include page="atmhandleoptions.html"/>
		<%}
		if(roleid.equals("6"))
	    {
	    %>
		<jsp:include page="bankhandleoptions.html"/>
		<%}
		if(roleid.equals("7"))
	    {
	    %>
		<jsp:include page="onlinehandleoptions.html"/>
		<%} %>
	
		 
     
</ul>
</div>

	<h1 align="right"><jsp:include page="header.html"/></h1>
	

<hr />
<div id="page">
	<div id="content1">
		<div class="post">
			<h2 class="title">&nbsp;</h2>
	        <div class="entry">
				<form name="form1" action="reply" >
				  <fieldset>
                    <legend><span class="style1">Atm Team Reply</span></legend>
				    <div align="center">
				     <br />
                      <table width="386" border="0">
<tr>
<td width="106" align="center"><span class="style3"><font size="3" color="#000080">
  </span>
  <div align="left" class="style2"> From </div></td>
<td width="270">
  <div align="left">
    <input type="text"  name="from"  value="<%=email%>"   size="45"   readonly="readonly" />
  </div></td></tr>

<tr>
  <td align="center"><div align="left" class="style2">To </div></td>
  <td><input type="text"  name="to"     value="<%=custemail%>" size="45"   readonly="readonly" /></td>
</tr>
<tr>
<td width="106" align="center"><span class="style3"><font size="3" color="#000080">
  </span>
  <div align="left" class="style2">Subject </div></td>
<td>
  <div align="left">
    <input type="text"  name="sub"     size="45" />
  </div></td></tr>

<tr><td height="92"><div align="left"><span class="style2">Message</span></div></td>
<td><div align="left">
  <textarea name="content"  rows="10" cols="42"></textarea>
</div></td></tr>
<tr>
  <td colspan="4"><div align="center">
    <input type="submit" value="SEND" style="color: #000080; font-family: Verdana; font-weight: bold" />
    &nbsp;&nbsp;
    <input type="button" value="Back" onclick="window.location='atmhandlehome.jsp'" style="color: #000080; font-family: Verdana; font-weight: bold" />
  </div></td></tr></table>
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
