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
	<jsp:include page="bankhandleoptions.html"/>
</ul>
</div>

	<h1 align="right"><jsp:include page="header.html"/></h1>
	

<hr />
<div id="page">
	<div id="content1">
		<div class="post">
			<h2 class="title">&nbsp;</h2>
	        <div class="entry">
				<form name=form1 action="delasso" >
				  <fieldset>
                    <legend><span class="style1">Check Mail</span></legend>
				    <div align="center">
				      <p>&nbsp;</p>
				      <table width="350" border="1">
                        <tr>
                          <td align="center"><font size="3" color="#000080"><b><font face="Verdana"> From Id</font></b> </td>
                          <td align="center"><font size="3" color="#000080"><b><font face="Verdana"> Subject</font></b> </td>
                          <td align="center"><font size="3" color="#000080"><b><font face="Verdana"> Delete</font></b> </td>
                        </tr>
                        <tr>
                          <td></td>
                        </tr>
  <%
 String loginid=(String)session.getAttribute("name");
 String associateid = (String)session.getAttribute("associateid");
 System.out.println("inbox "+loginid);
 ServletContext sc=getServletContext();
String id="6";
String adminid="3";
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
 PreparedStatement st2=con.prepareStatement("select  emailid from  CMS_ROLE where roleid='"+id+"' and associateid="+associateid);
 ResultSet rs3=st2.executeQuery();
 if(rs3.next()){
	email=rs3.getString(1);
	System.out.println("email   "+email);
	session.setAttribute("email",email);
 }
 PreparedStatement st3=con.prepareStatement("select  emailid from  CMS_ROLE where roleid='"+adminid+"'");
 ResultSet rs4=st3.executeQuery();
 if(rs4.next()){
	adminemail=rs4.getString(1);
	System.out.println("adminemail   "+adminemail);
	session.setAttribute("adminemail",adminemail);
 }

 


   PreparedStatement st=con.prepareStatement("select  COMPLAINTDESC ,email,complaintid  from  CMS_COMPLAINT where toemail='"+email+"'");
  
   ResultSet rs=st.executeQuery();
   while(rs.next()){
System.out.println("email   "+email);

String sub=rs.getString(1);
System.out.println("email   "+sub);
String emailid=rs.getString(2);

session.setAttribute("custemail",emailid);

int cid=rs.getInt(3);
System.out.println("cid in atmteam   "+cid);
%>
<tr>
		   <td align="center" ><%=adminemail%></td>
		   <td align="center" >
		   <a href="bankteammail.jsp?sub=<%=sub%>&from=<%=adminemail%>&cid=<%=cid%>"><%=sub%></a></td>
			<td><a href="delatmail.jsp?mail=<%=email%>&cid=<%=cid%>">Delete</a></td>   
		   
		   
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
