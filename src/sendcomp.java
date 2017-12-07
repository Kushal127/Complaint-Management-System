import javax.servlet.GenericServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class sendcomp extends HttpServlet 
{
public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException
		{
	HttpSession session=req.getSession(true);

String to=req.getParameter("to");
System.out.println("name"+to);
String name=(String) session.getAttribute("name");


String sub=req.getParameter("sub");
String content=req.getParameter("content");
 

System.out.println("password"+sub);
System.out.println("role"+content);
ServletContext sc=getServletContext();
int iii=0;
/// check login id 
String logid="0";
 int aid=0;
int compid=0;
String commid="id";
String  status="sent";
  String cusemail="";
String prodid="proid";
 String email1="";
String driver=sc.getInitParameter("driver");
System.out.println("driverrrrrrrrrrr"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
	con=beans.DBConnectionFactory.getConnection();
  PreparedStatement ps=con.prepareStatement("select  emailid  from CMS_CUSTOMER where loginid='"+name+"'");
  ResultSet prs=ps.executeQuery();
  if(prs.next()){

   cusemail=prs.getString(1);
System.out.println("cusemail"+cusemail);
  }
  System.out.println("cusemail"+cusemail);
     
   PreparedStatement st3=con.prepareStatement("select max(complaintid) from   CMS_COMPLAINT");
  ResultSet rs3=st3.executeQuery();
  if(rs3.next()){
  compid=rs3.getInt(1);
if(compid==0){
	compid=1;
}
else{
	compid=compid+1;
}
  }

		  PreparedStatement st2=con.prepareStatement("insert  into CMS_COMPLAINT   values('"+sub+"','"+status+"','"+cusemail+"','"+prodid+"','"+content+"','"+commid+"','"+logid+"',"+compid+",'"+to+"')");
		  int k=st2.executeUpdate();
response.sendRedirect("sentmail.jsp");
	}
   
 
 
 catch(Exception e){System.out.println("eee"+e);}
		}}


