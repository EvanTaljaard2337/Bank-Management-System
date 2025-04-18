<%-- 
    Document   : findUser
    Created on : 05 Apr 2025, 16:03:29
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find User Account</title>
         <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }
            h1 {
                color: #333;
                text-align: center;
            }
            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                margin: 20px auto;
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
        <h1>Find your account</h1>
        <form action="FindCustomerServlet.do" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td>Insert Customer ID</td>
                        <td><input type="text" name="custId" required="" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="FIND" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
