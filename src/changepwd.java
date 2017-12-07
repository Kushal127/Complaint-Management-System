   
	import javax.servlet.GenericServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class  changepwd extends HttpServlet 
{
public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException
		{
	HttpSession session=req.getSession(true);
	
	try{
   String pwd=req.getParameter("newpwd");
ServletContext sc=getServletContext();
String dri=sc.getInitParameter("driver");
   String driver=sc.getInitParameter("url");
 String name= (String)session.getAttribute("name");
 System.out.println(" in passcname"+name);
  /*Class.forName(dri);
 Connection con=DriverManager.getConnection(driver,"cmsys","cmsys");*/
 Connection con=beans.DBConnectionFactory.getConnection();
   PreparedStatement st=con.prepareStatement("update CMS_CUSTOMER set password='"+pwd+"' where loginid='"+name+"'");
   st.executeUpdate();
   PreparedStatement st1=con.prepareStatement("update login set PWD='"+pwd+"' where LOGINID='"+name+"'");
   st.executeUpdate();

}
catch(Exception e){System.out.println("hello exception"+e);}
   response.sendRedirect("updatesuc.jsp");
		}
}