<%@page import="za.ac.tut.entities.BmCustomer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Customer</title>
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

        h1 {
            color: white;
            margin: 0;
        }

        .form-container {
            width: 100%;
            max-width: 600px;
            margin: 30px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin: 15px 0 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        input[type="submit"],
        .back-button,
        .action-button {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover,
        .back-button:hover,
        .action-button:hover {
            background-color: #0056b3;
        }

        .error-message {
            text-align: center;
            color: red;
            font-weight: bold;
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
        <h1>Update Customer Details</h1>
    </div>

    <%
        BmCustomer customer = (BmCustomer)request.getAttribute("customer");
        if (customer != null) {
    %>
    <div class="form-container">
        <form action="UpdateCustomerServlet.do" method="POST">
            <input type="hidden" name="customerId" value="<%= customer.getBCustomerid() %>" />

            <label for="fullName">Full Name:</label>
            <input type="text" name="fullName" id="fullName" value="<%= customer.getBFullname() %>" required />

            <label for="email">Email:</label>
            <input type="email" name="email" id="email" value="<%= customer.getBEmail() %>" required />

            <label for="address">Address:</label>
            <input type="text" name="address" id="address" value="<%= customer.getBAddress() %>" required />

            <label for="phone">Phone:</label>
            <input type="text" name="phone" id="phone" value="<%= customer.getBPhone() %>" required />

            <div class="button-container">
                <button type="submit" class="action-button">Update Customer</button>
                <button type="button" class="action-button" onclick="window.location.href='bankManagerDashboard.jsp'">Back to Dashboard</button>
            </div>

        </form>
    </div>
    <% } else { %>
        <div class="form-container">
            <p class="error-message">Customer not found. Please return to the dashboard.</p>
            <div class="button-container">
                <button type="button" class="back-button" onclick="window.location.href='bankManagerDashboard.jsp'">Back to Dashboard</button>
            </div>
        </div>
    <% } %>
    <div class="footer">
        &copy; 2025 Your Bank Name | Manager Portal
    </div>
</body>
</html>