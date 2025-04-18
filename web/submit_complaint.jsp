<%-- 
    Document   : submit_complaint
    Created on : 07 Apr 2025, 18:11:57
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit a Complaint</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 90%;
                max-width: 500px;
            }
            h1 {
                color: #007BFF;
                margin-bottom: 20px;
                text-align: center;
            }
            label {
                display: block;
                margin: 10px 0 5px;
                color: #333;
            }
            textarea {
                width: 100%;
                height: 150px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: none;
            }
            button {
                background-color: #007BFF;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                font-size: 16px;
            }
            button:hover {
                background-color: #0056b3;
            }
            .back-link {
                text-align: center;
                margin-top: 15px;
            }
            .back-link a {
                color: #007BFF;
                text-decoration: none;
                font-weight: bold;
            }
            .back-link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Submit a Complaint</h1>
            <form action="processComplaintServlet.do" method="post">
                <label for="customerName">Your Name:</label>
                <input type="text" id="customerName" name="customerName" required>

                <label for="complaintDetails">Complaint Details:</label>
                <textarea id="complaintDetails" name="complaintDetails" required></textarea>

                <button type="submit">Submit Complaint</button>
            </form>
            <div class="back-link">
                <a href="customer_dashboard.jsp">Back to Dashboard</a>
            </div>
        </div>
    </body>
</html>
