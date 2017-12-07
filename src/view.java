import javax.servlet.GenericServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class view extends HttpServlet 
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
 
String acsname="";
String address="";
String role="";
int roleid=0;
String loginid="";
String city="";
String phno="";
String email="";
int pin=0;

Connection con=null;
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
	con=beans.DBConnectionFactory.getConnection();
   PreparedStatement st=con.prepareStatement("select * from CMS_STAFF  where loginid=? and roleid=? ");
    st.setString(1,name);
     st.setInt(2,rid);
   ResultSet rs=st.executeQuery();
   if(rs.next())
    {
	loginid=rs.getString("loginid");
	System.out.println("loginid in view"+loginid);
session.setAttribute("lid",loginid);


	roleid=rs.getInt("ROLEID");
		System.out.println("roleid in view"+roleid);
		session.setAttribute("roleid",roleid+"");

	role=rs.getString("ROLE");
	System.out.println("role in view"+role);


//session.setAttribute("role",role);
acsname=rs.getString("ASCNAME");
session.setAttribute("name",acsname);
System.out.println(" in view"+acsname);

address=rs.getString("address");
session.setAttribute("addr",address);
System.out.println(" in view addr"+address);
city=rs.getString("city");
session.setAttribute("city",city);
System.out.println(" in view city"+city);



state=rs.getString("state");
session.setAttribute("state",state);
System.out.println(" in view state"+state);

country=rs.getString("country");
session.setAttribute("country",country);
System.out.println(" in view country"+country);

pin=rs.getInt("pin");
session.setAttribute("pin",pin+"");
System.out.println(" in view pin"+pin);

email=rs.getString("email");
session.setAttribute("email",email);
System.out.println(" in view email"+email);


phno=rs.getString("phno");
session.setAttribute("phno",phno);
System.out.println(" in view phno"+phno);
   response.sendRedirect("viewadminprofile.jsp");
	}
   else
    {
      response.sendRedirect("noprofile.jsp");
	}
}
 catch(Exception e){System.out.println("eee"+e);}
		}}


