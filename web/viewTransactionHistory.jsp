<%-- 
    Document   : viewTransactionHistory
    Created on : 01 May 2025, 13:51:31
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmTransaction"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Page</title>
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
            .container {
                display: flex;
                max-width: 1200px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                overflow: hidden;
                padding: 20px;
            }
            .content {
                flex: 1;
                padding: 20px;
                color: #333;
            }
            h2 {
                font-size: 28px;
                margin-bottom: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #e0e0e0;
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #007BFF;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            .footer {
                text-align: center;
                padding: 20px;
                background: #007BFF;
                color: white;
                font-size: 14px;
                margin-top: 40px;
            }
            a {
                color: #007BFF;
                text-decoration: none;
                font-weight: bold;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Transaction History</h1>
            <a href="customer_dashboard.jsp">Return to Dashboard</a>
        </div>
        <div class="container">
            <div class="content">
                <h2>Your Transactions</h2>
                <table>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Transaction Type</th>
                        <th>Amount</th>
                        <th>Transaction Date</th>
                    </tr>
                    <%
                        List<BmTransaction> transactions = (List<BmTransaction>) session.getAttribute("transactionDetails");
                        if (transactions != null && !transactions.isEmpty()) {
                            for (BmTransaction transaction : transactions) {
                    %>
                    <tr>
                        <td><%= transaction.getBTransactionid() %></td>
                        <td><%= transaction.getBTransactiontype() %></td>
                        <td><%= transaction.getBAmount() %></td>
                        <td><%= transaction.getBTransactiondate() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="4">No transactions found.</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Contact Support: support@yourbank.com | Phone: 123-456-7890
        </div>
    </body>
</html>