import javax.servlet.GenericServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class reply extends HttpServlet 
{
public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException
		{
	HttpSession session=req.getSession(true);

String to=req.getParameter("to");
System.out.println("name"+to);
String name=(String) session.getAttribute("name");
String fromemail=(String) session.getAttribute("email");

 
String sub=req.getParameter("sub");
System.out.println("sub"+sub);
System.out.println("from email in reply"+fromemail);
String cid=(String) session.getAttribute("compid");

 
String content=req.getParameter("content");
 System.out.println("in reply"+cid);
 System.out.println("in reply"+content);
 
 
ServletContext sc=getServletContext();
 
/// check login id 
String role="Atm Team";
String custid="custid";
 
String comid="id";
 
 
 String email1="";
String driver=sc.getInitParameter("driver");
System.out.println("driverrrrrrrrrrr"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
try{
/* Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
	con=beans.DBConnectionFactory.getConnection();
  System.out.println("name in reply   "+to);

   PreparedStatement st2=con.prepareStatement("insert  into CMS_REPLY   values('"+custid+"','"+role+"','"+sub+"','"+to+"','"+content+"','"+comid+"','"+cid+"','"+fromemail+"')");
		  int k=st2.executeUpdate();


		  
response.sendRedirect("replysuc.jsp");
	}
   
 
 
 catch(Exception e){System.out.println("eee"+e);}
		}}


