<%-- 
    Document   : successPage
    Created on : 08 Apr 2025, 08:44:24
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amount Successfully Transferred</title>
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
                display: flex;
                flex-direction: column; /* Change to column for vertical stacking */
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
            .message {
                font-size: 20px; /* Increase font size for better visibility */
                margin: 20px 0; /* Add margin for spacing */
            }
            .home {
                font-size: 20px; /* Increase font size for better visibility */
                margin: 20px 0; /* Add margin for spacing */
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Transaction Status</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <%
                String msg = (String) request.getAttribute("successMessage");
            %>
            <p class="message"><b><%= msg %></b></p> <!-- Added class for styling -->
            <p class="home"><a href="customer_dashboard.jsp">Go to Dashboard</a></p>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Contact Support: support@yourbank.com | Phone: 123-456-7890
        </div>
    </body>
</html>