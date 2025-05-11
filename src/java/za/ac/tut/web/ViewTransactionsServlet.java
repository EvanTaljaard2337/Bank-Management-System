package za.ac.tut.web;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
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
                // Check if filterValue is null or empty for other filters
        if (filteredBmTransactions == null || filteredBmTransactions.isEmpty()) {
            request.setAttribute("errMsg", "No transactions found for export.");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
            return;
        }
        try{
            // Check if the export parameter is set to "text"
            if ("text".equals(export)) {
                try{
                    exportToText(filteredBmTransactions, response);
                    return; // Exit after exporting to avoid forwarding
                }
                catch(Exception e){
                    e.printStackTrace();
                    request.setAttribute("errMsg",e.getMessage());
                    RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
                    disp.forward(request, response);
                }
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
    }
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
    }
}
