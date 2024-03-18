<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 18-03-2024
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New User Registration</title>
</head>
<body>
<h2>New User Registration</h2>
<form action="RegistrationServlet" method="post">
    Enter your details:<br>
    Name: <input type="text" name="name"><br>
    Email: <input type="email" name="email"><br>
    Password: <input type="password" name="password"><br>
    <input type="submit" value="Register">
</form>
</body>
</html>
