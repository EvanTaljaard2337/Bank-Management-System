<%-- 
    Document   : supportAgentDashboard
    Created on : 05 Apr 2025, 21:08:15
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmCustomerSupportAgent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Support</title>
    </head>
    <body>
        <%
            BmCustomerSupportAgent cs = (BmCustomerSupportAgent)session.getAttribute("support");
        %>
        <h1>Welcome, <%=cs.getBFullname()%></h1>
        <ol>
            <li><a href="view_complaints.jsp">View complaints</a></li>
            <li><a href="update_complaint_status.jsp">Update complaint</a></li>
        </ol>
    </body>
</html>
