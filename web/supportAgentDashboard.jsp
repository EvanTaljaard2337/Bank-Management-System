<%-- 
    Document   : supportAgentDashboard
    Created on : 05 Apr 2025, 21:08:15
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmCustomerSupportAgent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Support Dashboard</title>
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
                max-width: 800px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 30px;
            }
            .welcome-message {
                font-size: 20px;
                margin-bottom: 25px;
                color: #333;
            }
            .action-list {
                list-style-type: none;
                padding: 0;
            }
            .action-list li {
                margin-bottom: 15px;
            }
            .action-list a {
                display: block;
                background: #007BFF;
                color: white;
                text-decoration: none;
                padding: 12px 20px;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .action-list a:hover {
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
            <h1>Customer Support Dashboard</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <%
                BmCustomerSupportAgent cs = (BmCustomerSupportAgent)session.getAttribute("support");
            %>
            <h2 class="welcome-message">Welcome, <%=cs.getBFullname()%></h2>
            
            <ol class="action-list">
                <li><a href="view_complaints.jsp">View Complaints</a></li>
                <li><a href="update_complaint_status.jsp">Update Complaint Status</a></li>
            </ol>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Customer Support
        </div>
    </body>
</html>