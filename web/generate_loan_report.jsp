<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Generate Loan Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
        }
        .filter-form {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .filter-form label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        .filter-form input, .filter-form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .loan-report-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .loan-report-table th, .loan-report-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        .loan-report-table th {
            background-color: #007BFF;
            color: white;
            font-weight: normal;
        }
        .loan-report-table tr:last-child td {
            border-bottom: none;
        }
        .no-data {
            padding: 20px;
            font-style: italic;
            color: #666;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        .home-button {
            display: inline-block;
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            margin-top: 20px;
            transition: background-color 0.3s;
        }
        .home-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Generate Loan Report</h1>
    
    <div class="filter-form">
        <form action="LoanReportServlet.do" method="GET">
            <label for="loanId">Loan ID:</label>
            <input type="text" id="loanId" name="loanId" placeholder="Leave empty to search all loans" />


            <label for="customerName">Customer Name:</label>
            <input type="text" id="customerName" name="customerName" placeholder="Leave empty to search all loans" />

            <label for="minAmount">Loan Amount (Min):</label>
            <input type="number" id="minAmount" name="minAmount" />

            <label for="maxAmount">Loan Amount (Max):</label>
            <input type="number" id="maxAmount" name="maxAmount" />

            <label for="minInterestRate">Interest Rate (Min):</label>
            <input type="number" id="minInterestRate" name="minInterestRate" step="0.01" />

            <label for="maxInterestRate">Interest Rate (Max):</label>
            <input type="number" id="maxInterestRate" name="maxInterestRate" step="0.01" />

            <label for="loanStatus">Loan Status:</label>
            <select id="loanStatus" name="loanStatus">
                <option value="All">All</option>
                <option value="Approved">Active</option>
                <option value="Rejected">Closed</option>
                <option value="Pending">Defaulted</option>
            </select>

            <label for="loanType">Loan Type:</label>
            <select id="loanType" name="loanType" required>
                <option value="All">All</option>
                <option value="personal">Personal Loan</option>
                <option value="home">Home Loan</option>
                <option value="car">Car Loan</option>
                <option value="education">Education Loan</option>
                <option value="business">Business Loan</option>
                <option value="debt">Debt Consolidation Loan</option>
            </select>

            <input type="submit" value="Search" />
        </form>
    </div>
    <a href="bankManagerDashboard.jsp" class="home-button">Home</a>
</body>
</html>