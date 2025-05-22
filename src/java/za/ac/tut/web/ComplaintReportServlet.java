package za.ac.tut.web;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmComplaintFacadeLocal;
import za.ac.tut.entities.BmComplaint;

/**
 *
 * @author Evan
 */
public class ComplaintReportServlet extends HttpServlet {
    @EJB
    private BmComplaintFacadeLocal cfl;
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String statusFilter = request.getParameter("status");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String export = request.getParameter("export");
        Date startDate = null;
        Date endDate = null;

        try {
            if (startDateStr != null && !startDateStr.isEmpty()) {
                startDate = sdf.parse(startDateStr);
            }
            if (endDateStr != null && !endDateStr.isEmpty()) {
                endDate = sdf.parse(endDateStr);
            }
        } catch (ParseException e) {
            request.setAttribute("errMsg", "Invalid date format. Please use yyyy-MM-dd.");
            RequestDispatcher rd = request.getRequestDispatcher("complaint_report.jsp");
            rd.forward(request, response);
            return;
        }

        List<BmComplaint> complaints;

        // Fetch filtered complaints from EJB
        if ((statusFilter == null || statusFilter.isEmpty()) && startDate == null && endDate == null) {
            // No filters - fetch all
            complaints = cfl.findAll();
        } else {
            // Apply filters
            complaints = getComplaints(statusFilter, startDate, endDate);
        }

        if ("pdf".equals(export)) {
            exportToPdf(complaints, response);
            return; // Stop further processing after export
        }

        request.setAttribute("complaints", complaints);
        RequestDispatcher dispatcher = request.getRequestDispatcher("generate_complaint_report_outcome.jsp");
        dispatcher.forward(request, response);
    }

    private List<BmComplaint> getComplaints(String filter, Date startDate, Date endDate) {
        List<BmComplaint> complaints = cfl.findAll(); // Fetch all complaints
        List<BmComplaint> filteredComplaints = new ArrayList<>();

        for (BmComplaint c : complaints) {
            boolean matchesStatus = (filter == null || filter.isEmpty() || (c.getBStatus() != null && c.getBStatus().equalsIgnoreCase(filter)));
            boolean matchesStartDate = (startDate == null || c.getBCreatedat().compareTo(startDate) >= 0);
            boolean matchesEndDate = (endDate == null || c.getBCreatedat().compareTo(endDate) <= 0);

            // Add to filtered list if it matches all criteria
            if (matchesStatus && matchesStartDate && matchesEndDate) {
                filteredComplaints.add(c);
            }
        }
        return filteredComplaints;
    }

    // Method to export data to a PDF file
    private void exportToPdf(List<BmComplaint> complaints, HttpServletResponse response) throws IOException {
        if (complaints == null || complaints.isEmpty()) {
            response.getWriter().write("No complaints found for export.");
            return;
        }

        // Set the content type and attachment header for PDF file download
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=ComplaintReport.pdf");

        try (OutputStream out = response.getOutputStream()) {
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            document.add(new Paragraph("Complaint Report").setBold().setFontSize(18));
            document.add(new Paragraph("Generated on: " + new java.util.Date()));
            document.add(new Paragraph("=====================================\n"));

            // Iterate over the list of complaints and write them to the PDF
            for (BmComplaint complaint : complaints) {
                document.add(new Paragraph("Complaint ID: " + complaint.getBComplaintid()));
                document.add(new Paragraph("Description: " + complaint.getBDescription()));
                document.add(new Paragraph("Status: " + complaint.getBStatus()));
                document.add(new Paragraph("Date: " + complaint.getBCreatedat()));
                document.add(new Paragraph("Customer: " + (complaint.getBCustomerid() != null ? complaint.getBCustomerid().getBFullname() : "Not available")));
                document.add(new Paragraph("-------------------------------------\n"));
            }

            document.close();
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
            throw new IOException("Error generating PDF", e);
        }
    }
}
