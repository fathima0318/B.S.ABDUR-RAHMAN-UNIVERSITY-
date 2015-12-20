<%@page import="java.sql.*"%>
<%
String Password = request.getParameter("Password");
String sts1 = "Successfully Updated";
String val = (String) session.getAttribute("name");

try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wattpad","root", "password");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update registration set Password='"+Password+"' where UserName='"+val+"'");
response.sendRedirect("pwdUpdate.jsp");
request.getSession().setAttribute("sts", sts1);
}
catch(Exception e){
System.out.println(e);
    }
%>