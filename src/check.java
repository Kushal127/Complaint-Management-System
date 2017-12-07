import javax.servlet.GenericServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class  check extends HttpServlet 
{
public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException
		{
	HttpSession session=req.getSession(true);

String services=req.getParameter("service");
 System.out.println(" in check services"+services);
String name=(String)session.getAttribute("name");
System.out.println(" in check name"+name);
 
ServletContext sc=getServletContext();
int iii=0;
String accountno="";
String driver=sc.getInitParameter("driver");
System.out.println("driv in check"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
  String atm="";
	    String bank="";
	    String  online="";
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
	con=beans.DBConnectionFactory.getConnection();


   PreparedStatement ps=con.prepareStatement("select ACCOUNTNO from cms_customer where loginid='"+name+"'");

   ResultSet rs1=ps.executeQuery();
   System.out.println("in first");
   if(rs1.next()){
	   accountno=rs1.getString(1);
	   System.out.println("accounno"+accountno);
   }


   PreparedStatement st=con.prepareStatement("select * from cms_service  where  ACCOUNTNO=?");
   st.setString(1,accountno);
     
   ResultSet rs=st.executeQuery();
   if(rs.next())
    {
	   System.out.println(" in check services"+services);
	  atm=rs.getString(2);
	    bank=rs.getString(3);
	    online=rs.getString(4);
	}
	 if(atm.equalsIgnoreCase(services))

		{
			response.sendRedirect("atmcomp.jsp");
			}else
	 
	 
	 if(bank.equalsIgnoreCase(services)){response.sendRedirect("bankcomp.jsp");}
	 else 
	  if(online.equalsIgnoreCase(services)){response.sendRedirect("onlinecomp.jsp");}
	 
	 else
     
    {
		System.out.println("role id in else");
	 response.sendRedirect("noservice.jsp");}
	 

}
 catch(Exception e){System.out.println("eee"+e);}
		}}


