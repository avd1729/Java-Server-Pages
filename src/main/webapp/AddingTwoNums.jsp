<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 11-02-2024
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Addition of Two Numbers</h2>

<%
    // Retrieving the parameters from the request
    String num1Str = request.getParameter("num1");
    String num2Str = request.getParameter("num2");

    // Default values in case the parameters are not provided or are not valid numbers
    int num1 = 0;
    int num2 = 0;

    // Parsing the parameters to integers if they are not null
    if(num1Str != null && !num1Str.isEmpty()) {
        num1 = Integer.parseInt(num1Str);
    }
    if(num2Str != null && !num2Str.isEmpty()) {
        num2 = Integer.parseInt(num2Str);
    }

    // Performing the addition
    int sum = num1 + num2;
%>

<form>
    Number 1: <input type="text" name="num1" value="<%= num1 %>"><br>
    Number 2: <input type="text" name="num2" value="<%= num2 %>"><br>
    <input type="submit" value="Add">
</form>

<%-- Displaying the result --%>
<% if(num1Str != null && num2Str != null) { %>
<p>Sum: <%= sum %></p>
<% } %>
</body>
</html>

