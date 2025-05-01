<%-- 
    Document   : count_loans_outcome
    Created on : 30 Apr 2025, 9:06:28 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Count Loans Outcome Page</title>
    </head>
    <body>
        <h1>Count Loans Outcome</h1>
        <%
            Integer cnt = (Integer)request.getAttribute("cnt");
            String filter = (String)request.getAttribute("filter");
        %>
        <%
            if(filter.equalsIgnoreCase("all")){
                
        %>
        <p>
            There are <b><%=cnt%><b> loans in total.
        </p>
        <%
            }else{

        %>
        <p>There are <b><%=cnt%> <%=filter%></b> loans in total.</p>
        <%
            }
        %>
        <br>
        <ul>
            <li><a href="index.html">Login page.</a></li>
            <li><a href="loanOfficerDashboard.jsp">Dashboard</a></li>
        </ul>
    </body>
</html>
