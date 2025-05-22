<%-- 
    Document   : generate_transaction_report
    Created on : 04 May 2025, 15:17:18
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="za.ac.tut.entities.BmBankManager"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Generate Transaction Report</title>
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
            max-width: 800px;
            margin: 30px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
        }
        .welcome-message {
            font-size: 25px;
            margin-bottom: 25px;
            color: #007BFF;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: bold;
            color: #555;
            margin-bottom: 10px;
            display: block;
            font-size: 16px;
        }
        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            margin-bottom: 25px;
            transition: border-color 0.3s ease;
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
        .button-wrapper {
            display: flex; /* Make this a flex container */
            justify-content: center; /* Center the button horizontally */
            margin-top: 20px; /* Optional: Add some space above the button */
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
                width: 30%;
                transition: background-color 0.3s;
            }
            .submit-btn:hover {
                background-color: #0056b3;
            }

    </style>
        <script>
        window.onload = function() {
            const today = new Date().toISOString().split("T")[0];
            document.getElementById("startDate").setAttribute("max", today);
            document.getElementById("endDate").setAttribute("max", today);
        };
    </script>
</head>

<body>
    <div class="header">
        <a href="bankManagerDashboard.jsp" class="header-btn">Home</a>
        <h1>Transaction Records</h1>
        <a href="index.html">Logout</a>
    </div>
    <div class="container">
        <%
            BmBankManager m = (BmBankManager)request.getAttribute("manager");
        %>
        <h2 class="welcome-message">Generate Transaction Report</h2>
        <p>Fill in the details below to generate the transaction report.</p>
        
        <form action="GenerateTransactionReportServlet.do" method="post">
            <label for="accountNumber">Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required>

            <label for="transactionType">Transaction Type:</label>
            <select id="transactionType" name="transactionType" required>
                <option value="">Select Type</option>
                <option value="deposit">Deposit</option>
                <option value="withdrawal">Withdrawal</option>
                <option value="transfer">Transfer</option>
                <option value="payment">Payment</option>
            </select>

            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" value="${startDate}" required />

            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" value="${endDate}" required />
	 <div class="button-wrapper">
               <button type="submit" class="submit-btn">Generate Report</button>
         </div>
        </form>
    </div>
    <div class="footer">
        &copy; 2025 Your Bank Name | Manager Portal
    </div>
</body>
</html>
