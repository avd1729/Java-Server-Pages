<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Account Details</title>
</head>
<body>

    <h1>Account Details</h1>
    
    <% 
        String username = request.getParameter("username");
        // Establish connection to the database
        Connection conn = null;
        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Set up the connection parameters
            String url = "jdbc:mysql://localhost:3306/db"; // Change to your database URL
            String dbUsername = "root"; // Change to your database username
            String dbPassword = "rootpass"; // Change to your database password
            
            // Establish the connection
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            
            // Prepare and execute SQL query to retrieve user account details
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM bank_accounts WHERE username = ?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String id = rs.getString("id");
                double balance = rs.getDouble("balance");
    %>
    <p>Username: <%= username %></p>
    <p>Account Number: <%= id %></p>
    <p>Balance: $<%= balance %></p>
    <p><a href="bank_closeaccount.jsp">Close Account</a></p>
    <% 
            } else {
                System.out.println("User not found.");
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the connection
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>

</body>
</html>
