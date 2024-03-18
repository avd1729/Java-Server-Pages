<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 18-03-2024
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Date and Time Display</title>
</head>
<body>
<h2>Current Date and Time</h2>

<%-- Retrieve and display the result sent by the servlet --%>
<% String dateTime = (String) request.getAttribute("dateTime"); %>
<% if (dateTime != null) { %>
<p>The current date and time is: <%= dateTime %></p>
<% } else { %>
<p>Unable to retrieve current date and time.</p>
<% } %>
</body>
</html>
