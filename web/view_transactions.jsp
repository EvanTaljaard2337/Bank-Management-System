<%-- 
    Document   : view_transactions
    Created on : 07 Apr 2025, 6:27:25 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Transactions</title>
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
                max-width: 600px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 30px;
            }
            .form-title {
                margin-top: 0;
                color: #007BFF;
            }
            .form-instruction {
                font-size: 16px;
                margin-bottom: 20px;
                color: #555;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                font-weight: bold;
                color: #555;
                margin-bottom: 10px;
                display: block;
                font-size: 16px;
            }
            .form-group select,
            .form-group input[type="text"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }
            .form-group select {
                height: 40px;
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


        .button-wrapper button:hover {
            background-color: #0056b3;
        }

        </style>
<script>
        function toggleFilterValue() {
            var filterSelect = document.getElementById("filter");
            var filterValueInput = document.getElementById("filter_val");
            if (filterSelect.value === "View all") {
                filterValueInput.value = ""; // Clear the input
                filterValueInput.disabled = true; // Disable the input
                filterValueInput.required = false; // Remove required attribute
            } else {
                filterValueInput.disabled = false; // Enable the input
                filterValueInput.required = true; // Set required attribute
            }
        }

    </script>
</head>
<body>
    <div class="header">
        <a href="bankManagerDashboard.jsp" class="header-btn">Home</a>
        <h1>Transaction Records</h1>
        <a href="index.html">Logout</a>
    </div>
    <div class="container">
        <h2 class="form-title">Filter Transactions</h2>
        <p class="form-instruction">Filter the list by selecting an option below.</p>
        <form action="ViewTransactionsServlet.do" method="GET">
            <div class="form-group">
                <label for="filter">Filter By:</label>
                <select name="filter" id="filter" onchange="toggleFilterValue()">
                    <option value="ID">ID</option>
                    <option value="Max amount">Max amount</option>
                    <option value="View all">View All</option>
                </select>
            </div>
            <div class="form-group">
                <label for="filter_val">Provide filter value:</label>
                <input type="text" name="filter_val" id="filter_val" required/>
            </div>
            <div class="button-wrapper">
                <button type="submit" class="submit-btn">View Transactions</button>
            </div>
        </form>
    </div>
    <div class="footer">
        &copy; 2025 Your Bank Name | Bank Management
    </div>
</body>
</html>