<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="za.ac.tut.entities.BmTransaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Transaction Report</title>
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
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Transaction Report</h1>
            <a href="index.html">Logout</a>
        </div>

        <div class="container">
            <%
                List<BmTransaction> transactions = (List<BmTransaction>) request.getAttribute("transactions");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            %>

            <%
                if (transactions != null && !transactions.isEmpty()) {
            %>
                <p class="info-message">Below are the filtered transaction results.</p>
                <table>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Account ID</th>
                        <th>Type</th>
                        <th>Amount</th>
                        <th>Date</th>
                        <th>Description</th>
                    </tr>
                    <%
                        for (BmTransaction t : transactions) {
                    %>
                    <tr>
                        <td><%= t.getBTransactionid() %></td>
                        <td><%= t.getBAccountid().getBAccountid() %></td>
                        <td><%= t.getBTransactiontype() %></td>
                        <td>R <%= t.getBAmount() %></td>
                        <td><%= sdf.format(t.getBTransactiondate()) %></td>
                        <td>No Description</td>
                    </tr>
                    <% } %>
                </table>
            <% } else { %>
                <p class="info-message" style="color: red;">No transactions found for the selected criteria.</p>
            <% } %>

            <div class="nav-links">
                <a href="generate_transaction_report.jsp">Back to Report Form</a>
                <a href="bankManagerDashboard.jsp" class="export-button">Main Page</a>
                <% if (transactions != null && !transactions.isEmpty()) { %>
                    <form method="post" action="GenerateTransactionReportServlet.do" style="display: inline;">
                        <input type="hidden" name="accountNumber" value="<%= request.getParameter("accountNumber") != null ? request.getParameter("accountNumber") : "" %>">
                        <input type="hidden" name="transactionType" value="<%= request.getParameter("transactionType") != null ? request.getParameter("transactionType") : "" %>">
                        <input type="hidden" name="startDate" value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : "" %>">
                        <input type="hidden" name="endDate" value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : "" %>">
                        <input type="hidden" name="export" value="pdf">
                        <button type="submit" class="export-button">Export as Pdf File</button>
                    </form>
                <% } %>
            </div>
        </div>

        <div class="footer">
            &copy; 2025 Your Bank Name | Bank Management
        </div>
    </body>
</html>
