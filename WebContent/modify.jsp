<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "wattpad";
String userId = "root";
String password = "password";
String val = (String) session.getAttribute("name");
System.out.println("###DISPLAY##"+val );
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>First_Name</b></td>
<td><b>Last_Name</b></td>
<td><b>EmailAddress</b></td>
<td><b>Age</b></td>
<td><b>Mobile</b></td>
<td><b>City</b></td>
<td><b>Zip_Code</b></td>
<td><b>UserName</b></td>
<td><b>Password</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM registration where UserName='"+val+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">
StringresultSet.getString("First_Name")
String firstname = request.getParameter("First_Name");
String firstname = request.getParameter("First_Name");
<td><%=resultSet.getString("First_Name") %></td>
<td><%=resultSet.getString("Last_Name") %></td>
<td><%=resultSet.getString("EmailAddress") %></td>
<td><%=resultSet.getString("Age") %></td>
<td><%=resultSet.getString("Mobile") %></td>
<td><%=resultSet.getString("City") %></td>
<td><%=resultSet.getString("Zip_Code") %></td>
<td><%=resultSet.getString("UserName") %></td>
<td><%=resultSet.getString("Password") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>





