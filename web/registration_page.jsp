<%-- 
    Document   : registration_page
    Created on : 05 Apr 2025, 18:20:09
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
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
            .header h1 {
                margin: 0;
                font-size: 24px;
            }
            .container {
                max-width: 500px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 30px;
            }
            .error-message {
                color: #dc3545;
                background-color: #f8d7da;
                border: 1px solid #f5c6cb;
                padding: 10px;
                border-radius: 4px;
                margin-bottom: 20px;
                text-align: center;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group input {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 16px;
            }
            .form-group input:focus {
                border-color: #007BFF;
                outline: none;
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
            <h1>New User Registration</h1>
        </div>
        <div class="container">
            <c:if test="${not empty errorMessage}">
                <div class="error-message">
                    ${errorMessage}
                </div>
            </c:if>
            <form action="RegisterServlet" method="POST">
                <div class="form-group">
                    <input type="text" name="fullName" placeholder="Full Name" required />
                </div>
                <div class="form-group">
                    <input type="text" name="id" placeholder="User ID" required />
                </div>
                <div class="form-group">
                    <input type="email" name="email" placeholder="Email" required />
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Password" required />
                </div>
                <div class="form-group">
                    <input type="text" name="address" placeholder="Address" required />
                </div>
                <div class="form-group">
                    <input type="text" name="phone" placeholder="Phone" required />
                </div>
                <input type="submit" value="Register" class="submit-btn"/>
            </form>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Customer Support
        </div>
    </body>
</html>