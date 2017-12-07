<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="beans.DBConnectionFactory" %>
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
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #000000;
}
.style3 {color: #000000}
.style5 {color: #000000; font-weight: bold; }
-->
</style>
</head>
 <%
 String loginid=(String)session.getAttribute("name");
 System.out.println("loginid"+loginid);
 ServletContext sc=getServletContext();
String id="2";
String emailid="";
String driver=sc.getInitParameter("driver");
System.out.println("driverrrrrrrrrrr in jsp"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
  con=DBConnectionFactory.getConnection();
 
 
   PreparedStatement st=con.prepareStatement("select  emailid from  CMS_ROLE where roleid='"+id+"'");
   ResultSet rs=st.executeQuery();
  if(rs.next()){

 
emailid=rs.getString(1);
   }}
	   catch(Exception e){System.out.println("hello catch"+e);}%>
<body>
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
				<form name=form1 action="sendcomp" >
				  <fieldset>
                    <legend><span class="style1">To Atm </span></legend>
				    <div align="center">
				      <p>&nbsp;</p>
				     <table width="344" border="0">
<tr>
<td width="64" align="center">
  <div align="left" class="style2"><strong> To </strong></div></td>
<td width="270">
<input type="text"  name="to"  value=<%=emailid%>  size="45"   readonly></td></tr>

<tr>
<td width="64" align="center"><strong><span class="style3"> </strong>  <div align="left" class="style2">Subject </div></td>
<td>
<input type="text"  name="sub"    size="45"   ></td></tr>
<tr>
  <td height="101" align="center"><div align="left" class="style2">Message</div></td>
  <td valign="top"><div align="left">
    <textarea name="content"  rows="6" cols="42"></textarea>
  </div></td>
</tr>
<tr>
  <td height="28" colspan="2" align="center"><input type="submit" value="SEND" style="color: #000080; font-family: Verdana; font-weight: bold"/>&nbsp;
    <input type="button" value="Back" onclick="window.location='custhome.jsp'" style="color: #000080; font-family: Verdana; font-weight: bold" /></td>
  </tr>
</table>
<br/>

			      </div>
			      <div align="center"></div>
				  </fieldset>
              </form>
				
			
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
