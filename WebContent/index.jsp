<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wattpad - Discover a World of Unlimited Stories</title>
	<!-- include css file here-->
    <link rel="stylesheet" href="css/style.css"/>
	<!-- include icon file here for chrome-->
	<link rel="icon" type="image/png" href="images/wattpad_icon.png" sizes="16x16">
	<!-- include icon file here for IE-->
    <link rel="shortcut icon" type="image/x-icon" href="images/wattpad_icon.ico" />	 
	<!-- include javascript file here-->
    <script src="js/login.js"></script>
<title>Insert title here</title>
</head>
  <body bgcolor="#FF8000">
  <div class="header">
    <img class="banner" src="images/wattpad.png" width="200" height="50">
  </div>
	<div class="container" align="center">
	  <div class="main" >
		<h2>Login</h2><hr/>
 
		<form action="loginServlet" method="post">
		  <label>User Name :</label><br>
		  <input type="text" name="username" /><br>
 
		  <label>Password :</label><br>
		  <input type="password" name="userpass" /><br>
 
		  <input type="submit" value="Login" />
		</form>
		<h3><span>Don't have an account? <a class="on-signup" href="reg.jsp">Sign up</a></span></h3>
		<%
		if(request.getAttribute("errorMessage") != null){%>
        <%=request.getAttribute("errorMessage")%>
      <%}%>
	  </div>
	</div>
</body>
</html>