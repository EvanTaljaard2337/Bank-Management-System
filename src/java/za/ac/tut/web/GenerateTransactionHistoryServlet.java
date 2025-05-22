/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.BmAccountFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmTransactionFacadeLocal;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmTransaction;

/**
 *
 * @author Michael
 */
public class GenerateTransactionHistoryServlet extends HttpServlet {

    @EJB
    private BmCustomerFacadeLocal cfl;
    @EJB
    private BmTransactionFacadeLocal tfl;
    @EJB
    private BmAccountFacadeLocal afl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        BmCustomer c = (BmCustomer)session.getAttribute("customer");
        int accountID = c.getBCustomerid();
        String export = request.getParameter("export");
        
        
        try{
            // Query your service/database to get the report data
            List<BmTransaction> transactions = (List<BmTransaction>)session.getAttribute("transactionDetails");
            
        if ("pdf".equals(export)) {
            exportToPdf(transactions, accountID, response);
            return; // Stop further processing after export
        }

            // Set results in request and forward to JSP for display
            request.setAttribute("transactions", transactions);
            request.getRequestDispatcher("generate_transaction_history_outcome.jsp").forward(request, response);
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("transactions", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    private void exportToPdf(List<BmTransaction> transactions, int id, HttpServletResponse response) throws IOException {
        
        if (transactions == null || transactions.isEmpty()) {
            response.getWriter().write("No transactions found for export.");
            return;
        }

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=Transaction_History.pdf");

        try (OutputStream out = response.getOutputStream()) {
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            document.add(new Paragraph("Transaction History Report").setBold().setFontSize(18).setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER).setMarginBottom(10));
            document.add(new Paragraph("Generated on: " + java.time.LocalDateTime.now()).setFontSize(10).setItalic().setTextAlignment(com.itextpdf.layout.property.TextAlignment.RIGHT));
            document.add(new Paragraph("=====================================\n"));
            document.add(new Paragraph("Account ID: " + id).setBold().setMarginTop(10));
            document.add(new Paragraph("=====================================\n"));
            
            float[] columnWidths = {100f, 150f, 100f, 150f};
            com.itextpdf.layout.element.Table table = new com.itextpdf.layout.element.Table(columnWidths);
            table.setWidth(100);
            
            table.addHeaderCell(new Paragraph("Transaction ID").setBold());
            table.addHeaderCell(new Paragraph("Account Type").setBold());
            table.addHeaderCell(new Paragraph("Amount").setBold());
            table.addHeaderCell(new Paragraph("Date").setBold());
            
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd MMM yyyy HH:mm");
            

            for (BmTransaction transaction : transactions) {
                table.addCell(String.valueOf(transaction.getBTransactionid()));
                table.addCell(transaction.getBTransactiontype());
                table.addCell(String.format("R%.2f", transaction.getBAmount()));
                table.addCell(sdf.format(transaction.getBTransactiondate()));
            }

            document.add(table);
            document.add(new Paragraph("\nThank you for using BMS!").setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER));
            document.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new IOException("Error generating PDF", e);
        }
    }
}
