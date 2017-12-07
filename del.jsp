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
 <%
 String loginid1=(String)session.getAttribute("name");
 System.out.println("loginid1"+loginid1);
 ServletContext sc=getServletContext();
 
String driver=sc.getInitParameter("driver");
System.out.println("driverrrrrrrrrrr in jsp"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
String status="0";
int aid=0;
try{
/* Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
  con=DBConnectionFactory.getConnection(); 
}
catch(Exception e){System.out.println("ee"+e);}
  
   PreparedStatement st=con.prepareStatement("select  ASSOCIATEID  from CMS_STAFF ");
  %>
<body>
<%String role=(String)session.getAttribute("roleid");%>
<div id="menu">
<ul>
  <% if(role.equals("1")){%>
		<jsp:include page="gadminoptions.html"/>
      <%}%>  
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
				      <table width="350">
                        <tr>
                          <td width="159"><font size="3" color="#000080"><b><font face="Verdana">Enter Associate ID </font></b>&nbsp;</td>
                          <td width="179"><% ResultSet rs=st.executeQuery();
   %>
                              <select name="aid">
                                <%
   while(rs.next()){
	   aid=rs.getInt(1);
	   %>
                                <option><%=aid%></option>
                                <%}%>
                              </select>
                          </td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td align="right"><input type="submit" value="Submit" style="color: #000080; font-family: Verdana; font-weight: bold" /></td>
                          <td><input type="button" value="Back" onclick="window.location='gadminhome.jsp'" style="color: #000080; font-family: Verdana; font-weight: bold" /></td>
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
