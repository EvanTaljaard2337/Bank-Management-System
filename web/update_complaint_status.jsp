<%-- 
    Document   : update_complaint_status
    Created on : 07 Apr 2025, 10:35:17 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Complaint Status Page</title>
    </head>
    <body>
        <h1>Update Complaint Status</h1>
        <p>
            Provide complaint id of the loan to update.
        </p>
        <form action="UpdateComplaintStatusServlet.do" method="POST">
            <table>
                <tr>
                    <td>Complaint ID: </td>
                    <td><input type="text" name="id" required/></td>
                </tr>
                <tr>
                    <td>Choose status: </td>
                    <td>
                        <select name="status">
                            <option value="Pending">Pending</option>
                            <option value="Resolved">Resolved</option>
                            <option value="Open">Open</option>
                            <option value="In progess">In progress</option>
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
