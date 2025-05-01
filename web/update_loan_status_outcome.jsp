<%-- 
    Document   : update_loan_status_outcome
    Created on : 07 Apr 2025, 9:22:51 PM
    Author     : thand
--%>

<%@page import="za.ac.tut.entities.BmLoan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Loan Status Outcome Page</title>
    </head>
    <body>
        <h1>Update Loan Status outcome</h1>
        <%
            BmLoan loan = (BmLoan)request.getAttribute("loan");
            String updateResult = (String)request.getAttribute("updateResult");
        %>
        <p>
            <%=updateResult%>
        </p>
        <table>
            <th>Loan ID</th>
            <th>Customer ID</th>
            <th>Loan amount</th>
            <th>Interest rate</th>
            <th>Status</th>
            <tr>
                <td><%=loan.getBLoanid()%></td>
                <td><%=loan.getBCustomerid().getBCustomerid()%></td>
                <td><%=loan.getBLoanamount()%></td>
                <td><%=loan.getBInterestrate()%></td>
                <td><%=loan.getBStatus()%></td>
            </tr>
        </table>
        <ul>
            <li><a href="index.html">Login page.</a></li>
            <li><a href="loanOfficerDashboard.jsp">Dashboard</a></li>
        </ul>
    </body>
</html>
