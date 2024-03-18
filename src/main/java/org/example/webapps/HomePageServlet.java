package org.example.webapps;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HomePageServlet")
public class HomePageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String userType = request.getParameter("userType");

        if (userType != null) {
            if (userType.equals("new")) {
                // Redirect to New User Registration page
                response.sendRedirect("new_user_registration.jsp");
            } else if (userType.equals("existing")) {
                // Redirect to Existing User Login page
                response.sendRedirect("existing_user_login.jsp");
            }
        } else {
            // Display error message if userType parameter is missing
            response.getWriter().println("<html><body><h3>Error: Please specify user type.</h3></body></html>");
        }
    }
}
