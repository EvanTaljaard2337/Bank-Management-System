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
    </head>
    <body>
        <h1>Your current account balance</h1>
        <%
            BmAccount account = (BmAccount)session.getAttribute("acountDetails");
        %>
        <p>Your current Account balance is:</p>
        <p>R <b><%=account.getBBalance()%></b></p>
        <p><a href="customer_dashboard.jsp">home</a></p>
    </body>
</html>
