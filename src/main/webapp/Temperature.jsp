<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 20-02-2024
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    String celsStr = request.getParameter("temp_in_cels");
    double cels = 0.0;
    if(celsStr != null && !celsStr.isEmpty()) {
        cels = Double.parseDouble(celsStr);
    }

    double ans1 = (1.8 * cels) + 32;

    String fahrStr = request.getParameter("temp_in_fahr");
    double fahr = 0.0;
    if(fahrStr != null && !fahrStr.isEmpty()) {
        fahr = Double.parseDouble(fahrStr);
    }

    double ans2 = (5/9) * (fahr - 32);

%>

<form>
    <h3>Celsius to Fahrenheit</h3>
    temp: <input type="text" name="temp_in_cels" ><br><br>
    <input type="submit" value="convert"><br><br>
</form>

<form>
    <h3>Fahrenheit to Celsius</h3>
    temp: <input type="text" name="temp_in_fahr" ><br><br>
    <input type="submit" value="convert"><br><br>
</form>

<%-- Displaying the result --%>
<% if(celsStr != null) { %>
<p>Temperature in Fahrenheit: <%= ans1 %></p>
<% } %>

<% if(fahrStr != null) { %>
<p>Temperature in Celcius: <%= ans2 %></p>
<% } %>
</body>
</html>
