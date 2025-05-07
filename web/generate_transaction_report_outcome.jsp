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
            padding: 20px;
        }
        h1 {
            color: #007BFF;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        .no-data {
            color: red;
            margin-top: 20px;
        }
        a, .export-button {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        a:hover, .export-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Transaction Report</h1>

    <%
        List<BmTransaction> transactions = (List<BmTransaction>) request.getAttribute("transactions");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    %>

    <%
        if (transactions != null && !transactions.isEmpty()) {
    %>
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
                <td><%= t.getBAmount() %></td>
                <td><%= sdf.format(t.getBTransactiondate()) %></td>
                <td>No Description</td> <!-- Assuming no description is provided -->
            </tr>
            <% } %>
        </table>
    <%
        } else {
    %>
        <p class="no-data">No transactions found for the selected criteria.</p>
    <%
        }
    %>

    <a href="generate_transaction_report.jsp">Back to Report Form</a>
    
    <% if (transactions != null && !transactions.isEmpty()) { %>
        <form method="post" action="GenerateTransactionReportServlet.do">
            <input type="hidden" name="accountNumber" value="<%= request.getParameter("accountNumber") != null ? request.getParameter("accountNumber") : "" %>">
            <input type="hidden" name="transactionType" value="<%= request.getParameter("transactionType") != null ? request.getParameter("transactionType") : "" %>">
            <input type="hidden" name="startDate" value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : "" %>">
            <input type="hidden" name="endDate" value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : "" %>">
            <input type="hidden" name="export" value="text">
            <input type="submit" value="Export as Text File" class="export-button">
        </form>
    <% } %>
</body>
</html>