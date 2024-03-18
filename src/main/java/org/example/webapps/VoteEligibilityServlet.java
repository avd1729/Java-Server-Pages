package org.example.webapps;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VoteEligibilityServlet")
public class VoteEligibilityServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get age parameter from the request
        String ageString = request.getParameter("age");

        try {
            // Convert ageString to integer
            int age = Integer.parseInt(ageString);

            // Check eligibility
            String result;
            if (age >= 18) {
                result = "Congratulations! You are eligible to vote.";
            } else {
                result = "Sorry, you are not eligible to vote yet.";
            }

            // Set the result in request scope
            request.setAttribute("result", result);

            // Forward the request to the JSP file
            request.getRequestDispatcher("vote_eligibility.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle invalid input for age
            String result = "Invalid input for age. Please enter a valid number.";

            // Set the result in request scope
            request.setAttribute("result", result);

            // Forward the request to the JSP file
            request.getRequestDispatcher("vote_eligibility.jsp").forward(request, response);
        }
    }
}


