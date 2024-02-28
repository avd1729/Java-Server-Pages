<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 28-02-2024
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
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
<%
    String identifier = request.getParameter("identifier");

    // Check if identifier is provided
    if (identifier != null && !identifier.isEmpty()) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // JDBC Connection parameters
            String url = "jdbc:mysql://localhost:3306/db";
            String username = "root";
            String password = "rootpass";

            // Establishing connection
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);

            // SQL query
            String sql = "SELECT pin FROM user_accounts WHERE email = ? OR phone_number = ?";

            // Prepared statement to avoid SQL injection
            statement = connection.prepareStatement(sql);
            statement.setString(1, identifier);
            statement.setString(2, identifier);

            // Executing query
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String pin = resultSet.getString("pin");
%>
<p>Your PIN: <%= pin %></p>
<%
} else {
%>
<p>No PIN found for the provided identifier.</p>
<%
        }
    } catch (SQLException | ClassNotFoundException e) {
        System.out.println("An error occurred: " + e.getMessage());
        e.printStackTrace();
    } finally {
        // Closing resources
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.out.println("An error occurred while closing resources: " + e.getMessage());
            e.printStackTrace();
        }
    }
} else {
%>
<p>Please provide an identifier.</p>
<%
    }
%>
<a href="index.jsp">Back to Home</a>
</body>
</html>







