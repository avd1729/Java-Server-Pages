<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 27-02-2024
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page language="java" %>
<%
    String[] marks = new String[5];
    marks[0] = request.getParameter("subject1");
    marks[1] = request.getParameter("subject2");
    marks[2] = request.getParameter("subject3");
    marks[3] = request.getParameter("subject4");
    marks[4] = request.getParameter("subject5");

    boolean passedAll = true;
    int failedSubjects = 0;
    for(String mark : marks) {
        if(mark == null || mark.equals("") || Integer.parseInt(mark) < 40) {
            passedAll = false;
            failedSubjects++;
        }
    }

    if(passedAll) {
        request.setAttribute("marks", marks);
        RequestDispatcher rd = (RequestDispatcher) request.getRequestDispatcher("calculateGrade.jsp");
        try {
            rd.forward((ServletRequest) request, (ServletResponse) response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    } else {
        request.setAttribute("failedSubjects", failedSubjects);
        RequestDispatcher rd = (RequestDispatcher) request.getRequestDispatcher("displayFailure.jsp");
        try {
            rd.include((ServletRequest) request, (ServletResponse) response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
%>
