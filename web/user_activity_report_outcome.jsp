<%@page import="za.ac.tut.entities.UserActivity"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Activity Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 30px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
        }
        .header {
            background: #007BFF;
            color: white;
            padding: 15px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        .footer {
            text-align: center;
            padding: 20px;
            background: #007BFF;
            color: white;
            font-size: 14px;
            margin-top: 40px;
        }
        .export-button {
            text-align: right;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>User Activity Report</h1>
    </div>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Activity Type</th>
                <th>Activity Time</th>
                <th>Admin Name</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<UserActivity> activities = (List<UserActivity>) request.getAttribute("activities");
                if (activities != null && !activities.isEmpty()) {
                    for (UserActivity u : activities) {
            %>
            <tr>
                <td><%= u.getUserId() %></td>
                <td><%= u.getActivityType() %></td>
                <td><%= u.getActivityTime() %></td>
                <td><%= u.getAdministrator().getBFullname() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4" style="text-align:center; color: gray;">No Activities to Show</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <%
        if (activities != null && !activities.isEmpty()) {
    %>
    <div class="export-button">
        <form method="post" action="UserActivityReportServlet">
            <input type="hidden" name="export" value="text">
            <input type="submit" value="Export as Text File">
        </form>
    </div>
    <%
        }
    %>

    <div class="footer">
        &copy; 2025 Your Bank Name | Manager Portal
    </div>
</div>

</body>
</html>

