<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="za.ac.tut.entities.BmBankManager"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Activity Report</title>
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
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
        }
        .welcome-message {
            font-size: 20px;
            margin-bottom: 25px;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="date"],
        select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
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
        <h1>User Activity Report</h1>
        <a href="index.html">Logout</a>
    </div>
    <div class="container">
        <%
            BmBankManager m = (BmBankManager)session.getAttribute("manager");
        %>
        <h2 class="welcome-message">Welcome</h2>
        <p>Please fill out the form below to generate the user activity report.</p>
        
        <form action="UserActivityReportServlet.do" method="post">
            <label for="userId">User  ID:</label>
            <input type="text" id="userId" name="userId" required>

            <label for="activityType">Activity Type:</label>
            <select id="activityType" name="activityType" required>
                <option value="">Select Activity</option>
                <option value="login">Login</option>
                <option value="logout">Logout</option>
                <option value="data_entry">Data Entry</option>
                <option value="report_generation">Report Generation</option>
            </select>

            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" required>

            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" required>

            <input type="submit" value="Generate Report">
        </form>
        <script>
            window.onload = function() {
                const today = new Date().toISOString().split("T")[0];
                document.getElementById("startDate").setAttribute("max", today);
                document.getElementById("endDate").setAttribute("max", today);
            };
        </script>
    </div>
    <div class="footer">
        &copy; 2025 Your Bank Name | Manager Portal
    </div>
</body>
</html>