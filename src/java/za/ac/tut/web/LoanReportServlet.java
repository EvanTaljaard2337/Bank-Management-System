/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmLoanFacadeLocal;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmLoan;

/**
 *
 * @author Evan
 */
public class LoanReportServlet extends HttpServlet {
    @EJB
    private BmLoanFacadeLocal bfl;
    @EJB
    private BmCustomerFacadeLocal cfl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Read filter parameters from request
        String loanIdParam = request.getParameter("loanId");
        String customerName = request.getParameter("customerName");
        String minAmountParam = request.getParameter("minAmount");
        String maxAmountParam = request.getParameter("maxAmount");
        String minInterestParam = request.getParameter("minInterestRate");
        String maxInterestParam = request.getParameter("maxInterestRate");
        String loanStatus = request.getParameter("loanStatus");
        String loanType = request.getParameter("loanType");

        // Convert numeric parameters
        BigDecimal minAmount = new BigDecimal(minAmountParam);
        BigDecimal maxAmount =  new BigDecimal(maxAmountParam);
        BigDecimal minInterest =  new BigDecimal(minInterestParam);
        BigDecimal maxInterest =  new BigDecimal(maxInterestParam);
        
        // Handle loanId
        Integer loanId = parseInteger(loanIdParam);
        
        // Fetch filtered loans
        List<BmLoan> loans = getLoansByFilter(loanId, customerName, minAmount, maxAmount, minInterest, maxInterest, loanStatus, loanType);
        
        // Set attributes for JSP
        request.setAttribute("loans", loans);

        // Forward to JSP
        request.getRequestDispatcher("generate_loan_report_outcome.jsp").forward(request, response);
    }
    private List<BmLoan> getLoansByFilter(Integer loanId, String customerName, 
                                           BigDecimal minAmount, BigDecimal maxAmount, 
                                           BigDecimal minInterest, BigDecimal maxInterest, 
                                           String loanStatus, String loanType) {
        List<BmLoan> allLoans = bfl.findAll(); // Fetch all loans
        List<BmLoan> filteredLoans = new ArrayList<>();

        for (BmLoan loan : allLoans) {
            boolean matches = true;

            // Apply filters
            if (loanId != null && !loan.getBLoanid().equals(loanId)) {
                matches = false;
            }
            if (customerName != null && !customerName.isEmpty() && 
                !findNameById(loan).getBFullname().toLowerCase().contains(customerName.toLowerCase())) {
                matches = false;
            }
            if (minAmount != null && loan.getBLoanamount().compareTo(minAmount) < 0) {
                matches = false;
            }
            if (maxAmount != null && loan.getBLoanamount().compareTo(maxAmount) > 0) {
                matches = false;
            }
            if (minInterest != null && loan.getBInterestrate().compareTo(minInterest) < 0) {
                matches = false;
            }
            if (maxInterest != null && loan.getBInterestrate().compareTo(maxInterest) > 0) {
                matches = false;
            }
            if (loanStatus != null && !loanStatus.isEmpty() && 
                (!loan.getBStatus().equalsIgnoreCase(loanStatus) || !loan.getBStatus().equalsIgnoreCase("All") )) {
                matches = false;
            }
            if (loanType != null && !loanType.isEmpty() && 
                (!loan.getbLoanType().equalsIgnoreCase(loanType) || !loan.getbLoanType().equalsIgnoreCase("All"))) {
                matches = false;
            }
            if (matches) {
                filteredLoans.add(loan);
            }
        }
        return filteredLoans;
    }
    
    private BmCustomer findNameById(BmLoan loan) {
        return loan.getBCustomerid();
    }
    private BigDecimal parseBigDecimal(String value) {
        if (value != null && !value.isEmpty()) {
            try {
                return new BigDecimal(value);
            } catch (NumberFormatException e) {
                return null; // Return null if parsing fails
            }
        }
        return null; // Return null if the value is empty
    }
    private Integer parseInteger(String value) {
        if (value != null && !value.isEmpty()) {
            try {
                return Integer.parseInt(value);
            } catch (NumberFormatException e) {
                return null; // Return null if parsing fails
            }
        }
        return null; // Return null if the value is empty
    }
}