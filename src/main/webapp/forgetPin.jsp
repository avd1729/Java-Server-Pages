<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 28-02-2024
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Forget PIN</title>
</head>
<body>
<h1>Forget PIN</h1>
<form action="retrieve.jsp" method="post">
  <label for="searchKey">Enter your Email or Phone Number:</label><br>
  <input type="text" id="searchKey" name="searchKey" required><br>
  <input type="radio" id="email" name="searchType" value="email" checked>
  <label for="email">Email</label>
  <input type="radio" id="phone" name="searchType" value="phone">
  <label for="phone">Phone Number</label><br>
  <input type="submit" value="Retrieve PIN">
</form>
</body>
</html>

