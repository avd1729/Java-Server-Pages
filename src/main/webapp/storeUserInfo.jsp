<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 05-03-2024
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Store User Info</title>
</head>
<body>

<%
    // Get user inputs (you can retrieve these values from a form submission)
    String username = request.getParameter("username");
    String email = request.getParameter("email");

    // Set cookies for username and email
    response.addCookie(new Cookie("username", username));
    response.addCookie(new Cookie("email", email));
%>

<h2>User information stored in cookies successfully!</h2>

</body>
</html>

