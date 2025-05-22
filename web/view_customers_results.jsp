<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.BmCustomer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #007BFF;
            color: white;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }

        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            margin: 0;
            font-size: 24px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007BFF;
            color: white;
            font-weight: normal;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .no-results {
            margin-top: 20px;
            font-style: italic;
            color: #666;
            text-align: center;
        }

        .back-link {
            display: inline-block;
            margin-top: 25px;
            text-decoration: none;
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .back-link:hover {
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
        <h1>Customer Search Results</h1>
    </div>

    <div class="container">
        <%
            BmBankManager b = (BmBankManager)session.getAttribute("manager");
            session.setAttribute("manager", b);
            List<BmCustomer> customers = (List<BmCustomer>)request.getAttribute("customers");

            if (customers != null && !customers.isEmpty()) {
        %>
        <table>
            <tr>
                <th>Customer ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Phone</th>
            </tr>
            <%
                for (BmCustomer c : customers) {
            %>
            <tr>
                <td><%= c.getBCustomerid() %></td>
                <td><%= c.getBFullname() %></td>
                <td><%= c.getBEmail() %></td>
                <td><%= c.getBAddress() %></td>
                <td><%= c.getBPhone() %></td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
            <p class="no-results">No customers found matching the criteria.</p>
        <% } %>

        <div style="text-align: center;">
            <a class="back-link" href="bankManagerDashboard.jsp">Back to Dashboard</a>
        </div>

    </div>

    <div class="footer">
        &copy; 2025 Your Bank Name | Manager Portal
    </div>
</body>
</html>