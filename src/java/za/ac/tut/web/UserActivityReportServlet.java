/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import static com.sun.xml.ws.security.addressing.impl.policy.Constants.logger;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static javax.xml.bind.DatatypeConverter.parseDate;
import za.ac.tut.ejb.bl.UserActivityFacadeLocal;
import za.ac.tut.entities.UserActivity;

/**
 *
 * @author Evan
 */
public class UserActivityReportServlet extends HttpServlet {
    @EJB
    private UserActivityFacadeLocal afl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // Get filter values from the form
        String userId = request.getParameter("userId");
        String activityType = request.getParameter("activityType");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String export = request.getParameter("export");
        // Convert the date strings to Date objects
        Date startDate = parseDate(startDateStr);
        Date endDate = parseDate(endDateStr);
        if ("text".equals(export)) {
            List<UserActivity> activities = (List<UserActivity>) request.getSession().getAttribute("filteredActivities");
            exportToText(activities, response);
            return; // Exit early so it doesn't continue
        }
        else{
            try{
                // Retrieve the filtered user activities from the facade
                List<UserActivity> activities = getFilteredActivities(userId, activityType, startDate, endDate);

                // Set the activities as a request attribute
                request.setAttribute("activities", activities);
                // Forward to the JSP page to display the filtered activities
                request.getRequestDispatcher("user_activity_report_outcome.jsp").forward(request, response);
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
    private List<UserActivity> getFilteredActivities(String userId, String activityType, Date startDate, Date endDate) {
        // Fetch all activities
        List<UserActivity> allActivities = afl.findAll();
        List<UserActivity> filteredActivities = new ArrayList<>();

        // Log the total number of activities before filtering
       

        // Iterate over all activities to filter based on the given criteria
        for (UserActivity u : allActivities) {
            boolean matches = true;

            // Filter by userId if provided
            if (userId != null && !userId.isEmpty() && !userId.equals(u.getUserId())) {
                matches = false;
               
            }

            // Filter by activityType if provided
            if (activityType != null && !activityType.isEmpty() && !activityType.equals(u.getActivityType())) {
                matches = false;
               
            }

            // Filter by startDate if provided
            if (startDate != null && u.getActivityTime().before(startDate)) {
                matches = false;
               
            }

            // Filter by endDate if provided
            if (endDate != null) {
                if (u.getActivityTime() == null || u.getActivityTime().after(endDate)) {
                    matches = false;
                   
                }
            }

            // If all conditions are met, add the activity to the filtered list
            if (matches) {
                filteredActivities.add(u);
               
            }
        }

        return filteredActivities;
    }
    // Method to export data to a text file
    private void exportToText(List<UserActivity> activities, HttpServletResponse response) throws IOException {
        if (activities == null || activities.isEmpty()) {
            return;
        }

        // Set the content type and attachment header for text file download
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename=UserActivityReport.txt");

        // Create a BufferedWriter to write to the response output stream
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(response.getOutputStream()));

        // Write a title and timestamp to the file
        writer.write("User Activity Report\n");
        writer.write("Generated on: " + new java.util.Date() + "\n");
        writer.write("=====================================\n");

        // Iterate over the list of activities and write them to the file
        for (UserActivity activity : activities) {
            writer.write("User ID: " + activity.getUserId() + "\n");
            writer.write("Activity Type: " + activity.getActivityType() + "\n");
            writer.write("Activity Time: " + activity.getActivityTime() + "\n");
            writer.write("-------------------------------------\n");
        }

        // Flush and close the writer
        writer.flush();
        writer.close();
    }

}
