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
        margin: 0;
        background-color: #f4f4f4;
    }

    .header {
        background: #007BFF;
        color: white;
        padding: 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    }

    .header h1 {
        margin: 0;
        font-size: 24px;
    }

    .header a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        padding: 8px 15px;
        border: 1px solid white;
        border-radius: 4px;
        transition: background-color 0.3s;
    }

    .header a:hover {
        background-color: rgba(255,255,255,0.2);
    }

    .container {
        max-width: 1200px;
        margin: 30px auto;
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        padding: 30px;
    }

    .complaints-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .complaints-table th, .complaints-table td {
        padding: 12px 15px;
        border: 1px solid #ddd;
        text-align: left;
    }

    .complaints-table th {
        background-color: #007BFF;
        color: white;
    }

    .complaints-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .complaints-table tr:hover {
        background-color: #e9e9e9;
    }

    .no-data {
        padding: 20px;
        font-style: italic;
        color: #666;
        text-align: center;
    }

    .nav-links {
        margin-top: 30px;
        text-align: center;
    }

    .nav-links a, .nav-links button {
        background: #007BFF;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s;
        font-weight: bold;
        margin: 0 10px;
        text-decoration: none;
    }

    .nav-links a:hover, .nav-links button:hover {
        background-color: #0056b3;
    }

    .nav-links .export-button {
        background-color: #007BFF;
    }

    .nav-links .export-button:hover {
        background-color: #0056b3;
    }

    .footer {
        text-align: center;
        padding: 20px;
        background: #007BFF;
        color: white;
        font-size: 14px;
        margin-top: 40px;
    }
</style>
</head>
<body>
    <div class="header">
        <h1>Complaint Report Outcome</h1>
        <a href="index.html">Logout</a>
    </div>

    <div class="container">
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

        <div class="nav-links">
            <a href="generate_complaint_report.jsp" class="export-button">Back to filter</a>
            <a href="bankManagerDashboard.jsp">Back to Dashboard</a>
            
            <% if (complaints != null && !complaints.isEmpty()) { %>
                <form method="get" action="ComplaintReportServlet.do" style="display: inline;">
                    <input type="hidden" name="export" value="pdf">
                    <input type="hidden" name="status" value="<%= request.getParameter("status") != null ? request.getParameter("status") : "" %>">
                    <input type="hidden" name="startDate" value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : "" %>">
                    <input type="hidden" name="endDate" value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : "" %>">
                    <button type="submit" class="export-button">Export as Pdf File</button>
                </form>
            <% } %>
        </div>
    </div>

    <div class="footer">
        &copy; 2025 Your Bank Name | Bank Management
    </div>
</body>
</html>
