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
                    <legend><span class="style1">Inbox</span></legend>
				    <div align="center">
				      <p>&nbsp;</p>
				     <table width="350" border="1">
<tr>
<td width="100" align="center"><font size="3" color="#000080"><b><font face="Verdana"> From Id</font></b> </td>

<td width="350" align="center"><font size="3" color="#000080"><b><font face="Verdana"> Subject</font></b> </td>
 <td width="250" align="center"><font size="3" color="#000080"><b><font face="Verdana"> Delete</font></b> </td>
 

 </tr>
 <tr><td></td></tr>
 <%
 String loginid=(String)session.getAttribute("name");
 System.out.println(" CUSTOMER inbox "+loginid);
 ServletContext sc=getServletContext();
String id="5";
String adminid="2";
String adminemail="";
String email="";
String driver=sc.getInitParameter("driver");
System.out.println("atm inbox in jsp"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
  con=DBConnectionFactory.getConnection();
}
catch(Exception e){System.out.println("ee"+e);}
 PreparedStatement st2=con.prepareStatement("select  emailid from  CMS_CUSTOMER where LOGINID='"+loginid+"'");
 ResultSet rs3=st2.executeQuery();
 if(rs3.next()){
	email=rs3.getString(1);
	System.out.println("email   "+email);
	session.setAttribute("email",email);
 }
  


   PreparedStatement st=con.prepareStatement("select  sub ,from_email,complaintid  from  CMS_REPLY where CUST_EMAILID='"+email+"'");
  
   ResultSet rs=st.executeQuery();
   while(rs.next()){
System.out.println("email   "+email);

String sub=rs.getString(1);
System.out.println("email   "+sub);
String emailid=rs.getString(2);

session.setAttribute("atmemail",emailid);

int cid=rs.getInt(3);
System.out.println("cid in atmteam   "+cid);


	   %>
<tr>
		   <td align="center" ><%=emailid%></td>
		   <td align="center" >
		   <a href="custviewmail.jsp?sub=<%=sub%>&from=<%=emailid%>&cid=<%=cid%>"><%=sub%></a></td>
		<td align="center" >
		   <a href="deletecusmail.jsp?cid=<%=cid%>">Delete</a></td>   
	   
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
