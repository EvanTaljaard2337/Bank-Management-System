<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Employee Outcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            padding: 40px;
            text-align: center;
        }

        .container {
            background-color: #f9f9f9;
            padding: 40px;
            margin: auto;
            width: 50%;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            color: #333333;
            margin-bottom: 30px;
        }

        .back-button {
            background-color: #007BFF;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Employee Deletion Outcome</h1>
        <%
            BmBankManager m = (BmBankManager)session.getAttribute("manager");
            String message = (String)request.getAttribute("message");
        %>
        <p><%= message %></p>

        <a href="bankManagerDashboard.jsp" class="back-button">Back to Dashboard</a>
    </div>
</body>
</html>
