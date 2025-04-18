<%-- 
    Document   : view_transactions
    Created on : 07 Apr 2025, 6:27:25 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Transactions Page</title>
    </head>
    <body>
        <h1>View transactions</h1>
        <p>
            Filter the list by selecting an option below.
        </p>
        <form action="ViewTransactionsServlet.do" method="GET">
            <table>
                <tr>
                    <td>Filter By: </td>
                    <td>
                        <select name="filter">
                            <option value="ID">ID</option>
                            <option value="Max amount">Max amount</option>
                            <option value="View all">View All</option>
                        </select>
                    </td>
                <tr>
                    <td>Provide filter value: </td>
                    <td><input type="text" name="filter_val" required/></td>
                </tr>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="VIEW"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
