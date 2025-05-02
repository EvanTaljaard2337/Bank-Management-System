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
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            form {
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 20px;
                margin: 20px auto;
                max-width: 400px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            input[type="submit"] {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
                width: 100%;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            p {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>Complaints Dashboard</h1>
        <%
            String customerId=request.getParameter("customerId");
        %>
        <form action="ViewComplaintStatusServlet.do" method="POST">
            <table style="width: 100%;">
                <tr>
                    <td></td>
                    <td><input type="submit" value="View Complaints" /></td>
                </tr>
            </table>
        </form>

        <form action="submit_complaint.jsp" method="POST">
            <table style="width: 100%;">
                <tr>
                    <input type="hidden" name="customerId" value="<%= customerId %>">
                    <td><input type="submit" value="Submit Complaint" /></td>
                </tr>
            </table>
        </form>

    </body>
</html>