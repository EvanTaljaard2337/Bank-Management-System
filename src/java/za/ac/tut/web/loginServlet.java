/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Set;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.rmi.server.Dispatcher;
import za.ac.tut.ejb.bl.BmBankManagerFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerSupportAgentFacadeLocal;
import za.ac.tut.ejb.bl.BmLoanOfficerFacadeLocal;
import za.ac.tut.ejb.bl.BmSystemAdministratorFacadeLocal;
import za.ac.tut.ejb.bl.UserActivityFacadeLocal;
import za.ac.tut.entities.BmBankManager;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmCustomerSupportAgent;
import za.ac.tut.entities.BmLoanOfficer;
import za.ac.tut.entities.BmSystemAdministrator;
import za.ac.tut.entities.UserActivity;

/**
 *
 * @author Evan
 */
public class loginServlet extends HttpServlet {
    @EJB
    private BmCustomerFacadeLocal bcr;
    @EJB
    private BmSystemAdministratorFacadeLocal bsa;
    @EJB
    private BmBankManagerFacadeLocal bbm;
    @EJB 
    private BmCustomerSupportAgentFacadeLocal bcs;
    @EJB 
    private BmLoanOfficerFacadeLocal blo;
    @EJB
    private UserActivityFacadeLocal afl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String userPassword = request.getParameter("password");

        // Call the login function to authenticate and track user activity
        loginUser(email, userPassword, request, response);
    }

    // Login method
    public void loginUser(String email, String password, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        try {
            // Try to find the user in different roles
            BmCustomer customer = bcr.findByEmailAndPassword(email, password);
            BmSystemAdministrator admin = bsa.findByEmailAndPassword(email, password);
            BmBankManager manager = bbm.findByEmailAndPassword(email, password);
            BmCustomerSupportAgent support = bcs.findByEmailAndPassword(email, password);
            BmLoanOfficer officer = blo.findByEmailAndPassword(email, password);
            
            if (customer != null) {
                request.setAttribute("customer", customer);
                session.setAttribute("customer", customer);
                // Track login activity
                trackUserActivity(customer.getBCustomerid().toString(), "login");
                RequestDispatcher disp = request.getRequestDispatcher("customer_dashboard.jsp");
                disp.forward(request, response);
            }
            else if (admin != null) {
                request.setAttribute("admin", admin);
                session.setAttribute("admin", admin);
                // Track login activity
                trackUserActivity(admin.getBAdminid().toString(), "login");
                RequestDispatcher disp = request.getRequestDispatcher("adminDashboard.jsp");
                disp.forward(request, response);
            }
            else if (manager != null) {
                request.setAttribute("manager", manager);
                session.setAttribute("manager", manager);
                // Track login activity
                trackUserActivity(manager.getBManagerid().toString(), "login");
                RequestDispatcher disp = request.getRequestDispatcher("bankManagerDashboard.jsp");
                disp.forward(request, response);
            }
            else if (support != null) {
                request.setAttribute("support", support);
                session.setAttribute("support", support);
                // Track login activity
                trackUserActivity(support.getBAgentid().toString(), "login");
                RequestDispatcher disp = request.getRequestDispatcher("supportAgentDashboard.jsp");
                disp.forward(request, response);
            }
            else if (officer != null) {
                request.setAttribute("officer", officer);
                session.setAttribute("officer", officer);
                // Track login activity
                trackUserActivity(officer.getBOfficerid().toString(), "login");
                RequestDispatcher disp = request.getRequestDispatcher("loanOfficerDashboard.jsp");
                disp.forward(request, response);
            }
            else {
                request.setAttribute("errMsg", "Invalid email or password");
                RequestDispatcher disp = request.getRequestDispatcher("index.html");
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
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

    public void logoutUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = (String) request.getSession().getAttribute("userId");

        if (userId != null) {
            // Track logout activity
            trackUserActivity(userId, "logout");

            // Invalidate session
            request.getSession().invalidate();
        }

        // Redirect to login page
        response.sendRedirect("index.html");
    }
}



