package org.example.webapps;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.net.URLDecoder;

import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/CookieAuthenticationServlet")
public class CookieAuthenticationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Creating a JSON object to store user credentials
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("user1", "pwd1");
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        try {
            jsonObject.put("user2", "pwd2");
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        try {
            jsonObject.put("user3", "pwd3");
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        try {
            jsonObject.put("user4", "pwd4");
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }

        // Encode the JSON string
        String encodedJson = URLEncoder.encode(jsonObject.toString(), "UTF-8");

        // Creating a new Cookie with user credentials in JSON format
        Cookie cookie = new Cookie("userCredentials", encodedJson);

        // Add the cookie to the response
        response.addCookie(cookie);

        // Getting the login details from the request
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        // Check if login details are empty
        if(userId == null || password == null || userId.isEmpty() || password.isEmpty()) {
            out.println("<html><body><h3>Please enter both user ID and password.</h3></body></html>");
            return;
        }

        // Read the userCredentials from the Cookie
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("userCredentials")) {
                    // Decode the JSON string
                    String decodedJson = URLDecoder.decode(c.getValue(), "UTF-8");
                    JSONObject storedCredentials = null;
                    try {
                        storedCredentials = new JSONObject(decodedJson);
                    } catch (JSONException e) {
                        throw new RuntimeException(e);
                    }
                    try {
                        if (storedCredentials.has(userId) && storedCredentials.getString(userId).equals(password)) {
                            out.println("<html><body><h3>Login successful!</h3></body></html>");
                            return;
                        }
                    } catch (JSONException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                }
            }
        }
        out.println("<html><body><h3>Invalid user ID or password. Please try again.</h3></body></html>");
    }
}





