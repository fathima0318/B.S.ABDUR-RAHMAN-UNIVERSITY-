<%@page import="java.sql.*"%>
<%

String firstname = request.getParameter("First_Name");
String lstname = request.getParameter("Last_Name");
String email = request.getParameter("EmailAddress");	  
String Age = request.getParameter("Age");  
String Mobile = request.getParameter("Mobile");
String City = request.getParameter("City");
String Zip_Code = request.getParameter("Zip_Code");	
String val = (String) session.getAttribute("name");

String sts = "Successfully Updated";

try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wattpad","root", "password");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update registration set First_Name='"+firstname+"',Last_Name='"+lstname+"',EmailAddress='"+email+"',Age='"+Age+"',Mobile='"+Mobile+"',City='"+City+"',Zip_Code='"+Zip_Code+"' where UserName='"+val+"'");
response.sendRedirect("disply.jsp");
request.getSession().setAttribute("sts", sts);
}
catch(Exception e){
System.out.println(e);
    }
%>