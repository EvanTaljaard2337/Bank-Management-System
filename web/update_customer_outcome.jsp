<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Outcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f8fb;
            padding: 50px;
            text-align: center;
        }

        h1 {
            color: #2c3e50;
            font-size: 32px;
        }

        .message-box {
            background-color: #ffffff;
            padding: 30px;
            margin: 0 auto;
            width: 50%;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .success-message {
            color: #27ae60;
            font-size: 20px;
            margin: 20px 0;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background-color: #3498db;
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <h1>Customer Update Result</h1>

        <%
            String msg = (String)request.getAttribute("successMsg");
            if (msg != null && !msg.isEmpty()) {
        %>
            <p class="success-message"><%= msg %></p>
        <%
            } else {
        %>
            <p class="success-message" style="color: red;">No message provided. Something may have gone wrong.</p>
        <%
            }
        %>

        <a href="bankManagerDashboard.jsp">← Back to Dashboard</a>
    </div>
</body>
</html>
