<%-- 
    Document   : account_balance
    Created on : 07 Apr 2025, 22:38:40
    Author     : Evan
--%>

<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.BmAccount"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Account Balance Page</title>
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
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        .header a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }
        .account-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin: 10px 0;
            background: #f9f9f9;
        }
        .balance-label {
            font-size: 18px;
            color: #555;
            margin-top: 10px;
        }
        .balance-amount {
            font-size: 36px;
            font-weight: bold;
            color: #28a745;
            margin: 10px 0;
        }
        .account-status {
            font-size: 16px;
            color: #007BFF;
            margin-top: 5px;
        }
        .home-link {
            display: inline-block;
            background: #007BFF;
            color: white;
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 5px;
            transition: background-color 0.3s;
            margin: 10px 0;
            font-weight: bold;
            font-size: 16px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .home-link:hover {
            background-color: #0056b3;
        }
        .pending-account-card {
            background: #fff3cd;
            border-left: 5px solid #ffc107;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Account Balance</h1>
        <a href="index.html">Logout</a>
    </div>
    
    <div class="container">
        <%
            List<BmAccount> accountList = (List<BmAccount>) session.getAttribute("acountDetails");

            if (accountList != null && !accountList.isEmpty()) {
                boolean hasActive = false;
                boolean hasPending = false;

                for (BmAccount acc : accountList) {
                    if ("Pending".equals(acc.getBStatus())) {
                        hasPending = true;
                    } else {
                        hasActive = true;
                    }
                }

                if (hasActive) {
        %>
                    <h2>Active Accounts</h2>
        <%
                    for (BmAccount acc : accountList) {
                        if (!"Pending".equals(acc.getBStatus())) {
        %>
                            <div class="account-card">
                                <p class="balance-label">Account Type: <b><%= acc.getBAccounttype() %></b></p>
                                <p class="balance-amount">R <%= acc.getBBalance() != null ? String.format("%,.2f", acc.getBBalance()) : "0.00" %></p>
                                <p class="account-status">Status: <b><%= acc.getBStatus() %></b></p>
                            </div>
        <%
                        }
                    }
                } else {
        %>
                    <p>No approved accounts found.</p>
        <%
                }

                if (hasPending) {
        %>
                    <h2>Accounts Awaiting Approval</h2>
        <%
                    for (BmAccount acc : accountList) {
                        if ("Pending".equals(acc.getBStatus())) {
        %>
                            <div class="account-card pending-account-card">
                                <p class="balance-label">Account Type: <b><%= acc.getBAccounttype() %></b></p>
                                <p class="balance-amount">R <%= acc.getBBalance() != null ? String.format("%,.2f", acc.getBBalance()) : "0.00" %></p>
                                <p class="account-status">Status: <b><%= acc.getBStatus() %></b></p>
                            </div>
        <%
                        }
                    }
                } else {
        %>
                    <p>No pending account applications.</p>
        <%
                }
            } else {
        %>
            <p>No account details available.</p>
        <%
            }
        %>
        <p><a class="home-link" href="customer_dashboard.jsp">Home</a></p>
    </div>
</body>
</html>
