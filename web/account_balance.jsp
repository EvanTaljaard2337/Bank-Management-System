<%-- 
    Document   : account_balance
    Created on : 07 Apr 2025, 22:38:40
    Author     : Evan
--%>

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
            .balance-label {
                font-size: 18px;
                color: #555;
                margin-top: 20px;
            }
            .balance-amount {
                font-size: 36px;
                font-weight: bold;
                color: #28a745; /* Green for balance */
                margin: 10px 0 30px 0;
            }
            .home-link {
                color: #007BFF;
                text-decoration: none;
                font-weight: bold;
            }
            .home-link:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <%
            BmAccount account = (BmAccount)session.getAttribute("acountDetails");
        %>
        <div class="header">
            <h1>Account Balance</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <p class="balance-label">Your current account balance is:</p>
            <p class="balance-amount">R <%=account != null ? account.getBBalance() : "0.00" %></p>
            <p><a class="home-link" href="customer_dashboard.jsp">Home</a></p>
        </div>
    </body>
</html>