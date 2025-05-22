/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.element.Paragraph;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.swing.event.DocumentListener;
import javax.swing.event.UndoableEditListener;
import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;

import javax.swing.text.Element;
import javax.swing.text.Position;
import javax.swing.text.Segment;
import za.ac.tut.ejb.bl.BmAccountFacadeLocal;
import za.ac.tut.ejb.bl.BmComplaintFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmLoanFacadeLocal;
import za.ac.tut.ejb.bl.BmTransactionFacadeLocal;
import za.ac.tut.entities.BmComplaint;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmTransaction;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

/**
 *
 * @author Evan
 */
public class SummaryReportServlet extends HttpServlet {
    private static final DateTimeFormatter fmt = DateTimeFormatter.ISO_LOCAL_DATE;
    @EJB
    private BmAccountFacadeLocal afl;
    @EJB
    private BmTransactionFacadeLocal tfl;
    @EJB
    private BmLoanFacadeLocal lfl;
    @EJB
    private BmComplaintFacadeLocal cfl;
    @EJB
    private BmCustomerFacadeLocal dfl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        LocalDate today = LocalDate.now();
        LocalDate firstDayOfMonth = today.withDayOfMonth(1);
        // Read date parameters with defaults
        String startDateParam = request.getParameter("startDate");
        String endDateParam = request.getParameter("endDate");
        String unresolvedComplaintString = "Pending";
        String loanStatus = request.getParameter("loanStatus");
        String custId = request.getParameter("customerId");
        
        Integer customerId = 0;
        if(custId!=null && !custId.trim().isEmpty()){
            customerId = Integer.parseInt(custId);
        }
        else{
            request.setAttribute("errMsg","Customer ID Does not exist");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request,response);
            return;
        }
        BmCustomer customer = findCustomerId(customerId);
        if(customer==null){
            request.setAttribute("errMsg","Customer ID Does not exist");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request,response);
            return;
        }
        if(!validateCustomer(customerId)){
            request.setAttribute("errMsg","Invalid Customer ID");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request,response);
            return;
        }
        
        double outstandingLoans = lfl.getOutstandingLoans(customer, loanStatus);
                
        try{
            LocalDate startDate = (startDateParam != null && !startDateParam.isEmpty())
                    ? LocalDate.parse(startDateParam, fmt)
                    : firstDayOfMonth;
            LocalDate endDate = (endDateParam != null && !endDateParam.isEmpty())
                    ? LocalDate.parse(endDateParam, fmt)
                    : today;
            request.setAttribute("customerId",customerId);
            request.setAttribute("startDate",startDate.format(fmt));
            request.setAttribute("endDate",endDate.format(fmt));
            request.setAttribute("totalAccounts",afl.count());
            request.setAttribute("totalDeposits",tfl.getTotalDeposits(startDate, endDate));
            request.setAttribute("totalWithdrawals",tfl.getTotalWithdrawals(startDate,endDate));
            request.setAttribute("totalLoansApproved",lfl.cntLoans(loanStatus));
            request.setAttribute("outstandingLoans",outstandingLoans);
            request.setAttribute("complaints",cfl.findAll().size());
            request.setAttribute("unresolvedComplaints",getComplaints(unresolvedComplaintString));
            request.setAttribute("totalTransactions",tfl.getTotalTransactions(startDate, endDate));
            
            String export = request.getParameter("export");
            if ("pdf".equals(export)) {
                        exportToPdf(response, startDate, endDate, afl.count(), tfl.getTotalDeposits(startDate, endDate), 
                          tfl.getTotalWithdrawals(startDate,endDate), lfl.cntLoans(loanStatus), outstandingLoans, 
                          cfl.findAll().size(), getComplaints(unresolvedComplaintString), tfl.getTotalTransactions(startDate, endDate));
                
                return; // Exit early so it doesn't continue
            }
            
            RequestDispatcher disp = request.getRequestDispatcher("generate_summary_report.jsp");
            disp.forward(request,response);
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg",e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request,response);
        }
    }
    private Integer getComplaints(String unresolvedComplaintString) {
        List<BmComplaint> complaints = cfl.findAll();
        int unresolvedCompalints = 0;
        for (BmComplaint c : complaints) {
            if (c.getBStatus() != null && c.getBStatus().equalsIgnoreCase(unresolvedComplaintString)) {
                unresolvedCompalints++;
            }
        }
        return unresolvedCompalints;
    }
    private boolean validateCustomer(Integer customerId){
        boolean isCustValid = false;
        BmCustomer customer = dfl.find(customerId);
        if(customer!=null){
            isCustValid=true;
        }
        return isCustValid;
    }
    private BmCustomer findCustomerId(Integer id){
        BmCustomer customer = dfl.find(id);
        if(customer!=null){
            customer.getBCustomerid();
        }
        return customer;
    }
     public void exportToPdf(HttpServletResponse response, LocalDate startDate, LocalDate endDate,
                            int totalAccounts, double totalDeposits, double totalWithdrawals,
                            int totalLoansApproved, double outstandingLoans,
                            int totalComplaints, int unresolvedComplaints,
                            int totalTransactions) throws IOException {

        // Set the content type and headers
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=SummaryReport.pdf");

        try {
            OutputStream out = response.getOutputStream();

            // Initialize PDF writer and document
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);
      

            // Add content
            document.add(new Paragraph("Summary Report").setBold().setFontSize(18));
            document.add(new Paragraph("Report Period: " + startDate.format(fmt) + " to " + endDate.format(fmt)));
            document.add(new Paragraph("Generated on: " + java.time.LocalDateTime.now()));
            document.add(new Paragraph("====================================="));

            document.add(new Paragraph("Total Active Accounts: " + totalAccounts));
            document.add(new Paragraph("Total Deposits: " + totalDeposits));
            document.add(new Paragraph("Total Withdrawals: " + totalWithdrawals));
            document.add(new Paragraph("Total Loans Approved: " + totalLoansApproved));
            document.add(new Paragraph("Total Outstanding Loans: " + outstandingLoans));
            document.add(new Paragraph("Total Customer Complaints: " + totalComplaints));
            document.add(new Paragraph("Unresolved Complaints: " + unresolvedComplaints));
            document.add(new Paragraph("Total Transactions: " + totalTransactions));

            document.add(new Paragraph("-------------------------------------"));

            // Close the document
            document.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new IOException("Error generating PDF", e);
        }
    }
}
