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
import za.ac.tut.entities.BmLoan;

/**
 *
 * @author thand
 */
public class CountLoansServlet extends HttpServlet {
    @EJB
    private BmLoanFacadeLocal lfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filter = request.getParameter("count_filter");
        Integer cnt = lfl.cntLoans(filter);
        
        request.setAttribute("cnt", cnt);
        request.setAttribute("filter", filter);
        
        RequestDispatcher disp = request.getRequestDispatcher("count_loans_outcome.jsp");
        disp.forward(request, response);
    }

}
