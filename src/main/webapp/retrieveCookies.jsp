<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 01-03-2024
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="java.net.URLDecoder" %>
<%
    String username = "";
    String email = "";

    // Retrieve cookies
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                // Decoding username from the cookie
                username = URLDecoder.decode(cookie.getValue(), "UTF-8");
            }
            if (cookie.getName().equals("email")) {
                // Decoding email from the cookie
                email = URLDecoder.decode(cookie.getValue(), "UTF-8");
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Retrieve Cookies Example</title>
</head>
<body>
<h1>Username: <%= username %></h1>
<h1>Email: <%= email %></h1>
</body>
</html>

