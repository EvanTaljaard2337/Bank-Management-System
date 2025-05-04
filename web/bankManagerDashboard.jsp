<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bank Management Dashboard</title>
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
            .options {
                margin-top: 20px;
            }
            .options h3 {
                margin-bottom: 15px;
            }
            .action-link {
                display: block; /* Changed from inline-block to block */
                background: #007BFF;
                color: white;
                text-decoration: none;
                padding: 12px 25px;
                border-radius: 5px;
                transition: background-color 0.3s;
                margin-top: 10px; /* Added margin for vertical spacing */
                width: fit-content;
                min-width: 200px;
            }
            .action-link:hover {
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
            <h1>Bank Manager Dashboard</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <%
                BmBankManager m = (BmBankManager)request.getAttribute("manager");
            %>
            <h2 class="welcome-message">Welcome, <%=m.getBFullname()%></h2>
            <p>You can view and manage all bank transactions from this dashboard.</p>
            
            <div class="options">
                <h3>Available Actions:</h3>
                <a href="view_transactions.jsp" class="action-link">View Transactions</a>
                <a href="generate_summary_report.jsp" class="action-link">Generate Summary Report</a>
                <a href="generate_transaction_report.jsp" class="action-link">Generate Transaction Report</a>
                <a href="generate_loan_report.jsp" class="action-link">Generate Loan Report</a>
                <a href="generate_complaint_report.jsp" class="action-link">Generate Complaint Report</a>
                <a href="user_activity_report.jsp" class="action-link">User Activity Report</a>
            </div>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Manager Portal
        </div>
    </body>
</html>