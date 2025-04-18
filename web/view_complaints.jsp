<%-- 
    Document   : view_complaints
    Created on : 07 Apr 2025, 9:57:25 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Complaints Page</title>
    </head>
    <body>
        <h1>View complaints</h1>
        <p>
            Filter the list by selecting an option below.
        </p>
        <form action="ViewComplaintsServlet.do" method="GET">
            <table>
                <tr>
                    <td>Filter By: </td>
                    <td>
                        <select name="filter">
                            <option value="pending">Pending</option>
                            <option value="resolved">Resolved</option>
                            <option value="open">Open</option>
                            <option value="in progress">In progress</option>
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
