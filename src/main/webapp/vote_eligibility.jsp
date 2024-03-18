<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 18-03-2024
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Voting Eligibility Check</title>
</head>
<body>
<h2>Check Voting Eligibility</h2>
<form action="VoteEligibilityServlet" method="post">
    Enter your age: <input type="text" name="age">
    <input type="submit" value="Check Eligibility">
</form>

<%-- Display the result here --%>
<%
    // Retrieve the result from the servlet
    String result = (String) request.getAttribute("result");
    if (result != null) {
%>
<p><%= result %></p>
<%
    }
%>
</body>
</html>
