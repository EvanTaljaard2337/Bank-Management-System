/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmLoanFacadeLocal;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmLoan;

/**
 *
 * @author Evan
 */
public class ApplyForLoanServlet extends HttpServlet {
    @EJB
    private BmLoanFacadeLocal lfl;
    @EJB
    private BmCustomerFacadeLocal cfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bStatus = "Pending";
        String fullName = request.getParameter("fullName");
        BigDecimal ammount = new BigDecimal(request.getParameter("loanAmount"));
        BigDecimal interestRate = new BigDecimal(0.5); // Ensure this is acceptable
        String loanType = request.getParameter("loanType"); // Get loan type from request
        BmCustomer customer = findId(fullName);

        if (customer == null) {
            request.setAttribute("errMsg", "Customer does not exist");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
            return; // Exit the method
        }

        // Validate loan amount
        if (ammount == null || ammount.compareTo(BigDecimal.ZERO) <= 0) {
            request.setAttribute("errMsg", "Loan amount must be greater than zero.");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
            return; // Exit the method
        }

        // Validate loan type
        if (loanType == null || loanType.isEmpty()) {
            request.setAttribute("errMsg", "Loan type must not be empty.");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
            return; // Exit the method
        }

        try {
            BmLoan loan = new BmLoan();
            loan.setBInterestrate(interestRate);
            loan.setBLoanamount(ammount);
            loan.setBStatus(bStatus);
            loan.setBCustomerid(customer);
            loan.setbLoanType(loanType); // Set loan type

            lfl.create(loan);

            RequestDispatcher disp = request.getRequestDispatcher("applied_loan_outcome.jsp");
            disp.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            request.setAttribute("errMsg", "An error occurred: " + e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
    }
    private BmCustomer findId(String fullName){
        BmCustomer customer = cfl.findFullName(fullName);
        customer.getBCustomerid();
        return customer;  
    }
}

//Integer bLoanid, BigDecimal bLoanamount, BigDecimal bInterestrate, String bStatus