/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
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
public class FindCustomerAccountServlet extends HttpServlet {
    @EJB
    private BmAccountFacadeLocal afl;
    @Override
       protected void doPost(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
           String param = request.getParameter("accountNumber"); // typo retained to match form
           BmAccount account = null;

           try {
               Integer accountNumber = Integer.parseInt(param);
               account = afl.find(accountNumber);
           } catch (NumberFormatException e) {
               request.setAttribute("error", "Invalid account number format.");
           }

           if (account != null) {
               request.setAttribute("account", account);
               request.getRequestDispatcher("update_account_page.jsp").forward(request, response);
           } else {
               request.setAttribute("error", "Account not found.");
               request.getRequestDispatcher("update_account.jsp").forward(request, response);
           }
       }
}
