<%-- 
    Document   : view_transactions
    Created on : 07 Apr 2025, 6:27:25 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Transactions</title>
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
                max-width: 600px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 30px;
            }
            .form-title {
                margin-top: 0;
                color: #333;
            }
            .form-instruction {
                font-size: 16px;
                margin-bottom: 20px;
                color: #555;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                color: #333;
            }
            .form-group select,
            .form-group input[type="text"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }
            .form-group select {
                height: 40px;
            }
            .submit-btn {
                background: #007BFF;
                color: white;
                border: none;
                padding: 12px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                width: 100%;
                transition: background-color 0.3s;
            }
            .submit-btn:hover {
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
            <h1>Transaction Records</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <h2 class="form-title">Filter Transactions</h2>
            <p class="form-instruction">Filter the list by selecting an option below.</p>
            <form action="ViewTransactionsServlet.do" method="GET">
                <div class="form-group">
                    <label for="filter">Filter By:</label>
                    <select name="filter" id="filter">
                        <option value="ID">ID</option>
                        <option value="Max amount">Max amount</option>
                        <option value="View all">View All</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="filter_val">Provide filter value:</label>
                    <input type="text" name="filter_val" id="filter_val" required/>
                </div>
                <input type="submit" value="VIEW" class="submit-btn"/>
            </form>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Bank Management
        </div>
    </body>
</html>