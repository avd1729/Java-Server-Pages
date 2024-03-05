<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 06-03-2024
  Time: 00:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.webapps.IncomeTaxCalculator" %>
<!DOCTYPE html>
<html>
<head>
    <title>Income Tax Calculator</title>
</head>
<body>
<h1>Income Tax Calculator</h1>

<jsp:useBean id="calculator" class="org.example.webapps.IncomeTaxCalculator" scope="request" />
<jsp:setProperty name="calculator" property="income" param="income" />

<form action="" method="post">
    Enter your income: <input type="text" name="income"><br>
    <input type="submit" value="Calculate Tax">
</form>

<%-- Call the calculateTax method after submitting the form --%>
<% if (request.getParameter("income") != null) { %>
<% calculator.calculateTax(); %>
<p>Your income tax is: <%= calculator.getTax() %></p>
<% } %>
</body>
</html>



