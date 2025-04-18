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
        %>
        <p>
            Below is the updated loan and the new status.
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
    </body>
</html>
