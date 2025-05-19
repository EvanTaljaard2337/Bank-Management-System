<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Error Occurred</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }
        .header {
            background: #dc3545; /* Red color for error */
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
            max-width: 700px;
            margin: 40px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 40px 50px;
            text-align: center;
        }
        .container h2 {
            color: #c0392b;
            margin-bottom: 25px;
            font-size: 28px;
            font-weight: 700;
        }
        .error-message {
            color: #dc3545; /* Red color for error messages */
            font-size: 18px;
            margin-bottom: 10px;
            font-weight: 600;
        }
        .error-details {
            font-size: 16px;
            color: #2c3e50;
            margin-bottom: 30px;
            word-wrap: break-word;
            white-space: pre-wrap;
        }
        .dashboard-link {
            display: inline-block;
            background-color: #007BFF;
            color: white;
            padding: 12px 25px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .dashboard-link:hover {
            background-color: #0056b3;
        }
        .footer {
            text-align: center;
            padding: 20px;
            background: #007BFF;
            color: white;
            font-size: 14px;
            margin-top: 60px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Error Page</h1>
        <a href="index.html">Logout</a>
    </div>

    <div class="container">
        <h2>An Error Occurred</h2>
        <p class="error-message">Debugger Logs:</p>
        <%
            String errMsg = (String) request.getAttribute("errMsg");
            if (errMsg == null || errMsg.trim().isEmpty()) {
                errMsg = "No additional error information provided.";
            }
        %>
        <p class="error-details"><b><%= errMsg %></b></p>
        <a class="dashboard-link" href="customer_dashboard.jsp">Go to Dashboard</a>
    </div>

    <div class="footer">
        &copy; 2025 Your Bank Name | Contact Support: support@yourbank.com | Phone: 123-456-7890
    </div>
</body>
</html>
