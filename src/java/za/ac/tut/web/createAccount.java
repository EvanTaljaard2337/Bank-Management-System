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
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.entities.BmAccount;
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
        //Retrieved customer Id from servlet
        Integer customerId = Integer.parseInt(request.getParameter("customerId"));
        
        //Parameters for the customers new Account
        BigDecimal accountAmmount = new BigDecimal(0.0);//When creating account value should be 0
        String accountType = request.getParameter("accountType");//Type of account selected
        BmCustomer customer = cfl.find(customerId);
        
        if(customer == null){
            request.setAttribute("errMsg","Customer does not exist");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
        try{
            BmAccount account = new BmAccount();
            account.setBAccounttype(accountType);
            account.setBBalance(accountAmmount);
            account.setBStatus("Active");
            account.setBCustomerid(customer);
            afl.create(account);
            
            request.setAttribute("accountType", accountType);
            RequestDispatcher disp = request.getRequestDispatcher("account_created_page.jsp");
            disp.forward(request, response);
        }   
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg",e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
    }
}
