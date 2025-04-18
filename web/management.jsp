<%-- 
    Document   : management
    Created on : 05 Apr 2025, 13:38:41
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                margin-bottom: 20px;
            }
            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                margin: 0 auto;
            }
            table {
                width: 100%;
                margin: 0;
            }
            td {
                padding: 10px;
                text-align: left;
            }
            input[type="text"] {
                width: calc(100% - 20px);
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }
            input[type="submit"] {
                background-color: #007BFF;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
                width: 100%;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <h1>Remove User</h1>
        <form action="RemoveCustomerServlet.do" method="POST">
            <table>
                    <tr>
                        <td>Insert User ID:</td>
                        <td><input type="text" name="userID" required="please fill in the User ID" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="SUBMIT"/></td>
                    </tr>
            </table>
        </form>
    </body>
</html>
