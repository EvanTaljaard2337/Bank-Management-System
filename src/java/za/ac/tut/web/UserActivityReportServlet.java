/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmSystemAdministratorFacadeLocal;
import za.ac.tut.ejb.bl.UserActivityFacadeLocal;
import za.ac.tut.entities.BmSystemAdministrator;
import za.ac.tut.entities.UserActivity;

/**
 *
 * @author Evan
 */

public class UserActivityReportServlet extends HttpServlet {
    @EJB
    private UserActivityFacadeLocal afl;
    @EJB
    private BmSystemAdministratorFacadeLocal bfml;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // Get filter values from the form
        String userId = request.getParameter("userId");
        String activityType = request.getParameter("activityType");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String export = request.getParameter("export");
        //String admin = request.getParameter("manager");
        // Convert the date strings to Date objects
        Date startDate = parseDate(startDateStr);
        Date endDate = parseDate(endDateStr);
        
        BmSystemAdministrator manager = getManager("1");
        if(endDate==null){
            request.setAttribute("errMsg","End date is empty :value="+endDate);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        if ("text".equals(export)) {
            List<UserActivity> activities = (List<UserActivity>) request.getSession().getAttribute("filteredActivities");
            exportToPdf(activities, response);
            return; // Exit early so it doesn't continue
        }
        else{
            try{
                // Retrieve the filtered user activities from the facade
                List<UserActivity> activities = getFilteredActivities(manager,userId, activityType, startDate, endDate);
               
                // Set the activities as a request attribute
                request.setAttribute("activities", activities);
                request.getSession().setAttribute("filteredActivities", activities);
                // Forward to the JSP page to display the filtered activities
                RequestDispatcher disp = request.getRequestDispatcher("user_activity_report_outcome.jsp");
                disp.forward(request, response);
            }
            catch(Exception e){
                e.printStackTrace();
                request.setAttribute("errMsg",e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
    }
    private Date parseDate(String dateStr){
        try{
            return new java.text.SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
        }
        catch(java.text.ParseException e){
            return null;
        }
    }
    private BmSystemAdministrator getManager(String admin){
        BmSystemAdministrator manager = bfml.find(Integer.parseInt(admin));
        manager.getBAdminid();
        return manager;
    }
    private List<UserActivity> getFilteredActivities(BmSystemAdministrator admin, String userId, String activityType, Date startDate, Date endDate) {
        List<UserActivity> allActivities = afl.findAll();
        List<UserActivity> filteredActivities = new ArrayList<>();

        for (UserActivity u : allActivities) {
            boolean adminMatch = u.getAdministrator() == null || u.getAdministrator().equals(admin);
            boolean userIdMatch = userId == null || userId.isEmpty() || userId.equals(u.getUserId());
            boolean activityTypeMatch = activityType == null || activityType.isEmpty() || activityType.equalsIgnoreCase(u.getActivityType());
            boolean startDateMatch = startDate == null || !u.getActivityTime().before(startDate); // inclusive
            boolean endDateMatch = endDate == null || !u.getActivityTime().after(endDate); // inclusive

            if (adminMatch && userIdMatch && activityTypeMatch && startDateMatch && endDateMatch) {
                filteredActivities.add(u);
            }
        }
        return filteredActivities;
    }
    // Method to export data to a text file
 // Method to export data to a PDF file
    private void exportToPdf(List<UserActivity> activities, HttpServletResponse response) throws IOException {
        if (activities == null || activities.isEmpty()) {
            response.getWriter().write("No activities found for export.");
            return;
        }

        // Set the content type and attachment header for PDF file download
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=User ActivityReport.pdf");

        try (OutputStream out = response.getOutputStream()) {
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            document.add(new Paragraph("User  Activity Report").setBold().setFontSize(18));
            document.add(new Paragraph("Generated on: " + new java.util.Date()));
            document.add(new Paragraph("=====================================\n"));

            // Iterate over the list of activities and write them to the PDF
            for (UserActivity activity : activities) {
                document.add(new Paragraph("User  ID: " + activity.getUserId()));
                document.add(new Paragraph("Activity Type: " + activity.getActivityType()));
                document.add(new Paragraph("Activity Time: " + activity.getActivityTime()));
                document.add(new Paragraph("-------------------------------------\n"));
            }

            document.close();
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
            throw new IOException("Error generating PDF", e);
        }
    }

}
