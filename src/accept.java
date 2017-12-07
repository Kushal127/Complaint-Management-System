import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import beans.DBConnectionFactory;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class accept  extends HttpServlet 
{
public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException
		{

	HttpSession session=req.getSession(true);

 ServletContext sc=getServletContext();
 
String driver=sc.getInitParameter("driver");
int cid1=Integer.parseInt((String)session.getAttribute("cusid"))	;
System.out.println("driverrrrrrrrrrr"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
String status="1";
Connection con=null;
	try{
/* Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
		con=DBConnectionFactory.getConnection();

  PreparedStatement st1=con.prepareStatement("update   login set status="+status+"");
   int k=st1.executeUpdate();
	  System.out.println("hello in ras22"+k);

    PreparedStatement st2=con.prepareStatement("update  CMS_CUSTOMER set status="+status+"");
   int k2=st2.executeUpdate();
	  System.out.println("hello in ras22"+k2);
	  response.sendRedirect("acceptsuc.jsp");

	} 
    
 catch(Exception e){System.out.println("eee"+e);}
		}}


