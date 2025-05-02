<%-- 
    Document   : deposit_outcome
    Created on : 02 May 2025, 15:39:41
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmAccount"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deposit Outcome</title>
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
                margin: 50px auto;
                padding: 20px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                text-align: center;
            }
            h1 {
                color: #333;
            }
            p {
                font-size: 18px;
                margin: 20px 0;
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
            <h1>Deposit Outcome</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <%
                BmAccount accountDes = (BmAccount)request.getAttribute("accountName");
            %>
            <h1>Deposit Successful!</h1>
            <p>Money successfully deposited to <b><%= accountDes.getBAccounttype() %></b> account.</p>
            <p><a href="customer_dashboard.jsp">Go to Home Page</a></p>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Contact Support: support@yourbank.com | Phone: 123-456-7890
        </div>
    </body>
</html>