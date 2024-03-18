<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 18-03-2024
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Existing User Login</title>
</head>
<body>
<h2>Existing User Login</h2>
<form action="LoginServlet3" method="post">
    Enter your credentials:<br>
    Email: <input type="email" name="email"><br>
    Password: <input type="password" name="password"><br>
    <input type="submit" value="Login">
</form>
</body>
</html>
