import javax.servlet.GenericServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class  delasso extends HttpServlet 
{
public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException
		{
	HttpSession session=req.getSession(true);

String aid1=req.getParameter("aid");
System.out.println("aid"+aid1);
int aid=Integer.parseInt(aid1);
  
 String loginid1="";
 int roleid=0;
int j=0;
int k=0;
 ServletContext sc=getServletContext();

String driver=sc.getInitParameter("driver");
System.out.println("driverrrrrrrrrrr"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
try{
 /*Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
	con=beans.DBConnectionFactory.getConnection();


  PreparedStatement ps=con.prepareStatement("select loginid , roleid from CMS_STAFF where associateid="+aid+"");
  ResultSet rs=ps.executeQuery();
  if(rs.next()){
	    
	  loginid1=rs.getString(1);
	  	  roleid=rs.getInt(2);
	  System.out.println("hello in rs del"+loginid1);
	    System.out.println("hello in rs del"+roleid);
 
  PreparedStatement st1=con.prepareStatement("delete  from  login  where   LOGINID='"+loginid1+"' and roleid="+roleid+"");
   k=st1.executeUpdate();
	   System.out.println("hello in ras22");

   PreparedStatement st=con.prepareStatement("delete from CMS_STAFF  where  associateid="+aid+" ");
    
    j=st.executeUpdate();
   
	   System.out.println("hello in ras 11");
  
  }
  else{ response.sendRedirect("delfail.jsp");}

  if(j>0){

    
	  response.sendRedirect("delsuc.jsp");

	} else{
    response.sendRedirect("deletefail.jsp");}
}
 catch(Exception e){System.out.println("eee"+e);}
		}}


