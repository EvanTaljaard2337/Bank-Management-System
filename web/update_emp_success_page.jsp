<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Success</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e9f0f7;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 100px auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 40px;
            text-align: center;
        }

        h2 {
            color: #007BFF;
            font-size: 24px;
            margin-bottom: 30px;
        }

        .btn {
            background: #007BFF;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            transition: background-color 0.3s;
            display: inline-block;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .footer {
            text-align: center;
            margin-top: 50px;
            color: #888;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2><%= request.getAttribute("message") %></h2>
    <a href="bankManagerDashboard.jsp" class="btn">Return to Dashboard</a>
</div>

<div class="footer">
    &copy; 2025 YourBank Inc. All rights reserved.
</div>

</body>
</html>
