package reg;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Register extends HttpServlet {
	
	
	 private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        System.out.println("##HI JAIN###");
        String firstname = request.getParameter("First_Name");
        String lstname = request.getParameter("Last_Name");
        String email = request.getParameter("EmailAddress");
        String age = request.getParameter("Age");
        String mob = request.getParameter("Mobile");
        String city = request.getParameter("City");
        String zip = request.getParameter("Zip_Code");
        String user = request.getParameter("UserName");
        String pass = request.getParameter("Password");
        try{
        
        //loading drivers for mysql
        Class.forName("com.mysql.jdbc.Driver");

	//creating connection with the database 
          Connection  con=DriverManager.getConnection
                     ("jdbc:mysql://localhost:3306/wattpad","root","password");

        PreparedStatement ps=con.prepareStatement
                  ("insert into registration(First_Name,Last_Name,EmailAddress,Age,Mobile,City,Zip_Code,UserName,Password) values(?,?,?,?,?,?,?,?,?)");

        ps.setString(1, firstname);
        ps.setString(2, lstname);
        ps.setString(3, email);
        ps.setString(4, age);
        ps.setString(5, mob);
        ps.setString(6, city);
        ps.setString(7, zip);
        ps.setString(8, user);
        ps.setString(9, pass);
        int i=ps.executeUpdate();
        ps.close();
        
          if(i>0)
          {
            //out.println("You are successfully registered");
            RequestDispatcher rd=request.getRequestDispatcher("Regsuc.jsp");  
			rd.forward(request,response);
          }
        
        }
        catch(Exception se)
        {
            se.printStackTrace();
            out.println("User Id Already Available");
            
            out.println("<a href=\"reg.jsp\">    Go Back</a>");
            
        }
	
      }
  }