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
            
        if ("pdf".equals(export)) {
            exportToPdf(transactions, response);
            return; // Stop further processing after export
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
    }/*
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
    }*/
    private void exportToPdf(List<BmTransaction> transactions, HttpServletResponse response) throws IOException {
        if (transactions == null || transactions.isEmpty()) {
            response.getWriter().write("No transactions found for export.");
            return;
        }

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=Transaction_Report.pdf");

        try (OutputStream out = response.getOutputStream()) {
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            document.add(new Paragraph("Transaction Report").setBold().setFontSize(18));
            document.add(new Paragraph("Generated on: " + java.time.LocalDateTime.now()));
            document.add(new Paragraph("=====================================\n"));

            for (BmTransaction transaction : transactions) {
                document.add(new Paragraph("Transaction ID: " + transaction.getBTransactionid()));
                if (transaction.getBAccountid() != null) {
                    document.add(new Paragraph("Account ID: " + transaction.getBAccountid().getBAccountid()));
                } else {
                    document.add(new Paragraph("Account ID: Not available"));
                }
                document.add(new Paragraph("Account Type: " + transaction.getBTransactiontype()));
                document.add(new Paragraph("Amount: " + transaction.getBAmount()));
                document.add(new Paragraph("Date: " + transaction.getBTransactiondate()));
                document.add(new Paragraph("Description: No Description"));
                document.add(new Paragraph("-------------------------------------\n"));
            }

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new IOException("Error generating PDF", e);
        }
    }

}
