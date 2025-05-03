/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author Evan
 */
public class checkBalanceServlet extends HttpServlet {
    @EJB
    private BmAccountFacadeLocal bma;
    @EJB
    private BmCustomerFacadeLocal cfl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer id = Integer.parseInt(request.getParameter("customerId"));
        
        BmCustomer customer = cfl.find(id);
        List<BmAccount> account = bma.findAccountsByCustId(customer);
        
        session.setAttribute("acountDetails",account);
        RequestDispatcher disp = request.getRequestDispatcher("account_balance.jsp");
        disp.forward(request, response);
    }
}
