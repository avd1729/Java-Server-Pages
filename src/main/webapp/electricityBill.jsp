<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 06-03-2024
  Time: 00:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Electricity Bill Calculator</title>
</head>
<body>
<h1>Electricity Bill Calculator</h1>

<form action="" method="post">
    Units Consumed: <input type="text" name="units"><br>
    <input type="submit" value="Calculate Bill">
</form>

<%-- JSP code to calculate bill based on units consumed --%>
<%
    if(request.getParameter("units") != null) {
        int unitsConsumed = Integer.parseInt(request.getParameter("units"));
        double billAmount = calculateBill(unitsConsumed);
%>
<p>Your Electricity Bill Amount: <%= billAmount %></p>
<% } %>

<%-- Method to calculate bill based on units consumed --%>
<%!
    public double calculateBill(int unitsConsumed) {
        double billAmount = 0;
        if(unitsConsumed <= 100) {
            billAmount = unitsConsumed * 1.50;
        } else if(unitsConsumed <= 300) {
            billAmount = 100 * 1.50 + (unitsConsumed - 100) * 2.50;
        } else {
            billAmount = 100 * 1.50 + 200 * 2.50 + (unitsConsumed - 300) * 3.50;
        }
        return billAmount;
    }
%>
</body>
</html>

