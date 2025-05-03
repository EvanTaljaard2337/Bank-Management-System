<%-- 
    Document   : update_loan_status_outcome
    Created on : 07 Apr 2025, 9:22:51 PM
    Author     : thand
--%>

<%@page import="za.ac.tut.entities.BmLoan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Update Outcome</title>
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
                max-width: 1000px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 30px;
            }
            .result-message {
                font-size: 18px;
                margin-bottom: 20px;
                color: #555;
                text-align: center;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
            }
            th {
                background-color: #007BFF;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #e9e9e9;
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
            <h1>Loan Update Result</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <%
                BmLoan loan = (BmLoan)request.getAttribute("loan");
                String updateResult = (String)request.getAttribute("updateResult");
            %>
            <p class="result-message"><%=updateResult%></p>
            <table>
                <thead>
                    <tr>
                        <th>Loan ID</th>
                        <th>Customer ID</th>
                        <th>Loan Amount</th>
                        <th>Interest Rate</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=loan.getBLoanid()%></td>
                        <td><%=loan.getBCustomerid().getBCustomerid()%></td>
                        <td>R <%=loan.getBLoanamount()%></td>
                        <td><%=loan.getBInterestrate()%>%</td>
                        <td><%=loan.getBStatus()%></td>
                    </tr>
                </tbody>
            </table>
            
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