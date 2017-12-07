<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*"%><%@ page import="beans.DBConnectionFactory" %>
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
				<form name=form1  onsubmit='return check()' action="accept">
				  <fieldset>
                    <legend class="style1">View  Customer Details</legend>
<div align="center">
				      <p>&nbsp;</p> <%
 
 String cid=request.getParameter("cid");
session.setAttribute("cusid",cid);
 System.out.println("loginid"+cid);
 int ccid=Integer.parseInt(cid);

 ServletContext sc=getServletContext();
String id="2";
String email="";
String driver=sc.getInitParameter("driver");
System.out.println("driverrrrrrrrrrr in jsp"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
String status="0";
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
  con=DBConnectionFactory.getConnection();
}
catch(Exception e){System.out.println("ee"+e);}
  
   PreparedStatement st=con.prepareStatement("select  * from CMS_CUSTOMER where cid="+ccid+"");
  
   ResultSet rs=st.executeQuery();
   if(rs.next()){%>
				      <table width="461">
                        <tr>
                          <td><font size="3" color="#000080"><b><font face="Verdana">Login Id </font></b> </td>
                          <td><input type="text" name="loginid" value="<%=rs.getString(1)%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080"><b><font face="Verdana">Password</font></b> </td>
                          <td><input type="password" name="pwd"  value="<%=rs.getString(3)%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080"><b><font face="Verdana">Customer Name </font></b> </td>
                          <td><input type="text" name="cname" value="<%=rs.getString(2)%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080"><b><font face="Verdana">Account Number</font></b> </td>
                          <td><input type="text" name="accno"  value="<%=rs.getString(7)%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080"><b><font face="Verdana">ATM Number</font></b> </td>
                          <td><input type="text" name="atmno"  value="<%=rs.getString(8)%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080"><b><font face="Verdana">Online Transaction Number</font></b> </td>
                          <td><input type="text" name="otno"  value="<%=rs.getString(10)%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080"><b><font face="Verdana">ATMPin Number </font></b> </td>
                          <td><input type="text" name="pin"  value="<%=rs.getString(9)%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080"><b><font face="Verdana">Online Pin Number</font></b> </td>
                          <td><input type="text" name="opin"  value="<%=rs.getString(11)%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080"><b><font face="Verdana">Email </font></b> </td>
                          <td><input type="text" name="email"  value="<%=rs.getString(5)%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080"><b><font face="Verdana">Address</font></b> </td>
                          <td><input type="text" name="addr"  value="<%=rs.getString(6)%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                          <td><font size="3" color="#000080"><b><font face="Verdana">Phone Number</font></b> </td>
                          <td><input type="text" name="phno" value="<%=rs.getString(7)%>" readonly="readonly" /></td>
                        </tr>
                        <%}
   
   
   %>
                        <tr>
                          <td colspan="2">
                              <div align="center">
                                <input type="submit" value=" ACCEPT "  style="color: #000080; font-family: Verdana; font-weight: bold" />
                                <input type="button" value=" REJECT " onclick="window.location='reject.jsp'" style="color: #000080; font-family: Verdana; font-weight: bold" />
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
