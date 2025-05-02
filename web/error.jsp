<%-- 
    Document   : error
    Created on : 05 Apr 2025, 21:14:18
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Occurred</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .header {
                background: #dc3545; /* Red color for error */
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
                display: flex;
                max-width: 800px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 40px;
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
            .error-message {
                color: #dc3545; /* Red color for error messages */
                font-size: 18px;
                margin-top: 20px;
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
            <%
                String errMsg = (String) request.getAttribute("errMsg");
            %>
            <p class="error-message">Debugger Logs:</p>
            <p><b><%= errMsg %></b></p>
            <p><a href="customer_dashboard.jsp">Go to Dashboard</a></p>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Contact Support: support@yourbank.com | Phone: 123-456-7890
        </div>
    </body>
</html>
