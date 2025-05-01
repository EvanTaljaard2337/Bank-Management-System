<%-- 
    Document   : view_loans_outcome
    Created on : 07 Apr 2025, 8:08:49 PM
    Author     : thand
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="za.ac.tut.entities.BmLoan"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Loans Outcome Page</title>
    </head>
    <body>
        <h1>View loans outcome</h1>
        <%
            List<BmLoan> loans = (List<BmLoan>)request.getAttribute("filteredLoans");
        %>
        <p>
            Below are loans you requested.
        </p>
        <table>
            <th>Loan ID</th>
            <th>Customer ID</th>
            <th>Loan amount</th>
            <th>Interest rate</th>
            <th>Status</th>
            <%
                for(BmLoan l : loans){
                    Integer loanID = l.getBLoanid();
                    Integer custID = l.getBCustomerid().getBCustomerid();
                    BigDecimal amount = l.getBLoanamount();
                    BigDecimal interestRate = l.getBInterestrate();
                    String status = l.getBStatus();
            %>
            <tr>
                <td><%=loanID%></td>
                <td><%=custID%></td>
                <td><%=amount%></td>
                <td><%=interestRate%></td>
                <td><%=status%></td>
            </tr>
            <%
                }
            %>
        </table>
        <ul>
            <li><a href="index.html">Login page.</a></li>
            <li><a href="loanOfficerDashboard.jsp">Dashboard</a></li>
        </ul>
    </body>
</html>
