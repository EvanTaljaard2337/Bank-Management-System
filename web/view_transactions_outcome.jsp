<%-- 
    Document   : view_transactions_outcome
    Created on : 07 Apr 2025, 6:57:09 PM
    Author     : thand
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.BmTransaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Transactions Outcome Page</title>
    </head>
    <body>
        <h1>View Transactions outcome</h1>
        <%
            List<BmTransaction> transactions = (List<BmTransaction>)request.getAttribute("transactions");
        %>
        <p>
            Below are the transaction records you requested.
        </p>
        <table>
            <th>Transaction ID</th>
            <th>Account ID</th>
            <th>Transaction Type</th>
            <th>Amount</th>
            <th>Date</th>
            <%
                for(BmTransaction t : transactions) {
                    Integer tID = t.getBTransactionid();
                    Integer accID = t.getBAccountid().getBAccountid();
                    String tType = t.getBTransactiontype();
                    BigDecimal amount = t.getBAmount();
                    Date tDate = t.getBTransactiondate();
            %>
            <tr>
                <td><%=tID%></td>
                <td><%=accID%></td>
                <td><%=tType%></td>
                <td><%=amount%></td>
                <td><%=tDate%></td>
            </tr>
            <%
                }
            %>
        </table>
        <p>
            <a href="view_transactions.jsp">here</a> to go back.
            <br>
            <a href="login.html">here</a> to go back to the main page.
        </p>
    </body>
</html>
