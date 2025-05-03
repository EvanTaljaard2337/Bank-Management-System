<%-- 
    Document   : count_loans
    Created on : 30 Apr 2025, 8:40:30 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Count Loans Page</title>
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
                color: #333;
            }
            .radio-group {
                margin: 20px 0;
            }
            .radio-option {
                display: block;
                margin: 10px 0;
                padding: 8px;
                background: #f9f9f9;
                border-radius: 4px;
            }
            .submit-btn {
                background: #007BFF;
                color: white;
                border: none;
                padding: 12px 25px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }
            .submit-btn:hover {
                background-color: #0056b3;
            }
            .nav-links {
                margin-top: 30px;
                padding-top: 20px;
                border-top: 1px solid #eee;
            }
            .nav-links a {
                display: inline-block;
                margin-right: 15px;
                color: #007BFF;
                text-decoration: none;
            }
            .nav-links a:hover {
                text-decoration: underline;
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
            <h1>Loan Statistics</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <h2 class="form-title">Count Loans</h2>
            <p>Choose filter value for counting the loans</p>
            <form action="CountLoansServlet.do" method="POST">
                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="count_filter" value="all" /> All Loans
                    </label>
                    <label class="radio-option">
                        <input type="radio" name="count_filter" value="Approved" /> Approved Loans
                    </label>
                    <label class="radio-option">
                        <input type="radio" name="count_filter" value="Rejected" /> Rejected Loans
                    </label>
                    <label class="radio-option">
                        <input type="radio" name="count_filter" value="Pending" /> Pending Loans
                    </label>
                </div>
                <input type="submit" value="COUNT" class="submit-btn"/>
            </form>
            
            <div class="nav-links">
                <a href="index.html">Login page</a>
                <a href="loanOfficerDashboard.jsp">Dashboard</a>
            </div>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Loans Department
        </div>
    </body>
</html>