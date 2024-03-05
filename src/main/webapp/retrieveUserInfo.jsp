<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 05-03-2024
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Retrieve User Info</title>
</head>
<body>

<%
    // Retrieve cookies
    Cookie[] cookies = request.getCookies();

    String username = "";
    String email = "";

    // Check if cookies exist
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                username = cookie.getValue();
            } else if (cookie.getName().equals("email")) {
                email = cookie.getValue();
            }
        }
    }
%>

<h2>User Information:</h2>
<p>Username: <%= username %></p>
<p>Email: <%= email %></p>

</body>
</html>

