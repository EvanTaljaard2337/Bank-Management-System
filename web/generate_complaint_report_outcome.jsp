<%@page import="za.ac.tut.entities.BmComplaint"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Complaint Report Outcome</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f4;
    }

    h1 {
        color: #333;
    }

    .complaints-table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        margin-top: 20px;
    }

    .complaints-table th, .complaints-table td {
        padding: 12px 15px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }

    .complaints-table th {
        background-color: #007BFF;
        color: white;
        font-weight: normal;
    }

    .complaints-table tr:last-child td {
        border-bottom: none;
    }

    .no-data {
        padding: 20px;
        font-style: italic;
        color: #666;
        background: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        margin-top: 20px;
    }

    .home-button,
    .export-button {
        display: inline-block;
        background-color: #007BFF;
        color: white;
        padding: 12px 25px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
        text-align: center;
        cursor: pointer;
        margin-top: 20px;
        transition: background-color 0.3s, transform 0.3s;
        border: none; /* Remove border for cleaner look */
    }

    .home-button:hover,
    .export-button:hover {
        background-color: #0056b3;
        transform: scale(1.05); /* Slight scale effect for hover */
    }

    .export-button {
        background-color: #28a745; /* Green for export button */
    }

    .export-button:hover {
        background-color: #218838;
    }
</style>
</head>
<body>
    <h1>Complaint Report Outcome</h1>
    <table class="complaints-table">
        <thead>
            <tr>
                <th>Complaint ID</th>
                <th>Description</th>
                <th>Status</th>
                <th>Date Filed</th>
                <th>Customer Name</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<BmComplaint> complaints = (List<BmComplaint>)request.getAttribute("complaints");
            if (complaints != null && !complaints.isEmpty()) {
                for (BmComplaint c : complaints) {
        %>
            <tr>
                <td><%= c.getBComplaintid() %></td>
                <td><%= c.getBDescription() %></td>
                <td><%= c.getBStatus() %></td>
                <td><%= c.getBCreatedat() != null ? c.getBCreatedat() : "N/A" %></td>
                <td><%= c.getBCustomerid() != null ? c.getBCustomerid().getBFullname() : "N/A" %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" class="no-data">No complaints found.</td>
            </tr>
        <%
            }
        %>
        
        </tbody>
    </table>
    <a href="bankManagerDashboard.jsp" class="home-button">Home</a>
    <% if (complaints != null && !complaints.isEmpty()) { %>
        <form method="get" action="ComplaintReportServlet.do">
            <input type="hidden" name="export" value="text">
            <!-- Preserve filter parameters for the next export -->
            <input type="hidden" name="status" value="<%= request.getParameter("status") != null ? request.getParameter("status") : "" %>">
            <input type="hidden" name="startDate" value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : "" %>">
            <input type="hidden" name="endDate" value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : "" %>">
            <input type="submit" value="Export as Text File" class="export-button">
        </form>
    <% } %>
    
</body>
</html>