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
public class withdrawFundsServlet extends HttpServlet {
    @EJB
    private BmAccountFacadeLocal bfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer accountId =Integer.parseInt(request.getParameter("withdrawAccountId"));
        //Double ammount = Double.parseDouble(request.getParameter("withdrawAmount"));
        BigDecimal amount = null;
        try{
            amount = new BigDecimal(request.getParameter("withdrawAmount"));
        }
        catch(NumberFormatException e){
            e.printStackTrace();
            request.setAttribute("errMsg","Invalid amount format. Please enter a valid number.");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
        BmAccount account = bfl.find(accountId);
                // Check for sufficient funds
        if (account.getBBalance().compareTo(amount) < 0) {
            request.setAttribute("errMsg", "Insufficient funds in your account.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
                // Perform the transfer
        try {
            // Update sender's account balance
            account.setBBalance(account.getBBalance().subtract(amount));
            bfl.edit(account); // Assuming edit method updates the account in the database
            request.setAttribute("successMessage", "Withdraw was successful!");
            request.setAttribute("withdrawAmount", amount);
            request.getRequestDispatcher("withdraw_successful.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errMsg", "An error occurred while processing the withdrawel. Please try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

