<%-- 
    Document   : delete_user_account
    Created on : 05 Apr 2025, 14:25:24
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmCustomer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User Account</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .header {
                background: #007BFF;
                color: white;
                padding: 15px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 6px rgba(0,0,0,0.2);
            }
            .header h1 {
                margin: 0;
                font-size: 24px;
            }
            .header a {
                color: white;
                text-decoration: none;
                font-weight: bold;
                padding: 8px 15px;
                border: 1px solid white;
                border-radius: 4px;
                transition: background-color 0.3s;
            }
            .header a:hover {
                background-color: rgba(255,255,255,0.2);
            }
            .container {
                max-width: 800px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 30px;
                text-align: center;
            }
            .success-message {
                font-size: 18px;
                padding: 20px;
                background: #f0f8ff;
                border-radius: 5px;
                margin-bottom: 30px;
            }
            .highlight {
                color: #007BFF;
                font-weight: bold;
            }
            .return-link {
                display: inline-block;
                background: #007BFF;
                color: white;
                text-decoration: none;
                padding: 12px 25px;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .return-link:hover {
                background-color: #0056b3;
            }
            .footer {
                text-align: center;
                padding: 20px;
                background: #007BFF;
                color: white;
                font-size: 14px;
                margin-top: 40px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Account Removal</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <%
                String msg = (String)request.getAttribute("message");
            %>
            <div class="success-message">
                <p>The user with ID <span class="highlight"><%=msg%></span> has been successfully removed from the database.</p>
            </div>
            <a href="index.html" class="return-link">Return to Home Page</a>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Admin Support
        </div>
    </body>
</html>