<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 01-03-2024
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%
    // Get the username and email from request parameters or session
    String username = request.getParameter("username");
    String email = request.getParameter("email");

    // Encoding the username and email to store in the cookie
    String encodedUsername = URLEncoder.encode(username, "UTF-8");
    String encodedEmail = URLEncoder.encode(email, "UTF-8");

    // Create cookies
    Cookie usernameCookie = new Cookie("username", encodedUsername);
    Cookie emailCookie = new Cookie("email", encodedEmail);

    // Set cookies expiry time - for example, 1 hour
    int expiryTimeInSeconds = 3600; // 1 hour
    usernameCookie.setMaxAge(expiryTimeInSeconds);
    emailCookie.setMaxAge(expiryTimeInSeconds);

    // Add cookies to the response
    response.addCookie(usernameCookie);
    response.addCookie(emailCookie);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Cookie Example</title>
</head>
<body>
<h1>Cookies Set Successfully</h1>
</body>
</html>

