<%-- 
    Document   : view_loans
    Created on : 07 Apr 2025, 7:52:27 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Loans Page</title>
    </head>
    <body>
        <h1>View Loans</h1>
        <p>
            Filter the list by selecting an option below.
        </p>
        <form action="ViewLoansServlet.do" method="GET">
            <table>
                <tr>
                    <td>Filter By: </td>
                    <td>
                        <select name="filter">
                            <option value="pending">Pending</option>
                            <option value="approved">Approved</option>
                            <option value="rejected">Rejected</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="VIEW"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
