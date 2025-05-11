<%-- 
    Document   : view_loans
    Created on : 07 Apr 2025, 7:52:27 PM
    Author     : thand
--%>

<%@page import="javax.ejb.EJB"%>
<%@page import="za.ac.tut.ejb.bl.BmLoanFacadeLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Loans</title>
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
                max-width: 800px;
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
            .form-instruction {
                font-size: 16px;
                margin-bottom: 20px;
                color: #555;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                color: #333;
            }
            .form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                height: 40px;
            }
            .range-group {
                margin-top: 30px;
            }
            .range-control {
                width: 100%;
                margin: 15px 0;
            }
            .range-value {
                display: inline-block;
                width: 30px;
                text-align: center;
                font-weight: bold;
            }
            .submit-btn {
                background: #007BFF;
                color: white;
                border: none;
                padding: 12px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                width: 100%;
                transition: background-color 0.3s;
            }
            .submit-btn:hover {
                background-color: #0056b3;
            }
            .nav-links {
                margin-top: 30px;
                text-align: center;
            }
            .nav-links a {
                display: inline-block;
                margin: 0 10px;
                color: #007BFF;
                text-decoration: none;
                font-weight: bold;
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
            <h1>Loan Management</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <h2 class="form-title">View Loans</h2>
            <p class="form-instruction">To view loans by status, filter the list by selecting a status below.</p>
            <form action="ViewLoansServlet.do" method="GET">
                <div class="form-group">
                    <label for="filter">Filter By Status:</label>
                    <select name="filter" id="filter">
                        <option value="pending">Pending</option>
                        <option value="approved">Approved</option>
                        <option value="rejected">Rejected</option>
                    </select>
                </div>
                <input type="submit" value="VIEW" class="submit-btn"/>
            </form>
            
            <div class="range-group">
                <p class="form-instruction">To view a number of loans, filter list by selecting the number of loans to view.</p>
                <form action="ViewANumberOfLoansServlet.do" method="GET">
                    <div class="form-group">
                        <label for="loanRange">Number of Loans: <span class="range-value" id="rangeValue">25</span></label>
                        <input 
                            type="range" 
                            min="1" 
                            max="50" 
                            name="num" 
                            id="loanRange" 
                            class="range-control"
                            oninput="document.getElementById('rangeValue').textContent = this.value" 
                            value="25"
                        />
                    </div>
                    <input type="submit" value="VIEW" class="submit-btn"/>
                </form>
            </div>
            
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