<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 27-02-2024
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Grade Calculation Error</title>
</head>
<body>
<h2>Grade Calculation Error</h2>
<p>Grade cannot be calculated. The student has failed in <%= request.getAttribute("failedSubjects") %> subjects.</p>
</body>
</html>
