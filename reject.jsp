<%@ page import="beans.DBConnectionFactory" %> 
<%@ page import="java.sql.*"%>
 
 
 <%
int cid=Integer.parseInt((String)session.getAttribute("cusid"));
 System.out.println("loginid1"+cid);

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
  


    PreparedStatement st2=con.prepareStatement("delete  from cms_service  where cid="+cid+"");
	 int k=st2.executeUpdate();
	 System.out.println("ee  k"+k);
	 response.sendRedirect("rejsuc.jsp");

 PreparedStatement st=con.prepareStatement("delete  from CMS_CUSTOMER where cid="+cid+"");
  
   int j=st.executeUpdate();

System.out.println("ee  jjj"+j);


    PreparedStatement st1=con.prepareStatement("delete  from login  where cid="+cid+"");
int i=st1.executeUpdate();
System.out.println("ee  iiii"+i);


  


	 %>