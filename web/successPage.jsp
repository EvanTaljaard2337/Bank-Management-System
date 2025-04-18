<%-- 
    Document   : successPage
    Created on : 08 Apr 2025, 08:44:24
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amount successfully transferred</title>
    </head>
    <body>
        <h1>Your transaction successful</h1>
        <%
            String msg=(String)request.getAttribute("successMessage");
        %>
        <p><b><%=msg%></b></p>
        <p><a href="customer_dashboard.jsp">Home</a></p>
    </body>
</html>
