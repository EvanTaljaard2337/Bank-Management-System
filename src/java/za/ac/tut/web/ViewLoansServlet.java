/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmLoanFacadeLocal;
import za.ac.tut.entities.BmComplaint;
import za.ac.tut.entities.BmLoan;

/**
 *
 * @author thand
 */
public class ViewLoansServlet extends HttpServlet {
    @EJB
    private BmLoanFacadeLocal lfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filterVal = request.getParameter("filter");
        List<BmLoan> filteredLoans = getloans(filterVal);
        
        request.setAttribute("filteredLoans", filteredLoans);
        
        RequestDispatcher disp = request.getRequestDispatcher("view_loans_outcome.jsp");
        disp.forward(request, response);
    }
    private List<BmLoan> getloans(String filterValue) {
        List<BmLoan> loans = lfl.findAll();
        List<BmLoan> filteredLoans = new ArrayList<>();
        
        for (BmLoan l : loans) {
            if (l.getBStatus() != null && l.getBStatus().equalsIgnoreCase(filterValue)) {
                filteredLoans.add(l);
            }
        }
        
        return filteredLoans;
    }
}
