<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="za.ac.tut.entities.BmAccount"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Account Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            padding: 50px;
            text-align: center;
            margin: 0;
        }

        h1, h2 {
            color: #2c3e50;
            margin-bottom: 30px;
        }

        form {
            background-color: #ffffff;
            padding: 30px;
            margin: auto;
            width: 40%;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            text-align: left;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #34495e;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 25px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: #e74c3c;
            font-weight: bold;
            margin-top: 20px;
        }
        .button-container {
            text-align: center;
            margin-top: 25px;
        }

    </style>
</head>
<body>
    <h1>Edit Account</h1>
    <%
        BmAccount account = (BmAccount)request.getAttribute("account");
        if (account == null) {
    %>
        <p class="error-message">No account data to display. Please go back and try again.</p>
    <%
        } else {

                    NumberFormat formatter = NumberFormat.getInstance(new Locale("en","ZA"));
                    formatter.setMinimumFractionDigits(2);
                    formatter.setMaximumFractionDigits(2);
    %>
        <h2>Edit Account Details</h2>
        <form action="UpdateAccountServlet.do" method="POST">
            <input type="hidden" name="accountId" value="<%=account.getBAccountid()%>" />

            <label for="customerId">Customer ID:</label>
            <input type="text" id="customerId" name="customerId" value="<%=account.getBCustomerid().getBCustomerid()%>" required />

            <label for="accountType">Account Type:</label>
            <select id="accountType" name="accountType" required>
                <option value="" disabled>Select account type</option>
                <option value="savings" <%= "savings".equals(account.getBAccounttype()) ? "selected" : "" %>>Savings Account</option>
                <option value="checking" <%= "checking".equals(account.getBAccounttype()) ? "selected" : "" %>>Checking Account</option>
                <option value="business" <%= "business".equals(account.getBAccounttype()) ? "selected" : "" %>>Business Account</option>
                <option value="investment" <%= "investment".equals(account.getBAccounttype()) ? "selected" : "" %>>Investment Account</option>
            </select>

            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="" disabled>Select status</option>
                <option value="Active" <%= "Active".equals(account.getBStatus()) ? "selected" : "" %>>Active</option>
                <option value="Inactive" <%= "Inactive".equals(account.getBStatus()) ? "selected" : "" %>>Inactive</option>
            </select>

            <label for="balance">Balance:</label>
            <input type="text" id="balance" name="balance" value="<%=formatter.format(account.getBBalance())%>" required />
            <div class="button-container">
                <input type="submit" value="Update Account" />
            </div>
        </form>
    <%
        }
    %>
</body>
</html>
          