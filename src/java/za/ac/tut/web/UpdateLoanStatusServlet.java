/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmLoanFacadeLocal;
import za.ac.tut.ejb.bl.LoanProcedures;
import za.ac.tut.entities.BmLoan;

/**
 *
 * @author thand
 */
public class UpdateLoanStatusServlet extends HttpServlet {
    @EJB
    private BmLoanFacadeLocal lfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String status = request.getParameter("status");
        Integer loanID = Integer.parseInt(request.getParameter("id"));
        String updateResult;
        
        try {
            boolean success = lfl.updateLoanStatus(loanID, status);
            if (success) {
                updateResult = "Loan status updated successfully!";
            } else {
                updateResult = "Failed to update loan status. Loan not found.";
            }
        } catch (Exception e) {
            updateResult = "Error updating loan status: " + e.getMessage();
        }
        
        BmLoan loan = lfl.find(loanID);
        request.setAttribute("updateResult", updateResult);
        request.setAttribute("loan", loan);
        
        RequestDispatcher disp = request.getRequestDispatcher("update_loan_status_outcome.jsp");
        disp.forward(request, response);
        
        /*BmLoan loan = updateLoan(status, loanID);
        
        request.setAttribute("loan", loan);
        RequestDispatcher disp = request.getRequestDispatcher("update_loan_status_outcome.jsp");
        disp.forward(request, response);*/
    }
    /*private BmLoan updateLoan(String status, Integer loanID) {
        List<BmLoan> loans = lfl.findAll();
        BmLoan loan = new BmLoan();
        
        for (BmLoan l : loans) {
            if (l.getBLoanid().compareTo(loanID) == 0) {
                if (status.equalsIgnoreCase("approved")) {
                    l.setBStatus("Approved");
            } else if (status.equalsIgnoreCase("rejected")) {
                l.setBStatus("Rejected");
            }

            lfl.edit(l); 
            loan = l;
            break;
        }
    }        
        return loan;
    }
    */
}
