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
import za.ac.tut.ejb.bl.BmTransactionFacadeLocal;
import za.ac.tut.entities.BmAccount;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmTransaction;

/**
 *
 * @author Evan
 */
public class ViewTransactionsHistoryServlet extends HttpServlet {
    @EJB
    private BmCustomerFacadeLocal bfl;
    @EJB
    private BmTransactionFacadeLocal tfl;
    @EJB
    private BmAccountFacadeLocal afl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            HttpSession session = request.getSession();
            Integer id = Integer.parseInt(request.getParameter("customerId"));
            BmCustomer customer = findCustomerId(id);
            BmAccount acc = afl.find(id);
            List<BmTransaction> transaction = tfl.findTransactionHistory(acc);
            
            session.setAttribute("transactionDetails",transaction);
            
            RequestDispatcher dips = request.getRequestDispatcher("viewTransactionHistory.jsp");
            dips.forward(request,response);
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            RequestDispatcher dips = request.getRequestDispatcher("error.jsp");
            dips.forward(request,response);
        }
    }
    private BmCustomer findCustomerId(Integer id){
        BmCustomer customer = bfl.find(id);
        customer.getBCustomerid();
        return customer;
    }
}



/*
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer id = Integer.parseInt(request.getParameter("accountId"));
        
        BmAccount account = getBalance(id);
        session.setAttribute("acountDetails",account);
        
        RequestDispatcher disp = request.getRequestDispatcher("account_balance.jsp");
        disp.forward(request, response);
    }
    private BmAccount getBalance(Integer id){
        BmAccount b = bma.find(id);
        b.getBBalance();
        return b;
    }

*/