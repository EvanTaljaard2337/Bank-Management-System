/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import za.ac.tut.ejb.bl.BmLoanFacadeLocal;
import za.ac.tut.entities.BmLoan;

/**
 *
 * @author thand
 */
public class ViewANumberOfLoansServlet extends HttpServlet {

    @EJB
    private BmLoanFacadeLocal lfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer numOfLoans = Integer.parseInt(request.getParameter("num"));
        List<BmLoan> loans = lfl.findANumberOfLoans(numOfLoans);
        //Need updated code from the ejb module
        request.setAttribute("loans", loans);
        RequestDispatcher disp = request.getRequestDispatcher("find_number_of_loans_outcome.jsp");
        disp.forward(request, response);
    }

}
