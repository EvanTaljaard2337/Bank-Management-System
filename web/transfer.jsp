<%-- 
    Document   : transfer
    Created on : 07 Apr 2025, 18:03:04
    Author     : Evan
--%>
<%@page import="za.ac.tut.entities.BmCustomer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transactions Page</title>
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
                padding: 20px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
            h1 {
                text-align: center;
                color: #333;
            }
            h2 {
                color: #555;
                margin-top: 20px;
            }
            form {
                background-color: #f9faff;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 20px;
                margin: 20px auto;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
            }
            input[type="text"],
            input[type="number"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type="submit"] {
                background-color: #28a745;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }
            input[type="submit"]:hover {
                background-color: #218838;
            }
            .view-history-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                font-weight: bold; 
                font-size: 18px;
                color: #007bff;
                text-decoration: none;
            }
            .view-history-link:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Transactions Page</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <div class="use-case">
                <h2>Transfer Funds</h2>
                <form action="transferFundsServlet.do" method="post">
                    <label for="fromAccountId">From Account ID:</label>
                    <input type="text" id="fromAccountId" name="fromAccountId" required>
                    
                    <label for="toAccountId">To Account ID:</label>
                    <input type="text" id="toAccountId" name="toAccountId" required>
                    
                    <label for="amount">Amount:</label>
                    <input type="number" id="amount" name="amount" required>
                    
                    <input type="submit" value="Transfer Funds">
                </form>
            </div>
        </div>
    </body>
</html>

