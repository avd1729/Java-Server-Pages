package org.example.webapps;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet2")
public class LoginServlet2 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get user input from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if username and password are valid
        if (username != null && password != null && username.equals("user") && password.equals("password")) {
            // Get the session object
            HttpSession session = request.getSession();

            // Increment visit count
            Integer visitCount = (Integer) session.getAttribute("visitCount");
            if (visitCount == null) {
                visitCount = 1;
            } else {
                visitCount++;
            }
            session.setAttribute("visitCount", visitCount);

            // Display the login success message along with visit count
            out.println("<html><body>");
            out.println("<h2>Login Successful!</h2>");
            out.println("<p>Welcome, " + username + ".</p>");
            out.println("<p>You have visited this website " + visitCount + " time(s).</p>");
            out.println("</body></html>");
        } else {
            // Display login failure message
            out.println("<html><body>");
            out.println("<h2>Login Failed!</h2>");
            out.println("<p>Invalid username or password.</p>");
            out.println("</body></html>");
        }
    }
}

