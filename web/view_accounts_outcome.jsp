<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee View</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f4f4;
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

        h2 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 30px;
            font-size: 26px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
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

        .no-data {
            padding: 20px;
            font-style: italic;
            color: #666;
            text-align: center;
            font-size: 18px;
        }

        .nav-links {
            margin-top: 30px;
            text-align: center;
        }

        .nav-links form {
            display: inline-block;
        }

        .nav-links button {
            background: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-weight: bold;
        }

        .nav-links button:hover {
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
        <h1>Customer Accounts</h1>
        <a href="index.html">Logout</a>
    </div>

    <div class="container">
        <%
            BmBankManager m = (BmBankManager)session.getAttribute("manager");
            List<BmAccount> accounts = (List<BmAccount>)request.getAttribute("accounts");
            if (accounts != null && !accounts.isEmpty()) {
        %>
        <h2>Customer Accounts</h2>
        <table>
            <thead>
                <tr>
                    <th>Account ID</th>
                    <th>Customer ID</th>
                    <th>Balance</th>
                    <th>Account Status</th>
                    <th>Account Type</th>
                </tr>
            </thead>
            <tbody>
                <% for (BmAccount bm : accounts) { %>
                <tr>
                    <td><%= bm.getBAccountid() %></td>
                    <td><%= bm.getBCustomerid().getBCustomerid() %></td>
                    <td>R <%= bm.getBBalance() %></td>
                    <td><%= bm.getBStatus() %></td>
                    <td><%= bm.getBAccounttype() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%
            } else {
        %>
        <div class="no-data">No accounts found.</div>
        <%
            }
        %>
        <div class="nav-links">
            <form action="bankManagerDashboard.jsp" method="get">
                <button type="submit">Back to Dashboard</button>
            </form>
        </div>
    </div>

    <div class="footer">
        &copy; 2025 YourBank Inc. All rights reserved.
    </div>

</body>
</html>
