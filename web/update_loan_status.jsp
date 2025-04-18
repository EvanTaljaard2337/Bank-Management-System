<%-- 
    Document   : update_loan_status
    Created on : 07 Apr 2025, 8:58:28 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Loan Status Page</title>
    </head>
    <body>
        <h1>Update Loan Status</h1>
        <p>
            Provide loan id of the loan to update.
        </p>
        <form action="UpdateLoanStatusServlet.do" method="POST">
            <table>
                <tr>
                    <td>Loan ID: </td>
                    <td><input type="text" name="id" required/></td>
                </tr>
                <tr>
                    <td>Choose status: </td>
                    <td>
                        <select name="status">
                            <option value="approved">Approved</option>
                            <option value="rejected">Rejected</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="UPDATE"</td>
                </tr>
            </table>
        </form>
    </body>
</html>
