<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%--<h1><%= "Hello World!" %>--%>
</h1>
<br/>
<form id="inputForm">
    <label for="userInput">Enter your text:</label><br>
    <input type="text" id="userInput" name="userInput"><br><br>
    <input type="submit" value="Submit">
</form>
<div id="output"></div>
<script>
    document.getElementById("inputForm").addEventListener("submit", function(event) {
        event.preventDefault(); // Prevent the default form submission

        // Get the input value
        const userInput = document.getElementById("userInput").value;

        // Display the input value
        document.getElementById("output").innerHTML = "<p> Hello, " + userInput + "</p>";

        // Optional: Clear the input field after submission
        document.getElementById("userInput").value = "";
    });
</script>
</body>
</html>