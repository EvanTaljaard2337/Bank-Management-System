/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.Document;
import za.ac.tut.ejb.bl.BmLoanFacadeLocal;

/**
 *
 * @author thand
 */
public class LoanOfficerReportServlet extends HttpServlet {

    @EJB
    private BmLoanFacadeLocal lfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                Integer cntAppLoans = lfl.cntLoans("Approved");
        Integer cntRejectedLoans = lfl.cntLoans("Rejected");
        Integer cntPendingLoans = lfl.cntLoans("Pending");
        
        request.setAttribute("approved", cntAppLoans);
        request.setAttribute("rejected", cntRejectedLoans);
        request.setAttribute("pending", cntPendingLoans);
        
        RequestDispatcher disp = request.getRequestDispatcher("loan_report.jsp");
        disp.forward(request, response);
    }

}
