<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 28-02-2024
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Retrieve PIN</title>
</head>
<body>
<h1>Retrieve PIN</h1>
<%-- Retrieving form data --%>
<%
    String searchKey = request.getParameter("searchKey");
    String searchType = request.getParameter("searchType");

    if (searchKey != null && !searchKey.isEmpty() && searchType != null && !searchType.isEmpty()) {
        try {
            // JDBC Connection parameters
            String url = "jdbc:mysql://localhost:3306/db";
            String username = "root";
            String password = "rootpass";

            // Establishing connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            // SQL query based on search type
            String sql = "";
            if (searchType.equals("email")) {
                sql = "SELECT pin FROM user_accounts WHERE email = ?";
            } else if (searchType.equals("phone")) {
                sql = "SELECT pin FROM user_accounts WHERE phone_number = ?";
            }

            // Prepared statement to avoid SQL injection
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, searchKey);

            // Executing query
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String pin = resultSet.getString("pin");
%>
<p>Your PIN: <%= pin %></p>
<%
} else {
%>
<p>No PIN found for the provided <%= searchType %>.</p>
<%
        }

        // Closing resources
        resultSet.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        System.out.println("Exception: " + e.getMessage());
    }
} else {
%>
<p>Please provide both search key and search type.</p>
<%
    }
%>
<a href="index.jsp">Back to Home</a>
</body>
</html>

