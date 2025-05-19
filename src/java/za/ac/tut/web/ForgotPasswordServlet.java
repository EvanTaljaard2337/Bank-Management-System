/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.BmBankManagerFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerSupportAgentFacadeLocal;
import za.ac.tut.ejb.bl.BmLoanOfficerFacadeLocal;
import za.ac.tut.ejb.bl.BmSystemAdministratorFacadeLocal;
import za.ac.tut.ejb.bl.PasswordResetServiceFacadeLocal;
import za.ac.tut.ejb.bl.UserActivityFacadeLocal;
import za.ac.tut.entities.BmBankManager;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmCustomerSupportAgent;
import za.ac.tut.entities.BmLoanOfficer;
import za.ac.tut.entities.BmSystemAdministrator;
import za.ac.tut.entities.PasswordResetService;
import za.ac.tut.util.EmailUtility;

/**
 *
 * @author Evan
 */
public class ForgotPasswordServlet extends HttpServlet {
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
    @EJB
    private PasswordResetServiceFacadeLocal prs;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");

        // Search across all roles
        boolean exists = (bcr.findByEmail(email) != null) || (bsa.findByEmail(email) != null) ||
                         (bbm.findByEmail(email) != null) || (bcs.findByEmail(email) != null) ||
                         (blo.findByEmail(email) != null);

        if (exists) {
            try {
                // 1. Generate token
                String token = UUID.randomUUID().toString();

                // 2. Save token to DB (via EJB)
                PasswordResetService resetEntry = new PasswordResetService();
                resetEntry.setEmail(email);
                resetEntry.setToken(token);
                resetEntry.setCreatedTime(new java.util.Date());
                prs.create(resetEntry); // persists token

                // 3. Compose and send email
                String link = "http://localhost:8080/BMSWebApplication/reset_password.jsp?token=" + token;
                String subject = "Password Reset Request";
                String body = "Dear user,\n\nClick the link below to reset your password:\n" + link
                            + "\n\nIf you did not request this, please ignore this email.";
                String password="lvpd vobd ujuk esbb";
                EmailUtility.sendEmail(email, subject, body,email,password);

                // 4. Redirect to login with success message
                request.setAttribute("msg", "A password reset link has been sent to your email.");
                request.getRequestDispatcher("index.html").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errMsg", "Failed to send email: " + e.getMessage());
                request.getRequestDispatcher("forgotten_password_page.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("errMsg", "Email address not registered.");
            request.getRequestDispatcher("forgotten_password_page.jsp").forward(request, response);
        }
    }
}
