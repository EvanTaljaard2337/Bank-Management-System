<%-- 
    Document   : backup_outcome
    Created on : 29 Apr 2025, 2:10:25 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Backup Outcome Page</title>
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
                text-align: center;
            }
            .outcome-message {
                font-size: 18px;
                padding: 20px;
                background: #f0f8ff;
                border-radius: 5px;
                margin-bottom: 30px;
            }
            .return-link {
                display: inline-block;
                background: #007BFF;
                color: white;
                text-decoration: none;
                padding: 12px 25px;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .return-link:hover {
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
            <h1>Backup Outcome</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <%
                String outcome = (String)request.getAttribute("backupStatus");
            %>
            <div class="outcome-message">
                <%=outcome%>
            </div>
            <a href="adminDashboard" class="return-link">Return to Dashboard</a>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | System Administration
        </div>
    </body>
</html>