<%-- 
    Document   : count_loans
    Created on : 30 Apr 2025, 8:40:30 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Count Loans Page</title>
    </head>
    <body>
        <h1>Count Loans</h1>
        <p>Choose filter value for counting the loans</p>
        <form action="CountLoansServlet.do" method="POST">
            <table>
                <tr>
                    <td>Choose filter: </td>
                    <label>
                        <input type="radio" name="count_filter" value="all" /> All
                    </label>
                    <label>
                        <input type="radio" name="count_filter" value="Approved" /> Approved
                    </label>
                    <label>
                        <input type="radio" name="count_filter" value="Rejected" /> Rejected
                    </label>
                    <label>
                        <input type="radio" name="count_filter" value="Pending" /> Pending
                    </label>

                </tr>
                <tr>
                    <td><input type="submit" value="COUNT"/></td>
                </tr>
            </table>
        </form>
        <ul>
            <li><a href="index.html">Login page.</a></li>
            <li><a href="loanOfficerDashboard.jsp">Dashboard</a></li>
        </ul> 
    </body>
</html>
