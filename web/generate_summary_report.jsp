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

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .form-group label {
            width: 130px;
            font-weight: bold;
            color: #555;
            margin-right: 10px;
        }
        .form-group input,
        .form-group select {
            flex: 1;
            padding: 6px;
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        /* Buttons container aligned left */
        .button-row, .export-button {
            display: flex;
            justify-content: center; /* Center the button horizontally */
            margin-top: 20px; /* Optional: Add some space above the button */
        }

        /* Uniform blue buttons */
        button {
            background: #007BFF;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-right: 10px;
        }
        button:hover {
            background-color: #0056b3;
        }

        .summary-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
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

        @media (max-width: 600px) {
            .form-group {
                flex-direction: column;
                align-items: flex-start;
            }
            .form-group label {
                width: 100%;
                margin-bottom: 5px;
                font-weight: bold;
                color: #555;
                font-size: 16px;
            }
            .button-row, .export-button {
                text-align: left;
            }
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
        <h1>Bank Summary Report</h1>
        <a href="index.html">Logout</a>
    </div>
    <div class="container">
        <h2>Generate Summary</h2>
        <form action="SummaryReportServlet.do" method="get">
            <div class="form-group">
                <label for="startDate">Start Date:</label>
                <input type="date" id="startDate" name="startDate" value="${startDate}" required />
            </div>
            <div class="form-group">
                <label for="endDate">End Date:</label>
                <input type="date" id="endDate" name="endDate" value="${endDate}" required />
            </div>
            <div class="form-group">
                <label for="loanStatus">Loan Status:</label>
                <select name="loanStatus" id="loanStatus">
                    <option value="pending" ${loanStatus == 'pending' ? 'selected' : ''}>Pending</option>
                    <option value="approved" ${loanStatus == 'approved' ? 'selected' : ''}>Approved</option>
                    <option value="rejected" ${loanStatus == 'rejected' ? 'selected' : ''}>Rejected</option>
                </select>
            </div>
            <div class="form-group">
                <label for="customerId">Customer ID:</label>
                <input type="text" id="customerId" name="customerId" value="${customerId}" placeholder="Customer ID" required />
            </div>

            <div class="button-row">
                <button type="submit" name="action" value="generate">Generate Report</button>
            </div>

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

            <div class="export-button">
                <button type="submit" name="export" value="pdf">Export as PDF File</button>
            </div>
        </form>
    </div>

    <div class="footer">
        &copy; 2025 Your Bank Name | Summary Report
    </div>
</body>
</html>
