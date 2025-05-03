<%-- 
    Document   : update_complaint_status
    Created on : 07 Apr 2025, 10:35:17 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Complaint Status</title>
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
                max-width: 600px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 30px;
            }
            .form-title {
                margin-top: 0;
                color: #333;
            }
            .form-instruction {
                font-size: 16px;
                margin-bottom: 20px;
                color: #555;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                color: #333;
            }
            .form-group input[type="text"],
            .form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }
            .form-group select {
                height: 40px;
            }
            .submit-btn {
                background: #007BFF;
                color: white;
                border: none;
                padding: 12px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                width: 100%;
                transition: background-color 0.3s;
            }
            .submit-btn:hover {
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
            <h1>Update Complaint Status</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <h2 class="form-title">Update Complaint Status</h2>
            <p class="form-instruction">Provide complaint ID of the complaint to update.</p>
            <form action="UpdateComplaintStatusServlet.do" method="POST">
                <div class="form-group">
                    <label for="id">Complaint ID:</label>
                    <input type="text" name="id" id="id" required/>
                </div>
                <div class="form-group">
                    <label for="status">Choose status:</label>
                    <select name="status" id="status">
                        <option value="Pending">Pending</option>
                        <option value="Resolved">Resolved</option>
                        <option value="Open">Open</option>
                        <option value="In progess">In progress</option>
                    </select>
                </div>
                <input type="submit" value="UPDATE" class="submit-btn"/>
            </form>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Customer Support
        </div>
    </body>
</html>