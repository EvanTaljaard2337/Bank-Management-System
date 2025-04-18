<%-- 
    Document   : complaint
    Created on : 07 Apr 2025, 18:03:14
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Complaints Page</title>
    </head>
    <body>
        <h1>Complaints Dash Board</h1>
        <form action="ViewComplaintStatusServlet.do" method="POST">
            <table>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="View Complaints" /></td>
                    </tr>
            </table>
        </form>
        <p><a href="submit_complaint.jsp">Submit Complaint</a></p>
    </body>
</html>
