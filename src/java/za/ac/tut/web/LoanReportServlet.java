/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
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
import za.ac.tut.entities.BmTransaction;

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
        String export = request.getParameter("export");
        customerName = (customerName != null && !customerName.trim().isEmpty()) ? customerName.trim() : null;
        loanStatus = (loanStatus != null) ? loanStatus.trim() : null;
        loanType = (loanType != null) ? loanType.trim() : null;
    
        // Convert numeric parameters
        BigDecimal minAmount = parseBigDecimal(minAmountParam);
        BigDecimal maxAmount = parseBigDecimal(maxAmountParam);
        BigDecimal minInterest = parseBigDecimal(minInterestParam);
        BigDecimal maxInterest = parseBigDecimal(maxInterestParam);
        
        // Handle loanId
        Integer loanId = parseInteger(loanIdParam);
        try{
            // Fetch filtered loans
            List<BmLoan> loans = getLoansByFilter(loanId, customerName, minAmount, maxAmount, minInterest, maxInterest, loanStatus, loanType);

            if ("pdf".equals(export)) {
                exportToPdf(loans, response);
                return; // Stop further processing after export
            }
            // Set attributes for JSP
            request.setAttribute("loans", loans);
            // Forward to JSP
            request.getRequestDispatcher("generate_loan_report_outcome.jsp").forward(request, response); 
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
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
            if (loanStatus != null && !loanStatus.equalsIgnoreCase("All") &&
                !loan.getBStatus().equalsIgnoreCase(loanStatus)) {
                matches = false;
            }
            if (loanType != null && !loanType.equalsIgnoreCase("All") &&
                !loan.getbLoanType().equalsIgnoreCase(loanType)) {
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
    private void exportToPdf(List<BmLoan> loans, HttpServletResponse response) throws IOException {
        if (loans == null || loans.isEmpty()) {
            response.getWriter().write("No loans found for export.");
            return;
        }

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=Loan_Report.pdf");

        try (OutputStream out = response.getOutputStream()) {
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            document.add(new Paragraph("Loan Report").setBold().setFontSize(18));
            document.add(new Paragraph("Generated on: " + java.time.LocalDateTime.now()));
            document.add(new Paragraph("=====================================\n"));

            for (BmLoan loan : loans) {
                document.add(new Paragraph("Loan ID: " + (loan.getBLoanid() != null ? loan.getBLoanid() : "Not available")));
                document.add(new Paragraph("Customer ID: " + (loan.getBCustomerid() != null ? loan.getBCustomerid() : "Not available")));
                document.add(new Paragraph("Loan Amount: " + loan.getBLoanamount()));
                document.add(new Paragraph("Interest Rate: " + loan.getBInterestrate()));
                document.add(new Paragraph("Status: " + loan.getBStatus()));
                document.add(new Paragraph("Loan Type: " + loan.getbLoanType()));
                document.add(new Paragraph("-------------------------------------\n"));
            }

            document.close();
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
            throw new IOException("Error generating PDF", e);
        }
    }

}