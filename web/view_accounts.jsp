<%@page import="za.ac.tut.entities.BmAccount"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Accounts</title>
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
                flex-grow: 1; /* Allow the title to take up available space */
                text-align: center; /* Center the title */
            }

        .header form {
            margin: 0;
        }

        .header-logout {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border: 1px solid white;
            border-radius: 4px;
            background: #007BFF;
            transition: background-color 0.3s;
            font-size: 14px;
            cursor: pointer;
        }

        .header-logout:hover {
            background-color: rgba(255,255,255,0.2);
        }

        .container {
            max-width: 500px;
            margin: 30px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #007BFF;
            font-size: 26px;
            margin-bottom: 30px;
        }

        form label {
            font-weight: bold;
            color: #555;
            margin-top: 15px;
            display: block;
            font-size: 16px;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 16px;
        }

        button {
            background: #007BFF;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 30px;
            transition: background-color 0.3s;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: white;
            padding: 12px;
        }

        td {
            padding: 10px;
            text-align: center;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background: #007BFF;
            color: white;
            font-size: 14px;
            margin-top: 40px;
        }

        .no-data {
            text-align: center;
            margin-top: 30px;
            font-size: 18px;
            color: #777;
        }
        /* Wrap the form in a narrower centered container */
        .form-wrapper {
            max-width: 400px;
            margin: 0 auto;
        }

        /* Limit dropdown width */
        form select {
            width: 100%;
            max-width: 100%; /* Match form width */
        }

        /* Center the button */
        form button {
            display: block;
            margin: 30px auto 0 auto; /* top margin + auto center horizontally */
        }
            .header-btn {
                color: white;
                text-decoration: none;
                font-weight: bold;
                padding: 8px 15px;
                border: 1px solid white;
                border-radius: 4px;
                transition: background-color 0.3s;
                margin-left: 10px; /* Add some space between the title and the button */
            }

            .header-btn:hover {
                background-color: rgba(255,255,255,0.2);
            }
    </style>
</head>
<body>
    <div class="header">
        <a href="bankManagerDashboard.jsp" class="header-btn">Home</a>
        <h1>View Bank Accounts</h1>
        <form action="logoutServlet.do" method="post">
            <input type="submit" value="Logout" class="header-logout">
        </form>
    </div>
    <div class="container">
        <h2>Select Account Type to View</h2>

        <div class="form-wrapper">
            <form action="ViewAccountsServlet.do" method="get">
                <label for="accountType">Account Type</label>
                <select id="accountType" name="accountType">
                    <option value="">All Accounts</option>
                    <option value="savings">Savings Account</option>
                    <option value="checking">Checking Account</option>
                    <option value="business">Business Account</option>
                    <option value="investment">Investment Account</option>
                </select>
                <button type="submit">View Accounts</button>
            </form>
        </div>

    </div>

    <div class="footer">
        &copy; 2025 Your Bank Name | Manager Portal
    </div>
</body>
</html>
