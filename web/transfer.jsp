<%-- 
    Document   : transfer
    Created on : 07 Apr 2025, 18:03:04
    Author     : Evan
--%>
<%@page import="za.ac.tut.entities.BmCustomer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transactions Page</title>
    </head>
    <body>
        <h1>Transactions Page</h1>

        <h2>Check Account Balance</h2>
        <%
            BmCustomer cust = (BmCustomer)session.getAttribute("customer");
        %>
        <form action="checkBalanceServlet.do" method="post">
            <input type="hidden" name="accountId" value="<%=cust.getBCustomerid()%>"/>
            <input type="submit" value="Check Balance" />
        </form>
        <h2>Transfer Funds</h2>
        <form action="transferFundsServlet.do" method="post">
            <label for="fromAccountId">From Account ID:</label>
            <input type="text" id="fromAccountId" name="fromAccountId" required>
            <br>
            <label for="toAccountId">To Account ID:</label>
            <input type="text" id="toAccountId" name="toAccountId" required>
            <br>
            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required>
            <br>
            <input type="submit" value="Transfer Funds">
        </form>
    </body>
</html>
