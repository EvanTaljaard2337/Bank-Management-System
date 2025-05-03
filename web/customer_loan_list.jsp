<%-- 
    Document   : customer_loan_list
    Created on : 03 May 2025, 14:23:44
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmLoan"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Applied Loans Status</title>
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
                padding: 20px;
            }
            h1 {
                color: #333;
                text-align: center;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            th, td {
                padding: 12px;
                text-align: left;
                border: 1px solid #ddd;
            }
            th {
                background-color: #007BFF;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            p {
                text-align: center;
                color: #555;
            }
            a {
                color: #007BFF;
                text-decoration: none;
            }
            a:hover {
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
            <h1>Applied Loans Status</h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <table>
            <%
                List<BmLoan> loans = (List<BmLoan>)request.getAttribute("loans");
                
                if(loans != null && !loans.isEmpty()){
            %>
                <tr>
                    <th>Interest Rate</th>
                    <th>Loan Amount</th>
                    <th>Status</th>
                    <th>Loan Type</th>
                </tr>
            <%
                for(BmLoan l : loans){         
            %>
                <tr>
                    <td><%=l.getBInterestrate()%></td>
                    <td><%=l.getBLoanamount()%></td>
                    <td><%=l.getBStatus()%></td>
                    <td><%=l.getbLoanType()%></td>
                </tr>
            <%  
                }
            } else {
            %>
                <p>You have not applied for any loans yet. Would you like to apply? Click <a href="loanApplication.jsp">here</a> to apply for a loan.</p>
            <%
                }
            %>
            </table>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Contact Support: support@yourbank.com | Phone: 123-456-7890
        </div>
    </body