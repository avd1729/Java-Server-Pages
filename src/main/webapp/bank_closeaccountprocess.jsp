<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Close Account Process</title>
</head>
<body>

    <h1>Close Account Process</h1>
    
    <% 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
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
            
            // Prepare and execute SQL query to delete the user account
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM bank_accounts WHERE username = ? AND password = ?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
    %>
    <p>Account closed successfully.</p>
    <% 
            } else {
                System.out.println("Failed to close account. Please check your credentials.");
            }
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

    <!-- Add a button to redirect to bank_login.jsp -->
    <form action="bank_login.jsp">
        <input type="submit" value="Back to Login">
    </form>

</body>
</html>
