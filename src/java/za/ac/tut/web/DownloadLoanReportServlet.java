/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmLoanFacadeLocal;

/**
 *
 * @author thand
 */
public class DownloadLoanReportServlet extends HttpServlet {
    @EJB
    private BmLoanFacadeLocal lfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer cntAppLoans = lfl.cntLoans("Approved");
        Integer cntRejectedLoans = lfl.cntLoans("Rejected");
        Integer cntPendingLoans = lfl.cntLoans("Pending");

        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename=LoanReport.txt");

        try (PrintWriter writer = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"))) {
            writer.println("Loan Report Summary");
            writer.println("=====================");
            writer.println("Approved Loans: " + cntAppLoans);
            writer.println("Rejected Loans: " + cntRejectedLoans);
            writer.println("Pending Loans: " + cntPendingLoans);
        }
    }


}
