<%-- 
    Document   : find_number_of_loans_outcome
    Created on : 30 Apr 2025, 5:15:00 PM
    Author     : thand
--%>

<%@page import="za.ac.tut.entities.BmLoan"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find a Number Of Loans Page</title>
    </head>
    <body>
        <h1>Find a Number Of Loans</h1>
        <%
            List<BmLoan> loans = (List<BmLoan>)request.getAttribute("loans");
        %>
        <p>
            Below the limited list of loans requested.
        </p>
        <table>
            <th>Customer Name</th>
            <th>Loan Amount</th>
            <th>Interest Rate</th>
            <th>Status</th>
            <%
                for(BmLoan l : loans) {
                    String name = l.getBCustomerid().getBFullname();
                    Integer amount = l.getBLoanamount().intValue();
                    Double interestRate = l.getBInterestrate().doubleValue();
                    String status = l.getBStatus();
            %>
            <tr>
                <td><%=name%></td>
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
