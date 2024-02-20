<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 20-02-2024
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.example.webapps.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>

<jsp:useBean id="employee" class="org.example.webapps.Employee" scope="request" />

<jsp:setProperty name="employee" property="name" param="name" />
<jsp:setProperty name="employee" property="age" param="age" />

<!DOCTYPE html>
<html>
<head>
    <title>Employee Information</title>
</head>
<body>
<h2>Employee Information:</h2>
<p>Employee name is <%= employee.getName() %></p>
<p>Employee age is <%= employee.getAge() %></p>
</body>
</html>
