import javax.servlet.GenericServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class  addcus  extends HttpServlet 
{
public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException
		{

	HttpSession session=req.getSession(true);

String cname=req.getParameter("cname");
System.out.println("name"+cname);

 String lid=req.getParameter("loginid");
System.out.println("lid"+lid);

String pwd1=req.getParameter("pwd");
System.out.println("pwd"+pwd1);

String addr=req.getParameter("addr");
System.out.println("addr"+addr);


int roleid=10;
System.out.println("roleid"+roleid);


String otno=req.getParameter("otno");
System.out.println("otno"+otno);

String atmno=req.getParameter("atmno");
System.out.println("atmno"+atmno);

String accno=req.getParameter("accno");
System.out.println("country"+accno);


String pin=req.getParameter("pin");
System.out.println("pin"+pin);

String phno=req.getParameter("phno");
System.out.println("phno"+phno);

 String opin=req.getParameter("opin");
System.out.println("opin"+opin);

 
 

String email=req.getParameter("email");
System.out.println("email"+email);


String atm=req.getParameter("atm");
System.out.println("atm"+atm);
	System.out.println("before is");	
	String online=req.getParameter("online");
System.out.println("online"+online);
if(atm==null){
	
	System.out.println("atm inif"+atm);

	atm="no service";
	}
	else{atm="atm";
	System.out.println("in elsec atm"+atm);
	}
System.out.println("atm"+atm);


if(online==null){

	online="no service";}
	else{online="online";}
System.out.println("online"+online);

 String bank=req.getParameter("bank");
if(bank==null){

	bank="no service";}
	else{bank="bank";}

System.out.println("bank"+bank);



String role="";
 if(roleid==5){
	 role="ATM Team";
 }

else  if(roleid==6){
	 role="Banking Team";
 }

 else if(roleid==7){
	 role="Online Team";
 }
 
 int id=0;
ServletContext sc=getServletContext();

String driver=sc.getInitParameter("driver");
System.out.println("driverrrrrrrrrrr"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
	try{
/* Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
		con=beans.DBConnectionFactory.getConnection();


  
  PreparedStatement st1=con.prepareStatement("insert  into login  values('"+lid+"','"+pwd1+"',"+roleid+")");
    int k=st1.executeUpdate();
	   System.out.println("hello in ras22"+k);

   PreparedStatement st2=con.prepareStatement("insert  into CMS_CUSTOMER  values('"+lid+"','"+pwd1+"', '"+cname+"','"+addr+"','"+email+"', '"+phno+"','"+accno+"',"+atmno+",'"+pin+"','"+otno+"','"+opin+"')");

    
   int j=st2.executeUpdate();


    
  PreparedStatement st3=con.prepareStatement("insert  into cms_service  values('"+accno+"','"+atm+"','"+bank+"','"+online+"')");
    int k1=st3.executeUpdate();
	   System.out.println("hello in ras22");
   
 
  if(j>0&&k>0){

    
	  response.sendRedirect("cussuc.jsp");

	} 
   else
    {
      response.sendRedirect("cusfail.jsp");
	}
}
 catch(Exception e){System.out.println("eee"+e);}
		}}


