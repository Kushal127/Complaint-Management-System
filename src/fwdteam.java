import javax.servlet.GenericServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class fwdteam extends HttpServlet 
{
public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException
		{
	HttpSession session=req.getSession(true);

String to=req.getParameter("to");
String sub=req.getParameter("sub");
System.out.println("name"+to);
String content=(String) session.getAttribute("content");
content+="-"+req.getParameter("content");
 
String from=(String) session.getAttribute("from");
System.out.println("from in fwdteam"+from);

String comid=(String) session.getAttribute("cid");
int cid=Integer.parseInt(comid);

 
System.out.println("cid  in fwdteam"+cid);
//String content=req.getParameter("content");
 

System.out.println("subject in fwdteam"+sub);
System.out.println("role"+content);
ServletContext sc=getServletContext();
int iii=0;
/// check login id 
String logid="0";
 int aid=0;
 
String commid="id";
String  status="1";
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
  
     
 /*  PreparedStatement st3=con.prepareStatement("select max(complaintid) from   CMS_COMPLAINT");
  ResultSet rs3=st3.executeQuery();
  if(rs3.next()){
  compid=rs3.getInt(1);
if(compid==0){
	compid=1;
}
else{
	compid=compid+1;
}
  }*/
 PreparedStatement st2=con.prepareStatement("insert  into CMS_COMPLAINT   values('"+sub+"','"+status+"','"+from+"','"+prodid+"','"+content+"','"+commid+"','"+logid+"',"+cid+",'"+to+"')");
		  int k=st2.executeUpdate();
response.sendRedirect("fwdmail.jsp");
	}
   
 
 
 catch(Exception e){System.out.println("eee"+e);}
		}}


