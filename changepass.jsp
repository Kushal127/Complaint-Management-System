<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*" %><%@ page import="beans.DBConnectionFactory" %>
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
<%
String pwd="";
ServletContext sc=getServletContext();
String dri=sc.getInitParameter("driver");
   String driver=sc.getInitParameter("url");
String id= (String)session.getAttribute("name");
   /*Class.forName(dri);
 Connection con=DriverManager.getConnection(driver,"cmsys","cmsys");*/
 Connection con=DBConnectionFactory.getConnection();
   PreparedStatement st=con.prepareStatement("select PASSWORD from CMS_CUSTOMER where LOGINID=?");
    st.setString(1,id);
   ResultSet rs=st.executeQuery();
   if(rs.next())
    {

 pwd=rs.getString(1);}
%>
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
				<form name="form1" action="chpwd.jsp" >
				  <fieldset>
                    <legend><span class="style1">Change Password</span></legend>
				    <div align="center">
				      <p>&nbsp;</p>
				     <table width="380">
<tr><td width="139"><span class="style2">Old Password</span></td>
<td width="229"><input type="password" name="oldpwd" value="<%=pwd%>" readonly></td></tr><tr></tr><tr></tr>

<tr><td width="139"><span class="style2">New Password</span></td>
<td width="229"><input type="password" name="newpwd"/> </td></tr><tr></tr><tr></tr>

<tr><td width="139"><span class="style2">Confirm Password</span></td>
<td width="229"><input type="password" name="cpwd"/> </td></tr><tr></tr><tr></tr>


<tr><td></td></tr>


<tr><td align="right" ><input type="submit" value="UPDATE" style="color: #000080; font-family: Verdana; font-weight: bold"/></td>
 <td><input type="button" value="Back" onclick="window.location='custhome.jsp'" style="color: #000080; font-family: Verdana; font-weight: bold"/>
 </td></tr></table>
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
