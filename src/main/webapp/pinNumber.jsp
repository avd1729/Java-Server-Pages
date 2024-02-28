<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 28-02-2024
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forgot PIN</title>
</head>
<body>
<h1>Forgot PIN</h1>
<form method="post" action="retrievePIN.jsp">
    <label for="identifier">Enter Email or Phone Number:</label>
    <input type="text" id="identifier" name="identifier" required>
    <input type="submit" value="Retrieve PIN">
</form>

<%-- Retrieve PIN from Database --%>
<%!
    private String retrievePIN(String identifier) {
        String pin = null;
        try {
            // Establish database connection
            Class.forName("your.database.driver.ClassName");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "rootpass");

            // Query to fetch PIN based on email or phone number
            String query = "SELECT pin FROM users WHERE email = ? OR phone_number = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, identifier);
            pstmt.setString(2, identifier);
            ResultSet rs = pstmt.executeQuery();

            // If a matching record is found, retrieve the PIN
            if (rs.next()) {
                pin = rs.getString("pin");
            }

            // Close connections
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pin;
    }
%>

<%-- Process form submission --%>
<%
    if (request.getMethod().equals("POST")) {
        String identifier = request.getParameter("identifier");
        String pin = retrievePIN(identifier);

        if (pin != null) {
            System.out.println("<p>Your PIN is: " + pin + "</p>");
        } else {
            System.out.println("<p>No PIN found for the provided email or phone number.</p>");
        }
    }
%>
</body>
</html>

