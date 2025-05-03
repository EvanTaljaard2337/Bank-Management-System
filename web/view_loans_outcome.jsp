<%-- 
    Document   : view_loans_outcome
    Created on : 07 Apr 2025, 8:08:49 PM
    Author     : thand
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="za.ac.tut.entities.BmLoan"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Listing</title>
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
                max-width: 1200px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 30px;
            }
            .info-message {
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
            <h1>Loan Listing</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <p class="info-message">Below are the loans you requested.</p>
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
                    <%
                        List<BmLoan> loans = (List<BmLoan>)request.getAttribute("filteredLoans");
                        for(BmLoan l : loans){
                            Integer loanID = l.getBLoanid();
                            Integer custID = l.getBCustomerid().getBCustomerid();
                            BigDecimal amount = l.getBLoanamount();
                            BigDecimal interestRate = l.getBInterestrate();
                            String status = l.getBStatus();
                    %>
                    <tr>
                        <td><%=loanID%></td>
                        <td><%=custID%></td>
                        <td>R <%=amount%></td>
                        <td><%=interestRate%>%</td>
                        <td><%=status%></td>
                    </tr>
                    <%
                        }
                    %>
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