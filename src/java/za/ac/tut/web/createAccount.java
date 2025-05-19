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
import javax.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.BmAccountFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.entities.BmAccount;
import za.ac.tut.entities.BmBankManager;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author Evan
 */
public class createAccount extends HttpServlet {
    @EJB
    private BmAccountFacadeLocal afl;
    @EJB
    private BmCustomerFacadeLocal cfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session  = request.getSession();
        BmBankManager manager = (BmBankManager)session.getAttribute("manager");
        try {
            Integer customerId = Integer.parseInt(request.getParameter("customerId"));
            String accountType = request.getParameter("accountType");
            String accountStatus = request.getParameter("accountStatus");

            if(accountStatus == null || accountStatus.isEmpty()){
                accountStatus = "Pending"; // default for customer creation
            }

            BmCustomer customer = cfl.find(customerId);

            if(customer == null){
                request.setAttribute("errMsg","Customer does not exist");
                RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
                disp.forward(request, response);
                return;
            }

            // Optionally validate accountType and accountStatus here...
            BmAccount account = new BmAccount();
            account.setBAccounttype(accountType);
            account.setBBalance(BigDecimal.ZERO); // Start with 0 balance
            account.setBStatus(accountStatus);
            account.setBCustomerid(customer);

            afl.create(account);
            session.setAttribute("manager", manager);
            request.setAttribute("accountType", accountType);
            RequestDispatcher disp = request.getRequestDispatcher("account_created_page.jsp");
            disp.forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("errMsg","Invalid Customer Number");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
    }
}
  