

<%@page import="za.ac.tut.entities.BmComplaint"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaints Submitted by Customer</title>
    </head>
    <body>
        <h1>My Submitted Complaints</h1>
        <%
            // Retrieve the list of complaints from the session
            List<BmComplaint> complaints = (List<BmComplaint>)session.getAttribute("complaints");
            
            if (complaints != null && !complaints.isEmpty()) {
        %>
        <table border="1">
            <tr>
                <th>Complaint ID</th>
                <th>Status</th>
                <th>Date Created</th>
                <th>Description</th>
            </tr>
            <%
                // Iterate over the list of complaints and display each one
                for (BmComplaint complaint : complaints) {
                complaint.getBComplaintid();
            %>
            <tr>
                <td><%= complaint.getBComplaintid() %></td>
                <td><%= complaint.getBStatus() %></td>
                <td><%= complaint.getBCreatedat() %></td>
                <td><%= complaint.getBDescription() %></td> <!-- Assuming you have a description field -->
            </tr>
            <%
                }
            %>
        </table>
        <%
            } else {
        %>
        <p>No complaints found. Please check your submission or contact support.</p>
        <%
            }
        %>
        <p><a href="customer_dashboard.jsp">Home</a></p>
    </body>
</html>