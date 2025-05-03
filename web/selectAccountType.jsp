<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Account Type</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                padding: 2em;
            }
            form {
                background: white;
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            label, select, button {
                display: block;
                width: 100%;
                margin-top: 15px;
                font-size: 16px;
            }
            button {
                margin-top: 25px;
                padding: 12px;
                background-color: #007BFF;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <form action="createAccount.do" method="POST">
            <input type="hidden" name="customerId" value="${param.customerId}" />
            <label for="accountType">Choose an Account Type to Create:</label>
            <select id="accountType" name="accountType" required>
                <option value="" selected disabled>Select account type</option>
                <option value="savings">Savings Account</option>
                <option value="checking">Checking Account</option>
                <option value="business">Business Account</option>
                <option value="investment">Investment Account</option>
            </select>
            <button type="submit">Continue</button>
        </form>
    </body>
</html>
