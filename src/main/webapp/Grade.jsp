<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 27-02-2024
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Enter Student Marks</title>
</head>
<body>
<h2>Enter Student Marks</h2>
<form action="checkMarks.jsp" method="post">
    Subject 1: <input type="text" name="subject1"><br>
    Subject 2: <input type="text" name="subject2"><br>
    Subject 3: <input type="text" name="subject3"><br>
    Subject 4: <input type="text" name="subject4"><br>
    Subject 5: <input type="text" name="subject5"><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
