<%-- 
    Document   : registerUser
    Created on : 05 Apr 2025, 14:28:02
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register User Account</title>
                <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 50%;
                margin: 50px auto;
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #333;
            }
            table {
                width: 100%;
                margin-top: 20px;
            }
            td {
                padding: 10px;
                vertical-align: top;
            }
            input[type="text"], input[type="email"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #007BFF;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                width: 100%;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            @media (max-width: 600px) {
                .container {
                    width: 90%;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Welcome to Uni Bank</h1>
            <p>Please fill in the details below to create an account</h1></p>
            <form action="RegisterServlet.do" method="POST">
                <table>
                    <tbody>
                        <tr>
                            <td>Full Name:</td>
                            <td><input type="text" name="fullName" required="" /></td>
                        </tr>
                        <tr>
                            <td>ID:</td>
                            <td><input type="text" name="id" required="" /></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" name="email" required="" /></td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td><input type="text" name="address" required="" /></td>
                        </tr>
                        <tr>
                            <td>Phone Number:</td>
                            <td><input type="text" name="phone" required="" /></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="text" name="password" required="" /></td>
                        </tr>
                         <tr>
                            <td></td>
                            <td><input type="submit" value="SUBMIT" /></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
