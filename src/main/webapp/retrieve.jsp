<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 28-02-2024
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, org.example.webapps.DBManager" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Retrieve PIN</title>
</head>
<body>
<h1>Retrieve PIN</h1>
<%
    String searchKey = request.getParameter("searchKey");
    String searchType = request.getParameter("searchType");

    if (searchKey != null && !searchKey.isEmpty() && searchType != null && !searchType.isEmpty()) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            try {
                connection = DBManager.getConnection();
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String sql = "";
            if (searchType.equals("email")) {
                sql = "SELECT pin FROM user_accounts WHERE email = ?";
            } else if (searchType.equals("phone")) {
                sql = "SELECT pin FROM user_accounts WHERE phone_number = ?";
            }

            statement = connection.prepareStatement(sql);
            statement.setString(1, searchKey);

            resultSet = statement.executeQuery();

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
    } catch (SQLException e) {
        System.out.println("An error occurred: " + e.getMessage());
        e.printStackTrace();
    } finally {
        DBManager.close(connection, statement, resultSet);
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

