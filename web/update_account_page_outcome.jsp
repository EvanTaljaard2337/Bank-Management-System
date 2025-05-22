<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Outcome</title>
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
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .header-logout {
            color: white;
            background-color: #007BFF;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border: 1px solid white;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .header-logout:hover {
            background-color: rgba(255,255,255,0.2);
        }

        .container {
            max-width: 600px;
            margin: 100px auto;
            background: white;
            border-radius: 10px;
            padding: 40px 30px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #007BFF;
            margin-bottom: 20px;
        }

        .message {
            color: green;
            font-size: 18px;
            margin-bottom: 30px;
        }

        .back-link {
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 5px;
            font-weight: bold;
            font-size: 16px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
            transition: background-color 0.3s ease;
        }

        .back-link:hover {
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

        @media (max-width: 768px) {
            .container {
                margin: 60px 20px;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

<%
    BmBankManager m = (BmBankManager)session.getAttribute("manager");
    if (m == null || m.getBFullname() == null) {
        response.sendRedirect("index.html");
        return;
    }
    String message = (String)request.getAttribute("message");
%>

<div class="header">
    <h1>Welcome, <%= m.getBFullname() %></h1>
    <form action="logoutServlet.do" method="POST">
        <input type="submit" class="header-logout" value="Logout">
    </form>
</div>

<div class="container">
    <h2>Account Update Outcome</h2>
    <p class="message"><%= message %></p>
    <a class="back-link" href="bankManagerDashboard.jsp">Back to Dashboard</a>
</div>

<div class="footer">
    &copy; 2025 Your Bank Name | Bank Manager Portal
</div>

</body>
</html>
