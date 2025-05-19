/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.UserActivityFacadeLocal;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmSystemAdministrator;
import za.ac.tut.entities.UserActivity;

/**
 *
 * @author Evan
 */
public class logoutServlet extends HttpServlet {
    @EJB
    private UserActivityFacadeLocal afl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            logoutUser(request, response);
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
    }
        public void logoutUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String userId = (String) request.getSession().getAttribute("userId");

        BmCustomer customer = (BmCustomer) request.getSession().getAttribute("customer");
        if (customer != null) {
            Integer userId = customer.getBCustomerid();  // or whatever the proper getter is
            //String customerEmail = customer.getBEmail();
            trackUserActivity(userId.toString(), "logout");
            request.getSession().invalidate();
        }
        response.sendRedirect("index.html");

    }

    // Method to track activity
    private void trackUserActivity(String userId, String activityType) {
        UserActivity activity = new UserActivity();
        activity.setUserId(userId);
        activity.setActivityType(activityType); // Set activity type
        activity.setActivityTime(new Timestamp(System.currentTimeMillis())); // Current time

        // Optionally, associate the activity with the system administrator or other roles
        BmSystemAdministrator admin = (BmSystemAdministrator) getServletContext().getAttribute("currentAdmin");
        activity.setAdministrator(admin); // Associate with admin if needed

        // Persist the activity to the database
        afl.create(activity);
    }
}
