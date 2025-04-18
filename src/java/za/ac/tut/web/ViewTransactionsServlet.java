/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmTransactionFacadeLocal;
import za.ac.tut.entities.BmTransaction;

/**
 *
 * @author thand
 */
public class ViewTransactionsServlet extends HttpServlet {
    @EJB
    private BmTransactionFacadeLocal tfl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filter = request.getParameter("filter");
        String filterValue = request.getParameter("filter_val");
        
        List<BmTransaction> filteredBmTransactions = getTransactions(filter, filterValue);
        
        request.setAttribute("transactions", filteredBmTransactions);
        RequestDispatcher disp = request.getRequestDispatcher("view_transactions_outcome.jsp");
        
        disp.forward(request, response);
    }
    private List<BmTransaction> getTransactions(String filter, String filterValue) {
        List<BmTransaction> filteredTransactions = new ArrayList<>();
        List<BmTransaction> transactions = tfl.findAll();
        
        if(filter.equals("Max amount")) {
            BigDecimal maxAmount = BigDecimal.valueOf(Double.parseDouble(filterValue));
            for(BmTransaction t : transactions) {
                if(t.getBAmount().compareTo(maxAmount) <= 0) {
                    filteredTransactions.add(t);
                }
            }
        }
        
        return filteredTransactions;
    }
}
