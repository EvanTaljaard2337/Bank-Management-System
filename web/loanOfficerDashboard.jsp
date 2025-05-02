<%-- 
    Document   : loanOfficerDashboard
    Created on : 05 Apr 2025, 21:07:45
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmLoanOfficer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Officer DashBoard</title>
    </head>
    <body>
        <%
            BmLoanOfficer l = (BmLoanOfficer)session.getAttribute("officer");
        %>
        <h1>Welcome, <%=l.getBFullname()%></h1>
        <p>
            Click <a href="view_loans.jsp">here</a> to view loans.
            <br>
            Click <a href="update_loan_status.jsp">here</a> to update loan status.
            <br>
            Click <a href="count_loans.jsp">here</a> to count loans.
            
        </p>
        <br>
        <p>
            Click below to view Loan report.
        </p>
        <form action="LoanReportServlet.do" method="POST">
            <table>
                <tr>
                    <td><input type="submit" value="VIEW REPORT"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
