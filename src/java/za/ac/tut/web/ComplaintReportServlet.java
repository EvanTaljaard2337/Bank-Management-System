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
            complaints = getComplaints(statusFilter,startDate,endDate);
        }
        
        if("text".equals(export)){
            exportToText(complaints,response);
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
        // Method to export data to a text file
    private void exportToText(List<BmComplaint> activities, HttpServletResponse response) throws IOException {
        if (activities == null || activities.isEmpty()) {
            return;
        }

        // Set the content type and attachment header for text file download
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename=ComplaintReport.txt");

        // Create a BufferedWriter to write to the response output stream
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(response.getOutputStream()));

        // Write a title and timestamp to the file
        writer.write("Complaint Report\n");
        writer.write("Generated on: " + new java.util.Date() + "\n");
        writer.write("=====================================\n");

        // Iterate over the list of activities and write them to the file
        for (BmComplaint activity : activities) {
            writer.write("Complaint ID: " + activity.getBComplaintid() + "\n");
            writer.write("Description: " + activity.getBDescription()+ "\n");
            writer.write("Status: " + activity.getBStatus() + "\n");
            writer.write("Date: " + activity.getBCreatedat() + "\n");
            writer.write("Date: " + activity.getBCustomerid().getBFullname() + "\n");
            writer.write("-------------------------------------\n");
        }

        // Flush and close the writer
        writer.flush();
        writer.close();
    }
}
