<%-- 
    Document   : loan_report
    Created on : 03 May 2025, 3:18:15 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Report | Bank Management System</title>
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
                max-width: 1000px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 30px;
            }
            .report-title {
                color: #007BFF;
                margin-top: 0;
                text-align: center;
            }
            .report-message {
                font-size: 18px;
                color: #555;
                text-align: center;
                margin-bottom: 30px;
            }
            .report-content {
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 5px;
                border: 1px solid #e0e0e0;
            }
            .nav-links {
                margin-top: 30px;
                text-align: center;
            }
            .nav-links a {
                display: inline-block;
                margin: 0 10px;
                color: #007BFF;
                text-decoration: none;
                font-weight: bold;
            }
            .nav-links a:hover {
                text-decoration: underline;
            }
            .footer {
                text-align: center;
                padding: 20px;
                background: #007BFF;
                color: white;
                font-size: 14px;
                margin-top: 40px;
            }
            @media print {
                .header, .footer, .nav-links {
                    display: none;
                }
                .container {
                    box-shadow: none;
                    margin: 0;
                    padding: 0;
                }
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Loan Report</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <h2 class="report-title">Loan Portfolio Report</h2>
            <p class="report-message">This is your comprehensive loan report</p>
            
            <div class="report-content">
                <!-- Report content would be dynamically inserted here -->
                <p>Report generated on: <%= new java.util.Date() %></p>
                
                <!-- Placeholder for report data - would be replaced with actual data -->
                <div style="text-align: center; color: #777; padding: 40px 0;">
                    
                </div>
            </div>
            
            <div class="nav-links">
                <a href="loanOfficerDashboard.jsp">Back to Dashboard</a>
                <a href="index.html">Home Page</a>
            </div>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Loans Department
        </div>
    </body>
</html>