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
.style3 {font-family: Arial, Helvetica, sans-serif; font-weight: bold; font-size: 14px; }
.style4 {color: #000000}
-->
</style>
</head>
 
<body>
<%String role=(String)session.getAttribute("roleid");%>
<div id="menu">
<ul>
	<jsp:include page="bankadminoptions.html"/>
</ul>
</div>

	<h1 align="right"><jsp:include page="header.html"/></h1>
	

<hr />
<div id="page">
	<div id="content1">
		<div class="post">
			<h2 class="title">&nbsp;</h2>
	        <div class="entry">
				<form name=form1 action="fwd.jsp" >
				  <fieldset>
                    <legend><span class="style1">Mail</span></legend>
				    <div align="center">
				     
                       <%String from=request.getParameter("from");
 session.setAttribute("from",from);
%>


<table width="378" border="1">
<tr>
<td height="37">
  <div align="left" class="style3"> From </div></td>
<td width="278">
  <div align="left"><%=from%></div></td></tr>

<%
String loginid=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
 System.out.println("loginid in atmviewmail"+loginid);
 ServletContext sc=getServletContext();
String id="";
 
String sub=request.getParameter("sub");
int cid=Integer.parseInt(request.getParameter("cid"));
session.setAttribute("cid",cid+"");
session.setAttribute("sub",sub);
String driver=sc.getInitParameter("driver");
System.out.println("driv in atmview mail in jsp"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
  con=DBConnectionFactory.getConnection();
}
catch(Exception e){System.out.println("ee"+e);}
   PreparedStatement st=con.prepareStatement("select  emailtext   from  CMS_COMPLAINT where COMPLAINTID="+cid+" and  toemail='"+email+"'");
   ResultSet rs=st.executeQuery();
   rs.next();
   String content=rs.getString(1);
   System.out.println("url"+content);
   System.out.println("url"+content);

 
 System.out.println("url"+cid);

session.setAttribute("content",content);
session.setAttribute("compid",cid+"");

%>

<tr ><td height="37"> <div align="left" class="style3">Content</div></td>
<td> <div align="left"><%=content%></div></td></tr>
<tr >
  <td height="20" colspan="2"><div align="center">
    <div align="center">
      <input type="submit" value="FORWARD" style="color: #000080; font-family: Verdana; font-weight: bold"/>
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
