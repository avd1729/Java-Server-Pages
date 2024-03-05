<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Process</title>
</head>
<body>

    <h1>Login Process</h1>
    
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
            
            // Prepare and execute SQL query to validate user login credentials
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM bank_accounts WHERE username = ? AND password = ?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // Redirect to account details page if login is successful
                response.sendRedirect("bank_accountdetails.jsp?username=" + username);
            } else {
                // Display error message if login fails
                System.out.println("Invalid username or password. Please try again.");
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
