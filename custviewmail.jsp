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
.style3 {color: #000000; font-weight: bold; }
-->
</style>
</head>
<body>
    <div id="menu">    
      <ul>
        <jsp:include page="customeroptions.html"/>      
      </ul>
</div>
<h1 align="right"><jsp:include page="header.html"/></h1>
	

&quot;<hr />
<div id="page">
	<div id="content1">
		<div class="post">
			<h2 class="title">&nbsp;</h2>
	        <div class="entry">
				<form id="form1" method="post" action="">
				  <fieldset>
                    <legend><span class="style1">View Mail</span></legend>
				    <div align="center">
				     
                       <%
 String from=request.getParameter("from");
 System.out.println("in atmteammail jsp"+from);
 String sub=request.getParameter("sub");
 int cid=Integer.parseInt(request.getParameter("cid"));
 
  System.out.println("in atmteammail jsp cid"+cid);

%>
				     <table width="450" border="1">
<tr>
<td width="150" align="center"><div align="left" class="style3">From </div></td>
<td>
 <%=from%></td></tr> 

<%
String loginid=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
 System.out.println("cusemail              lemail in ijsp"+email);
 ServletContext sc=getServletContext();
String id="";
 
session.setAttribute("sub",sub);
String driver=sc.getInitParameter("driver");
 String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
  con=DBConnectionFactory.getConnection();
}
catch(Exception e){System.out.println("ee"+e);}
   PreparedStatement st=con.prepareStatement("select  MAIL_TEXT  from  CMS_REPLY   where COMPLAINTID="+cid+" and CUST_EMAILID='"+email+"'");
   ResultSet rs=st.executeQuery();
   rs.next();
   String content=rs.getString(1);
   
    
   System.out.println("url"+content);
   System.out.println("url"+content);

 
 
 

%>

<tr ><td><span class="style3">Content</span></td>
<td> <%=content%></td></tr>
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
