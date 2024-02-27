<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 27-02-2024
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculate Grade</title>
</head>
<body>
<h2>Calculate Grade</h2>
<%!
    String calculateGrade(int[] marks) {
        int total = 0;
        for(int mark : marks) {
            total += mark;
        }
        int average = total / marks.length;
        if(average >= 90) {
            return "A";
        } else if(average >= 80) {
            return "B";
        } else if(average >= 70) {
            return "C";
        } else if(average >= 60) {
            return "D";
        } else {
            return "F";
        }
    }
%>
<%
    String[] marks = (String[]) request.getAttribute("marks");
    int[] intMarks = new int[5];
    for(int i=0; i<marks.length; i++) {
        intMarks[i] = Integer.parseInt(marks[i]);
    }
    String grade = calculateGrade(intMarks);
%>
<p>Total Marks: <%= Arrays.stream(intMarks).sum() %></p>
<p>Grade: <%= grade %></p>
</body>
</html>
