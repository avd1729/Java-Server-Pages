<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 18-03-2024
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Form</title>
</head>
<body>
<h2>Login</h2>
<form action="CookieAuthenticationServlet" method="post">
    Enter User ID: <input type="text" name="userId"><br>
    Enter Password: <input type="password" name="password"><br>
    <input type="submit" value="Login">
</form>
</body>
</html>
