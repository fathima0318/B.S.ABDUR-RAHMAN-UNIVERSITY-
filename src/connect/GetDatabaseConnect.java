package connect;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class GetDatabaseConnect {

	
	
	static  Connection con =null;
	static String url = "jdbc:mysql://localhost:3306/";
	static String dbName = "wattpad";
	static String driver = "com.mysql.jdbc.Driver";
	static String userName = "root";
	static String password = "password";
	public static Connection getDatabaseConnect() {
		
		
		try
		{
			Class.forName(driver).newInstance();
			con = DriverManager
					.getConnection(url + dbName, userName, password);
			
			if(con!=null)
			{
				System.out.println("Connected to database successfully..........");
			}
			else
			{
				System.out.println("Failed to connect database ...................");
			}
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;

	}
	
	public static void main(String[] args)
	{
		GetDatabaseConnect.getDatabaseConnect();
	}

}
