<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 24-02-2024
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<h2>Welcome User</h2>
<%
    Integer visitCount = (Integer)session.getAttribute("visitCount");
    if (visitCount == null) {
        visitCount = 0;
    }
%>
<p>You have visited this website <%= visitCount %> times.</p>
</body>
</html>


