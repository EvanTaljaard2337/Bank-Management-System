<%-- 
    Document   : customer_dashboard
    Created on : 05 Apr 2025, 14:21:26
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmCustomer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Dashboard</title>
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
                display: flex;
                max-width: 1200px;
                margin: 30px auto;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                overflow: hidden;
            }
            .sidebar {
                flex: 1;
                background: #f9faff;
                padding: 30px 25px;
                border-right: 1px solid #e0e0e0;
            }
            .sidebar h2 {
                color: #007BFF;
                margin-bottom: 25px;
                font-size: 22px;
                border-bottom: 2px solid #007BFF;
                padding-bottom: 8px;
            }
            .sidebar p {
                margin: 20px 0;
                font-size: 16px;
            }
            .sidebar a {
                color: #007BFF;
                text-decoration: none;
                font-weight: 600;
                font-size: 16px;
                display: block;
                margin: 12px 0;
                padding-left: 10px;
                border-left: 3px solid transparent;
                transition: border-color 0.3s;
            }
            .sidebar a:hover {
                border-left: 3px solid #0056b3;
                text-decoration: none;
                color: #0056b3;
            }
            .content {
                flex: 3;
                padding: 40px 30px;
                color: #333;
            }
            .content h2 {
                margin-top: 0;
                font-size: 28px;
                margin-bottom: 20px;
            }
            .welcome-text {
                font-size: 18px;
                line-height: 1.6;
            }
            .card {
                background: #f0f4ff;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 1px 5px rgba(0,0,0,0.1);
                margin-top: 25px;
                font-size: 18px;
            }
            .footer {
                text-align: center;
                padding: 20px;
                background: #007BFF;
                color: white;
                font-size: 14px;
                margin-top: 40px;
            }
            @media (max-width: 768px) {
                .container {
                    flex-direction: column;
                    margin: 20px;
                }
                .sidebar, .content {
                    flex: unset;
                    padding: 20px;
                }
                .sidebar {
                    border-right: none;
                    border-bottom: 1px solid #e0e0e0;
                }
            }
        </style>
    </head>
    <body>
        <%
            BmCustomer c = (BmCustomer)session.getAttribute("customer");  
        %>
        <div class="header">
            <h1>Welcome, <%=c.getBFullname()%></h1>
            <form action="logoutServlet.do" method="post">
                <button type="submit">Logout</button>
            </form>
        </div>
        <div class="container">
            <div class="sidebar">
                <h2>Quick Actions</h2>
                <p><a href="transfer.jsp">&#10148; Transfer Funds</a></p>
                <p><a href="RetrieveAccountTypeServlet.do?customerId=<%= c.getBCustomerid() %>&source=deposit">&#10148; Deposit Money</a></p>
                <p><a href="RetrieveAccountTypeServlet.do?customerId=<%= c.getBCustomerid() %>&source=withdraw">&#10148; Withdraw Money</a></p>
                <p><a href="complaint.jsp?customerId=<%= c.getBCustomerid() %>">&#9888; Lodge Complaint</a></p>
                <p><a href="ViewTransactionsHistoryServlet.do?customerId=<%= c.getBCustomerid() %>">&#128221; View Transactions</a></p>
                <p><a href="checkBalanceServlet.do?customerId=<%= c.getBCustomerid() %>">&#128179; Account Balance</a></p>
                <h2>Loan Application</h2>
                <p><a href="loanApplication.jsp">&#128179; Apply for a Loan</a></p>
                <p><a href="loanStatus.do?customerId=<%= c.getBCustomerid() %>">&#128221; View Loan Status</a></p>
               <h2>Create an Account</h2>
                <p><a href="selectAccountType.jsp?customerId=<%= c.getBCustomerid() %>">&#128179; Create an Account</a></p>
            </div>
            <div class="content">
                <h2>Dashboard Overview</h2>
                <p class="welcome-text">
                    Welcome to your banking dashboard. Here you can easily manage your accounts, transfer funds safely, review your transaction history, and lodge complaints if needed.
                </p>
                <div class="card">
                    <h3>Your Account Summary</h3>
                    <p><strong>Full Name:</strong> <%=c.getBFullname()%></p>
                    <p><strong>Customer ID:</strong> <%=c.getBCustomerid()%></p>
                    <p><strong>Email:</strong> <%=c.getBEmail()%></p>
                    <!-- Add more details or account summary here -->
                </div>
            </div>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Contact Support: support@yourbank.com | Phone: 123-456-7890
        </div>
    </body>
</html>


