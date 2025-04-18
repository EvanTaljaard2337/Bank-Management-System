<%-- 
    Document   : bankManagerDashboard
    Created on : 05 Apr 2025, 21:08:06
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bank Management DashBoard</title>
    </head>
    <body>
        <h1>Bank Manager DashBoard</h1>
        <%
            BmBankManager m = (BmBankManager)request.getAttribute("manager");
        %>
        <p>
            Welcome, <%=m.getBFullname()%>
        </p>
        <br>
        <a href="view_transactions.jsp">View Transactions.</a>
    </body>
</html>
