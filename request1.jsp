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
-->
</style>
</head>
 
<body>
<%String role=(String)session.getAttribute("roleid");%>
<div id="menu">
<ul>
  <% if(role.equals("1")){%>
		<jsp:include page="gadminoptions.html"/>
      <%
      System.out.println("now we are in the request1.jsp");
      }%>  
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
				<form name=form1 action="delasso" onsubmit='return check()'>
				  <fieldset>
                    <legend><span class="style1">Delete Associate</span></legend>
				    <div align="center">
				      <p>&nbsp;</p>
				      <table width="350" border="1">
                        <tr>
                          <td align="center"><font size="3" color="#000080"><b><font face="Verdana"> Name</font></b> </td>
                          <td align="center"><font size="3" color="#000080"><b><font face="Verdana">Loginid</font></b> </td>
                          <td align="center" colspan="2"><font size="3" color="#000080"><b><font face="Verdana">View Request</font></b> </td>
                        </tr>
                        <tr>
                          <td></td>
                        </tr>
                        <%
 String loginid1=(String)session.getAttribute("name");
 System.out.println("loginid1"+loginid1);
 ServletContext sc=getServletContext();
String id="2";
String email="";
String driver=sc.getInitParameter("driver");
System.out.println("driverrrrrrrrrrr in jsp"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
String status="1";
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
  con=DBConnectionFactory.getConnection();
}
catch(Exception e){System.out.println("ee"+e);}
  
   PreparedStatement st=con.prepareStatement("select  cusname,loginid,cid  from CMS_CUSTOMER where status='"+status+"'");
  
   ResultSet rs=st.executeQuery();
   while(rs.next()){

String loginid=rs.getString(2);
String cusname=rs.getString(1);
int cid=rs.getInt(3);
 	   %>
                        <tr>
                          <td align="center" ><%=cusname%> </td>
                          <td align="center" ><%=loginid%></td>
                          <td align="center" ><a href="viewcus.jsp?cid=<%=cid%>">VIEW</a> </td>
                          <td align="center" >&nbsp;</td>
                        </tr>
                        <%}%>
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
