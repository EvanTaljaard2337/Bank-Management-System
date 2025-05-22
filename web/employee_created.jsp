<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee Created</title>
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
            text-align: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }
        .container {
            max-width: 700px;
            margin: 40px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 40px;
            text-align: center;
        }
        h2 {
            color: #007BFF;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #333;
        }
        .action-link {
            color: white;
            background: #007BFF;
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 5px;
            font-weight: bold;
            font-size: 16px;
            display: inline-block;
            transition: background-color 0.3s;
        }
        .action-link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Employee Registration</h1>
    </div>

    <div class="container">
        <%
            String message = (String)request.getAttribute("message");
        %>
        <h2>Success!</h2>
        <p><%= message != null ? message : "Employee added successfully." %></p>
        <a href="bankManagerDashboard.jsp" class="action-link">Return to Dashboard</a>
    </div>
</body>
</html>
