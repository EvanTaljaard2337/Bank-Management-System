<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Account</title>
    <style>
        /* Use your existing styles or keep this minimal for now */
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
                flex-grow: 1; /* Allow the title to take up available space */
                text-align: center; /* Center the title */
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
            max-width: 500px;
            margin: 30px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
        }
        form label {
            font-weight: bold;
            color: #555;
            margin-top: 15px;
            display: block;
            font-size: 16px;
        }
        form input[type="text"], 
        form select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 16px;
        }
        .buttons {
            margin-top: 30px;
        }
        .buttons input[type="submit"], 
        .buttons input[type="reset"] {
            background: #007BFF;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            margin-right: 15px;
            transition: background-color 0.3s;
            font-size: 16px;
        }
        .buttons input[type="submit"]:hover,
        .buttons input[type="reset"]:hover {
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
        h2 {
            text-align: center;
            color: #007BFF;
            font-size: 26px;
            margin-bottom: 30px;
        }
            .header-btn {
                color: white;
                text-decoration: none;
                font-weight: bold;
                padding: 8px 15px;
                border: 1px solid white;
                border-radius: 4px;
                transition: background-color 0.3s;
                margin-left: 10px; /* Add some space between the title and the button */
            }

            .header-btn:hover {
                background-color: rgba(255,255,255,0.2);
            }
            .submit-btn {
                background: #007BFF;
                color: white;
                border: none;
                padding: 12px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                width: 40%;
                transition: background-color 0.3s;
            }
            .submit-btn:hover {
                background-color: #0056b3;
            }
            .button-wrapper {
                display: flex;
                justify-content: center; /* Center the button horizontally */
                margin-top: 20px; /* Optional: Add some space above the button */
            }            
    </style>
</head>
<body>
    <%
        BmBankManager manager = (BmBankManager)session.getAttribute("manager");
        if (manager == null || manager.getBFullname() == null) {
            response.sendRedirect("index.html"); // redirect if not logged in
            return;
        }
    %>
    <div class="header">
        <a href="bankManagerDashboard.jsp" class="header-btn">Home</a>
        <h1>Add New Account</h1>
        <a href="index.html">Logout</a>
    </div>
    <div class="container">
        <h2>Add new Customer Account</h2>
        <form action="createAccount.do" method="post">
            <label for="customerNumber">Customer Number</label>
            <input type="text" id="customerId" name="customerId" placeholder="Enter Customer Number" required>

            <label for="accountType">Account Type *</label>
            <select id="accountType" name="accountType" required>
                <option value="">-- Select Account Type --</option>
                <option value="savings">Savings</option>
                <option value="current">Current</option>
                <option value="fixed_deposit">Fixed Deposit</option>
                <option value="loan">Loan</option>
            </select>

            <label for="accountStatus">Account Status *</label>
            <select id="accountStatus" name="accountStatus" required>
                <option value="">-- Select Status --</option>
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
                <option value="closed">Closed</option>
            </select>

            <div class="button-wrapper">
                <button type="submit" class="submit-btn">Create Account</button>
                <!--<input type="reset" value="Clear Form">-->
            </div>
        </form>
    </div>

    <div class="footer">
        &copy; 2025 Your Bank Name | Manager Portal
    </div>
</body>
</html>
