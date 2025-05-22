<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Generate Loan Report</title>
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

        .container {
            max-width: 800px;
            margin: 30px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 40px 30px;
        }

        .container h2 {
            margin-top: 0;
            font-size: 28px;
            margin-bottom: 20px;
            color: #007BFF;
            text-align: center;
        }

        .filter-form label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
            font-weight: bold;
            font-size: 16px;
        }

        .filter-form input,
        .filter-form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 15px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .button-group input[type="submit"],
        .button-group a {
            background-color: #007BFF;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .button-group input[type="submit"]:hover,
        .button-group a:hover {
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

        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 30px 20px;
            }
            .button-group {
                flex-direction: column;
            }
            .button-group input[type="submit"],
            .button-group a {
                width: 100%;
                text-align: center;
            }
        }
        .logout-btn {
            background-color: #007BFF;
            color: white;
            border: 1px solid white;
            border-radius: 4px;
            padding: 8px 15px;
            font-weight: bold;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: rgba(255, 255, 255, 0.2);
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
                width: 30%;
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
    <div class="header">
        <a href="bankManagerDashboard.jsp" class="header-btn">Home</a>
         <h1>Generate Loan Report</h1>
        <form action="logoutServlet.do" method="POST" style="margin: 0;">
            <input type="submit" value="Logout" class="logout-btn">
        </form>
    </div>
    <div class="container">
        <h2>Generate Loan Report</h2>
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
                <div class="button-wrapper">
                    <button type="submit" class="submit-btn">Search</button>
                </div>
            </form>
        </div>
    </div>

    <div class="footer">
        &copy; 2025 Your Bank Name | Bank Manager Portal
    </div>

</body>
</html>
