/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmBankManagerFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerSupportAgentFacadeLocal;
import za.ac.tut.ejb.bl.BmLoanOfficerFacadeLocal;
import za.ac.tut.ejb.bl.BmSystemAdministratorFacadeLocal;
import za.ac.tut.ejb.bl.PasswordResetServiceFacadeLocal;
import za.ac.tut.ejb.bl.UserActivityFacadeLocal;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.PasswordResetService;

/**
 *
 * @author Evan
 */
public class ResetPasswordServlet extends HttpServlet {
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
        String token = request.getParameter("token");
        String newPassword = request.getParameter("password");

        PasswordResetService reset = prs.findByToken(token);
        if (reset != null && reset.getCreatedTime() != null &&
            new Date().getTime() - reset.getCreatedTime().getTime() <= 30 * 60 * 1000) {

            String email = reset.getEmail();
            // Find user in any role and update password (hashing strongly recommended)
            BmCustomer customer = bcr.findByEmail(email);
            if (customer != null) {
                customer.setBPassword(newPassword); // Insecure: consider hashing
                bcr.edit(customer);
            }
            // Repeat for admin, manager, etc.

            prs.remove(reset); // Invalidate token

            request.setAttribute("msg", "Password reset successful. You can now log in.");
            request.getRequestDispatcher("index.html").forward(request, response);
        } else {
            request.setAttribute("errMsg", "Invalid or expired token.");
            request.getRequestDispatcher("forgotten_password_page.jsp").forward(request, response);
        }
    }

}
