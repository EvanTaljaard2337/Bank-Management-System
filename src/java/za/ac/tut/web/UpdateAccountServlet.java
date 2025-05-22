/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmAccountFacadeLocal;
import za.ac.tut.entities.BmAccount;

/**
 *
 * @author Evan
 */
public class UpdateAccountServlet extends HttpServlet {
    @EJB
    private BmAccountFacadeLocal afl;
    @EJB
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            try {
                Integer accountId = Integer.parseInt(request.getParameter("accountId"));
                Integer customerId = Integer.parseInt(request.getParameter("customerId"));
                String accountType = request.getParameter("accountType");
                String status = request.getParameter("status");
                BigDecimal balance = new BigDecimal(request.getParameter("balance"));

                BmAccount custAcc = afl.find(accountId);
                if (custAcc != null) {
                    // 🛠️ Update the fields with new values
                    custAcc.setBAccounttype(accountType);
                    custAcc.setBStatus(status);
                    custAcc.setBBalance(balance);

                    afl.edit(custAcc);  // Save updated entity

                    request.setAttribute("message", "Customer account updated successfully!");
                    request.getRequestDispatcher("update_account_page_outcome.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "Account not found.");
                    request.getRequestDispatcher("update_account_page_outcome.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid number format in one or more fields.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("message", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
    }
}
           