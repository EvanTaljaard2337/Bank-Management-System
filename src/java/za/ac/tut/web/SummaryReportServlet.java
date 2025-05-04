/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

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
}
