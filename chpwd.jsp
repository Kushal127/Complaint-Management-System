<%@ page import="beans.DBConnectionFactory" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY>
<%@ page import="java.sql.*"%>
<%
   try{
   String pwd=request.getParameter("newpwd");
ServletContext sc=getServletContext();
String dri=sc.getInitParameter("driver");
   String driver=sc.getInitParameter("url");
 String name= (String)session.getAttribute("name");
 System.out.println(" in passcname"+name);
  /*Class.forName(dri);
 Connection con=DriverManager.getConnection(driver,"cmsys","cmsys");*/
 Connection con=DBConnectionFactory.getConnection();
  PreparedStatement st1=con.prepareStatement("update login set PWD='"+pwd+"' where LOGINID='"+name+"'");
   PreparedStatement st=con.prepareStatement("update CMS_CUSTOMER set password='"+pwd+"' where loginid='"+name+"'");
   st.executeUpdate();
   
   st1.executeUpdate();

}
catch(Exception e){System.out.println("hello exception"+e);}
   response.sendRedirect("updatesuc.jsp");
   %>

</BODY>
</HTML>
