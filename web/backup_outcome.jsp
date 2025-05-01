<%-- 
    Document   : backup_outcome
    Created on : 29 Apr 2025, 2:10:25 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Backup Outcome Page</title>
    </head>
    <body>
        <h1>Backup Outcome</h1>
        <%
            String outcome = (String)request.getAttribute("backupStatus");
        %>
        <p>
            <%=outcome%>
        </p>
        <p>
            Click<a href="adminDashboard">here</a> to go the dashboard.
        </p>
    </body>
</html>
