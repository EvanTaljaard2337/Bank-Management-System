<%-- 
    Document   : withdraw
    Created on : 01 May 2025, 13:51:18
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmAccount"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Withdraw Money</title>
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
            select,
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
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Withdraw Money</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <form action="withdrawFundsServlet.do" method="post">
                <label for="withdrawAccountId">From Account:</label>
                <select id="withdrawAccountId" name="withdrawAccountId" required>
                    <option value="">Select Account</option>
                    <%
                        List<BmAccount> accounts = (List<BmAccount>)request.getAttribute("accountTypes");
                        if (accounts != null && !accounts.isEmpty()) {
                            for (BmAccount acc : accounts) {
                    %>
                        <option value="<%= acc.getBAccountid() %>"><%= acc.getBAccounttype() %></option>
                    <%
                            }
                        } else {
                    %>
                        <option value="">No Accounts Available</option>
                    <%
                        }
                    %>
                </select>
                
                <label for="withdrawAmount">Amount:</label>
                <input type="number" id="withdrawAmount" name="withdrawAmount" required>
                
                <input type="submit" value="Withdraw Money">
            </form>
        </div>
    </body>