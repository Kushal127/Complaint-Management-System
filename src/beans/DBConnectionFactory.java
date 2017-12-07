package beans;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnectionFactory implements Serializable {

	public static Connection getConnection()throws Exception
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con=DriverManager.getConnection("jdbc:odbc:cmsys","cmsys","cmsys");
		return con;
	}
}
