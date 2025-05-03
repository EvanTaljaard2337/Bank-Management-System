<%-- 
    Document   : adminDashboard
    Created on : 05 Apr 2025, 21:07:57
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmSystemAdministrator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin DashBoard</title>
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
            .action-links {
                margin-top: 30px;
            }
            .action-links a {
                display: block;
                background: #007BFF;
                color: white;
                text-decoration: none;
                padding: 12px 20px;
                margin-bottom: 15px;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .action-links a:hover {
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
            <h1>Administrative Dashboard</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <%
                BmSystemAdministrator c = (BmSystemAdministrator)request.getAttribute("admin");   
            %>
            <h1 class="welcome-message">Welcome <b><%=c.getBFullname()%></b>!</h1>
            
            <div class="action-links">
                <a href="perform_backup.jsp">Perform Database Backup</a>
                <a href="index.html">Return to Home Page</a>
            </div>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Admin Support: admin@yourbank.com
        </div>
    </body>
</html>