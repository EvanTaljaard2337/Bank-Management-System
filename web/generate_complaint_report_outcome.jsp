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
        .home-button {
            display: inline-block;
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            margin-top: 20px;
            transition: background-color 0.3s;
        }
        .home-button:hover {
            background-color: #0056b3;
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
</body>
</html>