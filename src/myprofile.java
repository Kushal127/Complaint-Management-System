import javax.servlet.GenericServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class myprofile extends HttpServlet 
{
public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException
		{
 

 
ServletContext sc=getServletContext();
HttpSession session=req.getSession(true);
String name=(String)session.getAttribute("name");
String rr=(String)session.getAttribute("roleid");
System.out.println("in view name"+name);
System.out.println("in view "+rr);
int rid=Integer.parseInt(rr);
String driver=sc.getInitParameter("driver");
System.out.println("driverrrrrrrrrrr"+driver);
String  url=sc.getInitParameter("url");
//System.out.println("url"+aid);
String state="";
String country="";
 
String accno="";
String address="";
String role="";
int roleid=0;
String cusname="";
String city="";
String phno="";
String email="";
String atmno="";
String bankno="";
int pin=0;

Connection con=null;
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
	con=beans.DBConnectionFactory.getConnection();
   PreparedStatement st=con.prepareStatement("select * from CMS_CUSTOMER  where  LOGINID=? ");
    st.setString(1,name);
     
   ResultSet rs=st.executeQuery();
   if(rs.next())
    {
	cusname=rs.getString("cusname");
	System.out.println("loginid in view"+cusname);
	session.setAttribute("cusname",cusname);


	 
 
 

address=rs.getString("address");
session.setAttribute("addr",address);
System.out.println(" in view addr"+address);





/*
	city=rs.getString("city");
session.setAttribute("city",city);
System.out.println(" in view city"+city);

state=rs.getString("state");
session.setAttribute("state",state);
System.out.println(" in view state"+state);

country=rs.getString("country");
session.setAttribute("country",country);
System.out.println(" in view country"+country);*/

accno=rs.getString("ACCOUNTNO");
session.setAttribute("accno",accno);
System.out.println(" in view accno"+accno);

email=rs.getString("emailid");
session.setAttribute("email",email);
System.out.println(" in view email"+email);


phno=rs.getString("PHONENO");
session.setAttribute("phno",phno);
System.out.println(" in view phno"+phno);
 
	/////////
atmno=rs.getString("ATMNO");
session.setAttribute("atmno",atmno);
System.out.println(" in view phno"+atmno);


 
	bankno=rs.getString("INTERNETBANKNO");
session.setAttribute("bankno",bankno);
System.out.println(" in view bankno"+bankno);


   response.sendRedirect("cp.jsp");
	}
   else
    {
      response.sendRedirect("nocp.jsp");
	}
}
 catch(Exception e){System.out.println("eee"+e);}
		}}


