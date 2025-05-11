<%-- 
    Document   : view_transactions_outcome
    Created on : 07 Apr 2025, 6:57:09 PM
    Author     : thand
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.BmTransaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Records</title>
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
            button, .export-button {
                background: #007BFF;
                color: white;
                border: none;
                padding: 8px 16px;
                border-radius: 5px;
                font-size: 14px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button:hover, .export-button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Transaction Records</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <p class="info-message">Below are the transaction records you requested.</p>
            <table>
                <thead>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Account ID</th>
                        <th>Transaction Type</th>
                        <th>Amount</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<BmTransaction> transactions = (List<BmTransaction>)request.getAttribute("transactions");
                        for(BmTransaction t : transactions) {
                            Integer tID = t.getBTransactionid();
                            Integer accID = t.getBAccountid().getBAccountid();
                            String tType = t.getBTransactiontype();
                            BigDecimal amount = t.getBAmount();
                            Date tDate = t.getBTransactiondate();
                    %>
                    <tr>
                        <td><%=tID%></td>
                        <td><%=accID%></td>
                        <td><%=tType%></td>
                        <td>R <%=amount%></td>
                        <td><%=tDate%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            
            <div class="nav-links">
                <a href="view_transactions.jsp">Back to Filter</a>
                <a href="index.html">Main Page</a>
                <% 
                    String filter = (String) session.getAttribute("filter");
                    String filterVal = (String) session.getAttribute("filter_val");
                    System.out.println("Filter: " + filter);
                    System.out.println("Filter Value: " + filterVal);
                    if (transactions != null && !transactions.isEmpty()) { 
                %>
                <form method="GET" action="ViewTransactionsServlet.do" style="display: inline;">
                    <input type="hidden" name="filter" value="<%= session.getAttribute("filter") != null ? session.getAttribute("filter") : "" %>">
                    <input type="hidden" name="filter_val" value="<%= session.getAttribute("filter_val") != null ? session.getAttribute("filter_val") : "" %>">
                    <input type="hidden" name="export" value="text">
                    <button type="submit" class="export-button" style="margin-left: 10px;">Export as Text File</button>
                </form>
                <% } %>
            </div>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Bank Management
        </div>
    </body>
</html>