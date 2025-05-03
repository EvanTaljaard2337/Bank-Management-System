<%-- 
    Document   : loanOfficerDashboard
    Created on : 05 Apr 2025, 21:07:45
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmLoanOfficer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Officer Dashboard</title>
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
                margin-top: 20px;
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
            .report-form {
                margin-top: 30px;
                padding-top: 20px;
                border-top: 1px solid #eee;
            }
            .report-form input[type="submit"] {
                background: #28a745;
                color: white;
                border: none;
                padding: 12px 25px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
                width: 100%;
            }
            .report-form input[type="submit"]:hover {
                background-color: #218838;
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
            <h1>Loan Officer Dashboard</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <%
                BmLoanOfficer l = (BmLoanOfficer)session.getAttribute("officer");
            %>
            <h2 class="welcome-message">Welcome, <%=l.getBFullname()%></h2>
            
            <div class="action-links">
                <a href="view_loans.jsp">View Loans</a>
                <a href="update_loan_status.jsp">Update Loan Status</a>
                <a href="count_loans.jsp">Count Loans</a>
            </div>
            
            <div class="report-form">
                <p>Generate Loan Report:</p>
                <form action="loan_report.jsp" method="POST">
                    <input type="submit" value="VIEW REPORT"/>
                </form>
            </div>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Loans Department
        </div>
    </body>
</html>