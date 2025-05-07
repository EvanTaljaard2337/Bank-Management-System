/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmAccountFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmTransactionFacadeLocal;
import za.ac.tut.entities.BmAccount;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmTransaction;

/**
 *
 * @author Evan
 */
public class GenerateTransactionReportServlet extends HttpServlet {
    @EJB
    private BmCustomerFacadeLocal cfl;
    @EJB
    private BmTransactionFacadeLocal tfl;
    @EJB
    private BmAccountFacadeLocal afl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        String transactionType = request.getParameter("transactionType");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String export = request.getParameter("export");
        if (accountNumber == null || startDate == null || endDate == null || transactionType == null) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("generate_transaction_report.jsp").forward(request, response);
            return;
        }
        try{
            // Query your service/database to get the report data
            List<BmTransaction> transactions = filteredTransaction(accountNumber,transactionType,startDate,endDate);
            
            if("text".equals(export)){
                exportToText(transactions,response);
            }
            // Set results in request and forward to JSP for display
            request.setAttribute("transactions", transactions);
            request.getRequestDispatcher("generate_transaction_report_outcome.jsp").forward(request, response);
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("transactions", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    private List<BmTransaction> filteredTransaction(String accountNumber, String transactionType, String startDate, String endDate) throws ParseException {
        List<BmTransaction> allTransactions = tfl.findAll();
        List<BmTransaction> filtered = new ArrayList<>();

        BmAccount account = afl.find(Integer.parseInt(accountNumber));
        if (account == null) {
            return filtered; // or throw an exception
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date start = sdf.parse(startDate);
        Date end = sdf.parse(endDate);

        for (BmTransaction t : allTransactions) {
            if (t.getBAccountid() != null &&
                t.getBTransactiontype() != null &&
                t.getBTransactiondate() != null &&
                t.getBAccountid().equals(account) &&
                t.getBTransactiontype().equalsIgnoreCase(transactionType)) {

                Date txDate = t.getBTransactiondate();
                if (!txDate.before(start) && !txDate.after(end)) {
                    filtered.add(t);
                }
            }
        }
        return filtered;
    }
    private void exportToText(List<BmTransaction> activities, HttpServletResponse response) throws IOException {
        if (activities == null || activities.isEmpty()) {
            return;
        }

        // Set the content type and attachment header for text file download
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename=TransactionReport.txt");

        // Use try-with-resources to handle the BufferedWriter and close it automatically
        try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(response.getOutputStream()))) {

            // Write a title and timestamp to the file
            writer.write("Transaction Report\n");
            writer.write("Generated on: " + new java.util.Date() + "\n");
            writer.write("=====================================\n");

            // Iterate over the list of activities and write them to the file
            for (BmTransaction transaction : activities) {
                writer.write("Transaction ID: " + transaction.getBTransactionid() + "\n");
                writer.write("Account ID: " + transaction.getBAccountid() + "\n");
                writer.write("Account Type: " + transaction.getBTransactiontype() + "\n");
                writer.write("Ammount: " + transaction.getBAmount() + "\n");
                writer.write("Date: " + transaction.getBTransactiondate()+ "\n");
                writer.write("Description: " + " No Description " + "\n");
                writer.write("-------------------------------------\n");
            }
        } catch (IOException e) {
            // Log the exception and handle it appropriately
            e.printStackTrace();
            throw new IOException("Error exporting loan data", e);
        }
    }
}
