<%-- 
    Document   : adminDashboard
    Created on : 05 Apr 2025, 21:07:57
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmSystemAdministrator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin DashBoard</title>
    </head>
    <body>
        <h1>Administrative DashBoard</h1>
            <%
                BmSystemAdministrator c = (BmSystemAdministrator)request.getAttribute("admin");   
            %>
            <h1>Welcome <b><%=c.getBFullname()%></b>!!</h1>
            <p>Click <a href="perform_backup.jsp">here</a> to perform backup.</p>
            <p>Click <a href="index.html">here</a> to go back to the home page</p>
    </body>
</html>
