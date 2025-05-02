/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.BmAccountFacadeLocal;
import za.ac.tut.ejb.bl.BmTransactionFacadeLocal;
import za.ac.tut.entities.BmAccount;
import za.ac.tut.entities.BmTransaction;

/**
 *
 * @author Evan
 */
public class transferFundsServlet extends HttpServlet {
    @EJB
    private BmAccountFacadeLocal bal;
    @EJB
    private BmTransactionFacadeLocal btfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //HttpSession session = request.getSession();
        Integer fromAccountId = Integer.parseInt(request.getParameter("fromAccountId"));
        Integer toAccountId = Integer.parseInt(request.getParameter("toAccountId"));
        BigDecimal amount;
        String transactionType = "Transfer";
        try {
            // Convert the amount from String to BigDecimal
            amount = new BigDecimal(request.getParameter("amount"));
        } catch (NumberFormatException e){
            e.printStackTrace();
            request.setAttribute("errMsg", "Invalid amount format. Please enter a valid number.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Retrieve accounts
        BmAccount senderAccount = bal.find(fromAccountId);
        BmAccount recipientAccount = bal.find(toAccountId);

        if (senderAccount == null || recipientAccount == null) {
            request.setAttribute("errMsg", "Invalid account ID(s). Please check and try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Check for sufficient funds
        if (senderAccount.getBBalance().compareTo(amount) < 0) {
            request.setAttribute("errMsg", "Insufficient funds in your account.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Perform the transfer
        try {
            // Update sender's account balance
            senderAccount.setBBalance(senderAccount.getBBalance().subtract(amount));
            bal.edit(senderAccount); // Assuming edit method updates the account in the database

            // Update recipient's account balance
            recipientAccount.setBBalance(recipientAccount.getBBalance().add(amount));
            bal.edit(recipientAccount); // Update recipient's account
            
            //Senders Account Update object
            BmTransaction transaction =createTransaction(senderAccount,amount,transactionType);
            // Optionally, create a transaction record
            btfl.create(transaction); // Implement this method as needed
            
            BmTransaction transactionReceiver = createTransaction(recipientAccount,amount,transactionType);
            btfl.create(transactionReceiver);
            // Redirect or forward to a success page
            request.setAttribute("successMessage", "Transfer successful!");
            request.getRequestDispatcher("successPage.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errMsg", "An error occurred while processing the transfer. Please try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    private BmTransaction createTransaction(BmAccount account,BigDecimal amount,String transactionType){
        
        Date transactionDate = new Date();
        
        BmTransaction transactionsAcount = new BmTransaction();
        transactionsAcount.setBAccountid(account);
        transactionsAcount.setBTransactiontype(transactionType);
        transactionsAcount.setBAmount(amount);
        transactionsAcount.setBTransactiondate(transactionDate);
        return transactionsAcount;
    }
}
