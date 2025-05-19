<%@ page import="za.ac.tut.ejb.bl.PasswordResetServiceFacadeLocal, za.ac.tut.entities.PasswordResetService" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.util.Date" %>
<%
    String token = request.getParameter("token");
    String error = null;
    boolean validToken = false;

    try {
        if (token == null || token.trim().isEmpty()) {
            throw new Exception("Missing token");
        }

        InitialContext ctx = new InitialContext();
        PasswordResetServiceFacadeLocal service = (PasswordResetServiceFacadeLocal)
            ctx.lookup("java:global/BMSWebApplication/PasswordResetServiceFacade!za.ac.tut.ejb.bl.PasswordResetServiceFacadeLocal");
        PasswordResetService reset = service.findByToken(token);

        if (reset != null && reset.getCreatedTime() != null) {
            long age = new Date().getTime() - reset.getCreatedTime().getTime();
            if (age <= 30 * 60 * 1000) {
                validToken = true;
            } else {
                error = "This reset link has expired.";
            }
        } else {
            error = "Invalid or expired reset token.";
        }
    } catch (Exception e) {
        error = "Server error: " + e.getClass().getName() + " - " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            background-color: #fff;
            margin: 80px auto;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        h2 {
            color: #007BFF;
            margin-bottom: 25px;
            font-size: 24px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .error {
            color: red;
            background: #ffe6e6;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        button {
            background-color: #007BFF;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }
        button:hover {
            background-color: #0056b3;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            color: #888;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="container">
    <% if (error != null) { %>
        <div class="error"><%= error %></div>
    <% } else if (validToken) { %>
        <h2>Reset Your Password</h2>
        <form action="ResetPasswordServlet.do" method="POST">
            <input type="hidden" name="token" value="<%= token %>">
            <label>New Password:</label>
            <input type="password" name="password" required>
            <button type="submit">Update Password</button>
        </form>
    <% } %>
</div>

<div class="footer">
    &copy; 2025 Your Bank Name | support@yourbank.com
</div>

</body>
</html>
