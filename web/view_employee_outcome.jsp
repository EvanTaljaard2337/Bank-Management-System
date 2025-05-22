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

        .complaints-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .complaints-table th, .complaints-table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .complaints-table th {
            background-color: #007BFF;
            color: white;
        }

        .complaints-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .complaints-table tr:hover {
            background-color: #e9e9e9;
        }

        .no-data {
            padding: 20px;
            font-style: italic;
            color: #666;
            text-align: center;
        }

        .nav-links {
            margin-top: 30px;
            text-align: center;
        }

        .nav-links a {
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

        .nav-links a:hover {
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

    </style>
</head>
<body>

    <div class="header">
        <h1>Employee Directory</h1>
        <a href="index.html">logout</a>
    </div>

    <div class="container">
        <%
            BmBankManager m = (BmBankManager)session.getAttribute("manager");
            List list = (List)request.getAttribute("list");
            if (list != null && !list.isEmpty()) {
                Object obj = list.get(0);
                if (obj instanceof BmBankManager) {
        %>
        <h2>Bank Managers</h2>
        <table class="complaints-table">
            <thead>
                <tr>
                    <th>ID</th><th>Full Name</th><th>Email</th><th>Phone</th>
                </tr>
            </thead>
            <tbody>
                <% for (BmBankManager bm : (List<BmBankManager>)list) { %>
                <tr>
                    <td><%= bm.getBManagerid() %></td>
                    <td><%= bm.getBFullname() %></td>
                    <td><%= bm.getBEmail() %></td>
                    <td><%= bm.getBPhone() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%
                } else if (obj instanceof BmCustomerSupportAgent) {
        %>
        <h2>Customer Support Agents</h2>
        <table class="complaints-table">
            <thead>
                <tr>
                    <th>ID</th><th>Full Name</th><th>Email</th><th>Phone</th>
                </tr>
            </thead>
            <tbody>
                <% for (BmCustomerSupportAgent ag : (List<BmCustomerSupportAgent>)list) { %>
                <tr>
                    <td><%= ag.getBAgentid() %></td>
                    <td><%= ag.getBFullname() %></td>
                    <td><%= ag.getBEmail() %></td>
                    <td><%= ag.getBPhone() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%
                } else if (obj instanceof BmLoanOfficer) {
        %>
        <h2>Loan Officers</h2>
        <table class="complaints-table">
            <thead>
                <tr>
                    <th>ID</th><th>Full Name</th><th>Email</th><th>Phone</th>
                </tr>
            </thead>
            <tbody>
                <% for (BmLoanOfficer lo : (List<BmLoanOfficer>)list) { %>
                <tr>
                    <td><%= lo.getBOfficerid() %></td>
                    <td><%= lo.getBFullname() %></td>
                    <td><%= lo.getBEmail() %></td>
                    <td><%= lo.getBPhone() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%
                } else if (obj instanceof BmSystemAdministrator) {
        %>
        <h2>System Administrators</h2>
        <table class="complaints-table">
            <thead>
                <tr>
                    <th>ID</th><th>Full Name</th><th>Email</th><th>Phone</th>
                </tr>
            </thead>
            <tbody>
                <% for (BmSystemAdministrator sa : (List<BmSystemAdministrator>)list) { %>
                <tr>
                    <td><%= sa.getBAdminid() %></td>
                    <td><%= sa.getBFullname() %></td>
                    <td><%= sa.getBEmail() %></td>
                    <td><%= sa.getBPhone() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%
                }
            } else {
        %>
        <div class="no-data">No employees found.</div>
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
