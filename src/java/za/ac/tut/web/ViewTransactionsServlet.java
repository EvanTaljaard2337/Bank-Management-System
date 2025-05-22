package za.ac.tut.web;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.BmTransactionFacadeLocal;
import za.ac.tut.entities.BmTransaction;

public class ViewTransactionsServlet extends HttpServlet {
    private static final DateTimeFormatter fmt = DateTimeFormatter.ISO_LOCAL_DATE;
    @EJB
    private BmTransactionFacadeLocal tfl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
        String filter = request.getParameter("filter");
        String filterValue = request.getParameter("filter_val");
        String export = request.getParameter("export");
        
        session.setAttribute("filter", filter);
        session.setAttribute("filter_val", filterValue);
        // Check if filter is null or empty
        if (filter == null || filter.trim().isEmpty()) {
            request.setAttribute("errMsg", "Filter is required.");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
            return;
        }
        // Handle the case where "View all" is selected
        if ("View all".equals(filter)) {
            // Call a method to get all transactions
            List<BmTransaction> allTransactions = tfl.findAll();
            request.setAttribute("transactions", allTransactions);
            RequestDispatcher disp = request.getRequestDispatcher("view_transactions_outcome.jsp");
            disp.forward(request, response);
            return;
        }
        List<BmTransaction> filteredBmTransactions = getTransactions(filter, filterValue);
        try{
            // Check if the export parameter is set to "text"
            if ("pdf".equals(export)) {
                try{
                    exportToPdf(response,filteredBmTransactions);
                    return; // Exit after exporting to avoid forwarding
                }
                catch(Exception e){
                    e.printStackTrace();
                    request.setAttribute("errMsg",e.getMessage());
                    RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
                    disp.forward(request, response);
                }
            }
            else if ("pdf".equals(export)) {
                exportToPdf(response, filteredBmTransactions);
                return;
            }

            session.setAttribute("transactions", filteredBmTransactions);
            request.setAttribute("transactions", filteredBmTransactions);
            RequestDispatcher disp = request.getRequestDispatcher("view_transactions_outcome.jsp");
            disp.forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
    }
    private List<BmTransaction> getTransactions(String filter, String filterValue) {
        List<BmTransaction> filteredTransactions = new ArrayList<>();
        List<BmTransaction> transactions = tfl.findAll();

        if ("ID".equals(filter)) {
            try {
                int id = Integer.parseInt(filterValue); // Parse the ID
                for (BmTransaction t : transactions) {
                    if (t.getBTransactionid() == id) { // Assuming getBTransactionid() returns an int
                        filteredTransactions.add(t);
                    }
                }
            } catch (NumberFormatException e) {
                // Handle invalid ID format
                System.out.println("Invalid ID format: " + filterValue);
            }
        } else if ("Max amount".equals(filter)) {
            try {
                BigDecimal maxAmount = BigDecimal.valueOf(Double.parseDouble(filterValue));
                for (BmTransaction t : transactions) {
                    if (t.getBAmount().compareTo(maxAmount) <= 0) {
                        filteredTransactions.add(t);
                    }
                }
            } catch (NumberFormatException e) {
                // Handle invalid amount format
                System.out.println("Invalid amount format: " + filterValue);
            }
        } else if ("View all".equals(filter)) {
            // Return all transactions
            return transactions;
        }

        return filteredTransactions;
    }/*
    private void exportToText(List<BmTransaction> activities, HttpServletResponse response) throws IOException {
        if (activities == null || activities.isEmpty()) {
            response.getWriter().write("No transactions found for export.");
            return; // Return early if there are no activities
        }
        // Set the content type and attachment header for text file download
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename=Full_Transaction_report.txt");
        try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(response.getOutputStream()))) {
            // Write a title and timestamp to the file
            writer.write("Transaction Report\n");
            writer.write("Generated on: " + new java.util.Date() + "\n");
            writer.write("=====================================\n");
            // Iterate over the list of activities and write them to the file
            for (BmTransaction transaction : activities) {
                writer.write("Transaction ID: " + transaction.getBTransactionid() + "\n");
                if (transaction.getBAccountid() != null) {
                    writer.write("Account ID: " + transaction.getBAccountid().getBAccountid() + "\n");
                } else {
                    writer.write("Account ID: Not available\n");
                }
                writer.write("Transaction ID: " + transaction.getBTransactionid() + "\n");
                writer.write("Account ID: " + transaction.getBAccountid() + "\n");
                writer.write("Transaction Type: " + transaction.getBTransactiontype() + "\n");
                writer.write("Ammount: " + transaction.getBAmount() + "\n");
                writer.write("Date: " + transaction.getBTransactiondate() + "\n");
                writer.write("-------------------------------------\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
            throw new IOException("Error exporting transaction data", e);
        }
    }*/
    private void exportToPdf(HttpServletResponse response, List<BmTransaction> transactions) throws IOException {
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
                document.add(new Paragraph("Transaction Type: " + transaction.getBTransactiontype()));
                document.add(new Paragraph("Amount: " + transaction.getBAmount()));
                document.add(new Paragraph("Date: " + transaction.getBTransactiondate()));
                document.add(new Paragraph("-------------------------------------\n"));
            }

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new IOException("Error generating PDF", e);
        }
    }

}
