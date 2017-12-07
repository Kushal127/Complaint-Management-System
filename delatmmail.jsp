<%@ page import="beans.DBConnectionFactory" %>
<%@ page import="java.sql.*"%>

<% ServletContext sc=getServletContext();
 
 String cusid=request.getParameter("cid");
 String mail=request.getParameter("mail");
String driver=sc.getInitParameter("driver");
System.out.println("atm inbox in jsp"+cusid);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
  con=DBConnectionFactory.getConnection();
}
catch(Exception e){System.out.println("ee"+e);}
 PreparedStatement st2=con.prepareStatement("delete from  CMS_COMPLAINT where complaintid='"+cusid+"' and TOEMAIL='"+mail+"' ");
 int j=st2.executeUpdate();
 
  response.sendRedirect("delatm.jsp");
 
  %>
  
