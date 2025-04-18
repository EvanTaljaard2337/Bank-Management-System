<%-- 
    Document   : error
    Created on : 05 Apr 2025, 21:14:18
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Exception Occured</title>
    </head>
    <body>
        <h1>Error Occured</h1>
        <%
            String errMsg = (String)request.getAttribute("errMsg");
        %>
        <p>Debugger Logs:</p>
        <p><b><%=errMsg%></b></p>
    </body>
</html>
