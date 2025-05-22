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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
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
                max-width: 1200px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 30px;
            }
            .info-message {
                font-size: 18px;
                margin-bottom: 20px;
                color: #555;
                text-align: center;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
            }
            th {
                background-color: #007BFF;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #e9e9e9;
            }
            .nav-links {
                margin-top: 30px;
                text-align: center;
            }
            .nav-links a, button, .export-button {
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
            .nav-links a:hover, button:hover, .export-button:hover {
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
            .social-media {
                margin-top: 10px;
            }
            .social-media a {
                color: white;
                margin: 0 10px;
                font-size: 20px;
                text-decoration: none;
                vertical-align: middle;
                transition: color 0.3s;
            }
            .social-media a:hover {
                color: #d4d4d4;
            }
            .social-media span {
                margin-left: 6px;
                vertical-align: middle;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Transaction History</h1>
            <a href="CustomerDashboardServlet.do" method="GET">Return to Dashboard</a>
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
                            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd MMM yyyy HH:mm");
                            
                            for (BmTransaction transaction : transactions) {
                    %>
                    <tr>
                        <td><%= transaction.getBTransactionid() %></td>
                        <td><%= transaction.getBTransactiontype() %></td>
                        <td><%= transaction.getBAmount() %></td>
                        <td><%= sdf.format(transaction.getBTransactiondate()) %></td>
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
                <div class="nav-links">
                <% if (transactions != null && !transactions.isEmpty()) { %>
                    <form method="post" action="GenerateTransactionHistoryServlet.do" style="display: inline;">                        
                        <input type="hidden" name="export" value="pdf">
                        <button type="submit" class="export-button">Export to PDF</button>
                    </form>
                <% } %>
            </div>
            </div>
        </div>
        <div class="footer">
        &copy; 2025 BMS | Contact Support: support@bms.com | Phone: 123-456-7890
        <div class="social-media">
            <a href="https://x.com/Nedbank?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor" target="_blank" aria-label="X Social Media">
                <i class="fab fa-twitter"></i><span>X</span>
            </a>
            <a href="https://github.com/EvanTaljaard2337/Bank-Management-System" target="_blank" aria-label="Facebook">
                <i class="fab fa-facebook-f"></i><span>Facebook</span>
            </a>
            <a href="https://github.com/EvanTaljaard2337/Bank-Management-System" target="_blank" aria-label="Instagram">
                <i class="fab fa-instagram"></i><span>Instagram</span>
            </a>
            <a href="https://github.com/EvanTaljaard2337/Bank-Management-System" target="_blank" aria-label="GitHub">
                <i class="fab fa-github"></i><span>GitHub</span>
            </a>
        </div>
    </div>
    </body>
</html>