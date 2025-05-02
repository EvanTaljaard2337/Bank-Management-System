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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmAccountFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmTransactionFacadeLocal;
import za.ac.tut.entities.BmAccount;
import za.ac.tut.entities.BmTransaction;

/**
 *
 * @author Evan
 */
public class depositFundsServlet extends HttpServlet {
    @EJB
    private BmAccountFacadeLocal afl;
    @EJB
    private BmCustomerFacadeLocal cfl;
    @EJB
    private BmTransactionFacadeLocal btfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer toAccountId = Integer.parseInt(request.getParameter("toAccountId"));
        Integer fromAccountId = Integer.parseInt(request.getParameter("fromAccountId"));
        BigDecimal amount = null;
        String transactionType="Deposit";
        try{
            amount = new BigDecimal(request.getParameter("depositAmount"));
        }
        catch(NumberFormatException e){
            e.printStackTrace();
            request.setAttribute("errMsg", "Invalid amount format. Please enter a valid number.");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request,response);
        }
        BmAccount custAccount1 = afl.find(fromAccountId);
        BmAccount custAccount2 = afl.find(toAccountId);
        if (custAccount1 == null || custAccount2 == null) {
            request.setAttribute("errMsg", "Invalid account ID(s). Please check and try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
                // Check for sufficient funds
        if (custAccount1.getBBalance().compareTo(amount) < 0) {
            request.setAttribute("errMsg", "Insufficient funds in your account.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
                // Perform the transfer
        try {
            // Update sender's account balance
            custAccount1.setBBalance(custAccount1.getBBalance().subtract(amount));
            afl.edit(custAccount1); // Assuming edit method updates the account in the database

            // Update recipient's account balance
            custAccount2.setBBalance(custAccount2.getBBalance().add(amount));
            afl.edit(custAccount2); // Update recipient's account
            
            //Senders Account Update object
            BmTransaction transaction =createTransaction(custAccount1,amount,transactionType);
            // Optionally, create a transaction record
            btfl.create(transaction); // Implement this method as needed
            
            BmTransaction transactionReceiver = createTransaction(custAccount2,amount,transactionType);
            btfl.create(transactionReceiver);
            // Redirect or forward to a success page
            request.setAttribute("accountName",custAccount2);
            request.getRequestDispatcher("deposit_outcome.jsp").forward(request, response);
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
