<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Bank Summary Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0; padding: 0;
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
        .container {
            max-width: 800px;
            margin: 30px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
        }
        .filter-section {
            margin-bottom: 25px;
        }
        label {
            font-weight: bold;
            color: #333;
            display: inline-block;
            width: 80px;
        }
        input[type="date"] {
            padding: 6px;
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-right: 15px;
        }
        button {
            background: #007BFF;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .summary-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .summary-table th, .summary-table td {
            text-align: left;
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
        }
        .summary-table th {
            background-color: #007BFF;
            color: white;
            font-weight: normal;
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
        <h1>Bank Summary Report</h1>
        <a href="bankManagerDashboard.jsp" style="color:white; text-decoration:none; font-weight:bold;">Back to Dashboard</a>
    </div>
    <div class="container">
        <form action="SummaryReportServlet.do" method="get" class="filter-section">
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" value="${startDate}" max="${endDate}" required />
            
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" value="${endDate}" max="${endDate}" required />
            <select name="loanStatus" id="filter">
                <option value="pending">Pending</option>
                <option value="approved">Approved</option>
                <option value="rejected">Rejected</option>
            </select>
            <input type="text" name="customerId" value="" />
            <button type="submit">Generate Report</button>
        </form>
        
        <table class="summary-table">
            <tr>
                <th>Metric</th>
                <th>Value</th>
            </tr>
            <tr>
                <td>Total Active Accounts</td>
                <td>${totalAccounts}</td>
            </tr>
            <tr>
                <td>Total Deposits</td>
                <td>R${totalDeposits}</td>
            </tr>
            <tr>
                <td>Total Withdrawals</td>
                <td>R${totalWithdrawals}</td>
            </tr>
            <tr>
                <td>Loans Approved</td>
                <td>${totalLoansApproved}</td>
            </tr>
            <tr>
                <td>Outstanding Loans</td>
                <td>R${outstandingLoans}</td>
            </tr>
            <tr>
                <td>Customer Complaints</td>
                <td>${complaints} (Unresolved: ${unresolvedComplaints})</td>
            </tr>
            <tr>
                <td>Total Transactions</td>
                <td>${totalTransactions}</td>
            </tr>
        </table>
    </div>
    <div class="footer">
        &copy; 2025 Your Bank Name | Summary Report
    </div>
</body>
</html>