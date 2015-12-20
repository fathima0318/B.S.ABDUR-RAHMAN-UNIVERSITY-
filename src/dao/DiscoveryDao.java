package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.DiscoveryBean;
import connect.GetDatabaseConnect;

public class DiscoveryDao 
{
	ArrayList discoveryDetails=null;
	Connection con;
	String sql;
	PreparedStatement psmt;
	ResultSet rs;
	DiscoveryBean oDiscoveryBean=null;
	
	public DiscoveryBean getDiscoveryDetails(String id) {

		sql="select * from story_details where id ="+id;
		System.out.println("SQL QUERY......");
		System.out.println(sql);
		con = GetDatabaseConnect.getDatabaseConnect();
		
		try
		{
			 psmt= con.prepareStatement(sql);
			// psmt.setInt(1, Integer.parseInt(id.toString()));
			 rs = psmt.executeQuery(sql);
			 
			 oDiscoveryBean =new DiscoveryBean();

			 while(rs.next())
			 {
				 oDiscoveryBean.setDescription(rs.getString(1));
				 oDiscoveryBean.setWriter_name(rs.getString(2));
				 oDiscoveryBean.setArtical_name(rs.getString(3));
				 oDiscoveryBean.setImg_name(rs.getBinaryStream(4));
				 oDiscoveryBean.setCategory(rs.getString(5));
				 System.out.println("executed successufully");
				 
			 }
			 
		}
		catch(SQLException e)
		{
			
			try
			{
				con.close();
			}
			catch(java.sql.SQLException ee)
			{
				e.printStackTrace();
			}
			
			catch(Exception ee)
			{
				e.printStackTrace();
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	return oDiscoveryBean;
	}
	
	
	
	public ArrayList getDiscoveryAllDetails(String id) {

		discoveryDetails = new ArrayList();
		sql="select * from story_details where id in("+id+")";
		System.out.println("SQL QUERY......");
		System.out.println(sql);
		con = GetDatabaseConnect.getDatabaseConnect();
		
		try
		{
			 psmt= con.prepareStatement(sql);
			// psmt.setInt(1, Integer.parseInt(id.toString()));
			 rs = psmt.executeQuery(sql);
			 
			

			 while(rs.next())
			 {
				 DiscoveryBean  oDiscoveryBean =new DiscoveryBean();
				 oDiscoveryBean.setDescription(rs.getString(1));
				 oDiscoveryBean.setWriter_name(rs.getString(2));
				 oDiscoveryBean.setArtical_name(rs.getString(3));
				 oDiscoveryBean.setImg_name(rs.getBinaryStream(4));
				 oDiscoveryBean.setCategory(rs.getString(5));
				 discoveryDetails.add(oDiscoveryBean);
				 
			 }
			 
		}
		catch(SQLException e)
		{
			
			try
			{
				con.close();
			}
			catch(java.sql.SQLException ee)
			{
				e.printStackTrace();
			}
			
			catch(Exception ee)
			{
				e.printStackTrace();
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	return discoveryDetails;
	}
	
	
	
	public String getID(String usrid) {
		System.out.println("In the getID : ");
		PreparedStatement psmt;
		sql="select id from story_details where writer_name='"+usrid.trim()+"'";
		System.out.println("QUERY GOING TO EXECUTE .......");
		System.out.println(sql);
		StringBuffer id=new StringBuffer();
		con = GetDatabaseConnect.getDatabaseConnect();
		try
		{
			 psmt= con.prepareStatement(sql);
			rs = psmt.executeQuery(sql);
			 oDiscoveryBean =new DiscoveryBean();
         
			 while(rs.next())
			 {
				 id.append("'");
				 id.append(rs.getString(1));
				 id.append("',");
			 }
			 
			 
			 System.out.println("All the ID is as : "+id.toString());
		}
		catch(SQLException e)
		{
			
			try
			{
				con.close();
			}
			catch(java.sql.SQLException ee)
			{
				e.printStackTrace();
			}
			
			catch(Exception ee)
			{
				e.printStackTrace();
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return id.toString();
	

	}
}
