package dao;

import java.io.File;
import java.sql.Connection;

import connect.*;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Blob;

import bean.DiscoveryBean;

public class LoginDao {
	public static boolean validate(String name, String pass) {	
		System.out.println("in side of validate");
		System.out.println("in side of validate");
		boolean status = false;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "wattpad";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "password";
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url + dbName, userName, password);
			
			pst = conn.prepareStatement("select * from registration where UserName=? and password=?");
			pst.setString(1, name);
			pst.setString(2, pass);

			rs = pst.executeQuery();
			System.out.println("QRY  : "+pst);
			status = rs.next();
	
		/**	while(rs.next())
			{
				
				if(name.equals(rs.getString(1))&&pass.equals(rs.getString(2)))
						{
					System.out.println("in side of validate conditon .....");
							status=true;
							break;
						}
					
			}**/
			
			

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return status;
	}
	
	
	
	public String insertDiscovery(DiscoveryBean oDiscoveryBean,String writer_name) {
		String status="";
		Connection con=null;
		PreparedStatement pstm;
		String sql="insert into story_details (description,writer_name,artical_name,img_name,category) values (?,?,?,?,?)";
		
		con = GetDatabaseConnect.getDatabaseConnect();
		if(con!=null)
		{
			System.out.println("Database is connected Successfully");
		}
		else
		{
			System.out.println("Failed to Connect Database");
		}
		
		try
		{
		
		
		pstm = con.prepareStatement(sql);
		pstm.setString(1, oDiscoveryBean.getMessage());
		pstm.setString(2, writer_name);
		pstm.setString(3, oDiscoveryBean.getArtical_name());
		pstm.setBinaryStream(4, oDiscoveryBean.getImg_name()  ,(int)oDiscoveryBean.getImg_name().available());
		
		
		
		if(oDiscoveryBean.getImg_name()==null)
		{
			System.out.println("input steam is null null null ");
		}
		pstm.setString(5, oDiscoveryBean.getCategory());
		
		
		int n= pstm.executeUpdate();
		
				
		if(n>0)
				{
					status="Record added successfully";
				}
				else
				{
					status="Record insertion failed";
				}
		
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return status;

	}
}