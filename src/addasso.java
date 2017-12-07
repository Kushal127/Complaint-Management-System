import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.DBConnectionFactory;

public class  addasso extends HttpServlet 
{
public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException
		{
	HttpSession session=req.getSession(true);

String name=req.getParameter("name");
System.out.println("name"+name);

 String lid=req.getParameter("lid");
System.out.println("lid"+lid);

String pwd1=req.getParameter("pwd");
System.out.println("pwd"+pwd1);

String addr=req.getParameter("addr");
System.out.println("addr"+addr);


int roleid=Integer.parseInt(req.getParameter("role"));
System.out.println("roleid"+roleid);


String city=req.getParameter("city");
System.out.println("city"+city);

String state=req.getParameter("state");
System.out.println("state"+state);

String country=req.getParameter("country");
System.out.println("country"+country);


String pin=req.getParameter("pin");
System.out.println("pin"+pin);

String phno=req.getParameter("phno");
System.out.println("phno"+phno);

 

String email=req.getParameter("email");
System.out.println("email"+email);
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
String status="1";
String driver=sc.getInitParameter("driver");
System.out.println("driverrrrrrrrrrr"+driver);
String  url=sc.getInitParameter("url");
System.out.println("url"+url);
Connection con=null;
try{
/* Class.forName(driver);
  con=DriverManager.getConnection(url,"cmsys","cmsys");*/
	con=DBConnectionFactory.getConnection();


  PreparedStatement ps=con.prepareStatement("select max(ASSOCIATEID)  from CMS_STAFF");
  ResultSet rs=ps.executeQuery();
  if(rs.next()){
	   System.out.println("hello in ras");

	  id=rs.getInt(1);
	  System.out.println("hello in ras"+id);
	  if(id==0){
		  id=1;}
		  else{
			  id=id+1;}
	  }
 System.out.println("hello id"+id);
 session.setAttribute("id",""+id);
  PreparedStatement st1=con.prepareStatement("insert  into login  values('"+lid+"','"+pwd1+"',"+roleid+",'"+status+"',"+id+")");
    int k=st1.executeUpdate();
	   System.out.println("hello in ras22");

   PreparedStatement st=con.prepareStatement("insert  into CMS_STAFF  values("+id+", '"+lid+"',"+roleid+",'"+role+"', '"+name+"','"+addr+"','"+city+"', '"+state+"','"+country+"',"+pin+",'"+email+"','"+phno+"')");
    
   int j=st.executeUpdate();
     PreparedStatement st2=con.prepareStatement("insert  into CMS_ROLE  values("+id+", "+roleid+",'"+role+"','"+email+"')");    
   int j1=st2.executeUpdate();
   
	   System.out.println("hello in ras 11");
  
 
  if(j>0&&k>0){

    
	  response.sendRedirect("addsuc.jsp");

	} 
   else
    {
      response.sendRedirect("addfail.jsp");
	}
}
 catch(Exception e){System.out.println("eee"+e);}
		}}


