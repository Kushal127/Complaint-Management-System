import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.DBConnectionFactory;

public class Login extends HttpServlet 
{
public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException
		{
	HttpSession session=req.getSession(true);


	String name=req.getParameter("name");
System.out.println("name"+name);
session.setAttribute("name",name);

String pwd=req.getParameter("pwd");
int roleid=Integer.parseInt(req.getParameter("role"));
session.setAttribute("roleid",roleid+"");
System.out.println("password"+pwd);
System.out.println("role"+roleid);
ServletContext sc=getServletContext();
int iii=0;
String driver=sc.getInitParameter("driver");
System.out.println("driverrrrrrrrrrr"+driver);
String  url=sc.getInitParameter("url");
String status="1";
System.out.println("status"+status);
System.out.println("url"+url);

Connection con=null;
try{
	/*System.out.println("enter the try block");
 Class.forName("oracle.jdbc.driver.OracleDriver");
 System.out.println("con **************con");
  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cmsys","cmsys");
  */
	con=DBConnectionFactory.getConnection();
  System.out.println("the connection is to be created");
  String u="select * from login  where  LOGINID='"+name+"' and pwd='"+pwd+"' and roleid="+roleid+" and status='"+status+"'";
  System.out.println("the query string is"+u);
  /* PreparedStatement st=con.prepareStatement("select * from login  where  LOGINID=? and pwd=? and roleid=? and status=? ");
   st.setString(1,name);
   st.setString(2,pwd);
     st.setInt(3,roleid);
     st.setString(4,status);*/
  Statement st=con.createStatement();
   ResultSet rs=st.executeQuery(u);
   if(rs.next())
    {
	   System.out.println("now we are in the execute query");
	   session.setAttribute("associateid", rs.getString(5));
	 iii=1;
System.out.println("in ra.behjgf");
		 if(roleid==1){response.sendRedirect("gadminhome.jsp");
	} if(roleid==3){response.sendRedirect("bankadmin.jsp");}
	if(roleid==2){response.sendRedirect("atmhome.jsp");}
	if(roleid==4){response.sendRedirect("onlineadminhome.jsp");}
	if(roleid==10){response.sendRedirect("custhome.jsp");}
	if(roleid==5){response.sendRedirect("atmhandlehome.jsp");}
	if(roleid==6){response.sendRedirect("bankteamhome.jsp");}
	if(roleid==7){response.sendRedirect("onlineteamhome.jsp");}

	}
   else
     
    {
		System.out.println("role id in else"+roleid);
	 if(roleid<5){response.sendRedirect("adminfail.jsp");}
	if(roleid==5){response.sendRedirect("teamfail.jsp");}
	if(roleid==6){response.sendRedirect("teamfail.jsp");}
	if(roleid==7){response.sendRedirect("teamfail.jsp");}
 	if(roleid==10){response.sendRedirect("clientfail.jsp");}
	}

}
 catch(Exception e)
 {
	 e.printStackTrace();}
		}}


