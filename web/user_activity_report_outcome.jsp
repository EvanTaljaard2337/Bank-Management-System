<%@page import="za.ac.tut.entities.BmBankManager"%>
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
        .header {
            background: #007BFF;
            color: white;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }
        .container {
            max-width: 800px;
            margin: 30px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
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
            padding: 12px 25px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .export-button:hover {
            background-color: #0056b3;
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
    </style>
</head>
<body>

<div class="header">
    <h1>User Activity Report</h1>
</div>

<div class="container">
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
                BmBankManager m = (BmBankManager)session.getAttribute("manager");
                if (m.getBFullname() == null) {
                    response.sendRedirect("index.html");
                    return;
                }
                List<UserActivity> activities = (List<UserActivity>)request.getAttribute("activities");
                if (activities != null && !activities.isEmpty()) {
                    for (User Activity u : activities) {
            %>
            <tr>
                <td><%= u.getUser Id() %></td>
                <td><%= u.getActivityType() %></td>
                <td><%= u.getActivityTime() %></td>
                <td>
                    <%
                        if (u.getAdministrator() != null && u.getAdministrator().getBFullname() != null) {
                    %>
                        <%= u.getAdministrator().getBFullname() %>
                    <%
                        } else {
                    %>
                        N/A
                    <%
                        }
                    %>
                </td>
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

    <% if (activities != null && !activities.isEmpty()) { %>
        <div class="nav-links">
            <a href="user_activity_report.jsp">Back to filter</a>
            <a href="bankManagerDashboard.jsp">Back to Dashboard</a>
            
            <form method="post" action="User ActivityReportServlet.do" style="display: inline;">
                <input type="hidden" name="export" value="pdf">
                <input type="hidden" name="userId" value="<%= request.getParameter("userId") != null ? request.getParameter("userId") : "" %>">
                <input type="hidden" name="activityType" value="<%= request.getParameter("activityType") != null ? request.getParameter("activityType") : "" %>">
                <input type="hidden" name="startDate" value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : "" %>">
                <input type="hidden" name="endDate" value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : "" %>">
                <input type="hidden" name="manager" value="<%= request.getParameter("manager") != null ? request.getParameter("manager") : "" %>">
                <button type="submit" class="export-button">Export as Pdf File</button>
            </form>
        </div>
    <% } %>
</div>

<div class="footer">
    &copy; 2025 Your Bank Name | Manager Portal
</div>

</body>
</html>