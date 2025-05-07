/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

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
import java.io.OutputStreamWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import za.ac.tut.ejb.bl.BmAccountFacadeLocal;
import za.ac.tut.ejb.bl.BmComplaintFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmLoanFacadeLocal;
import za.ac.tut.ejb.bl.BmTransactionFacadeLocal;
import za.ac.tut.entities.BmComplaint;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmTransaction;
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
        
        
        Integer customerId = Integer.parseInt(request.getParameter("customerId"));

        BmCustomer customer = findCustomerId(customerId);
        if(!validateCustomer(customerId)){
            request.setAttribute("errMsg","Invalid Customer ID");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request,response);
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
            if ("text".equals(export)) {
                        exportToText(response, startDate, endDate, afl.count(), tfl.getTotalDeposits(startDate, endDate), 
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
        customer.getBCustomerid();
        return customer;
    }
    private void exportToText(HttpServletResponse response, LocalDate startDate, LocalDate endDate, 
                             int totalAccounts, double totalDeposits, double totalWithdrawals, 
                             int totalLoansApproved, double outstandingLoans, 
                             int totalComplaints, int unresolvedComplaints, 
                             int totalTransactions) throws IOException {
       // Set the content type and attachment header for text file download
       response.setContentType("text/plain");
       response.setHeader("Content-Disposition", "attachment; filename=SummaryReport.txt");
       try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(response.getOutputStream()))) {
           writer.write("Summary Report\n");
           writer.write("Report Period: " + startDate.format(fmt) + " to " + endDate.format(fmt) + "\n");
           writer.write("Generated on: " + java.time.LocalDateTime.now() + "\n");
           writer.write("=====================================\n");
           writer.write("Total Active Accounts: " + totalAccounts + "\n");
           writer.write("Total Deposits: " + totalDeposits + "\n");
           writer.write("Total Withdrawals: " + totalWithdrawals + "\n");
           writer.write("Total Loans Approved: " + totalLoansApproved + "\n");
           writer.write("Total Outstanding Loans: " + outstandingLoans + "\n");
           writer.write("Total Customer Complaints: " + totalComplaints + "\n");
           writer.write("Unresolved Complaints: " + unresolvedComplaints + "\n");
           writer.write("Total Transactions: " + totalTransactions + "\n");
           writer.write("-------------------------------------\n");
       } catch (IOException e) {
           e.printStackTrace();
           throw new IOException("Error exporting summary report", e);
       }
   }
}
