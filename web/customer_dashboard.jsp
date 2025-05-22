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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
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
                color: white;
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
                color: whitesmoke;
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
                margin-top: 20px;
            }
            .social-media {
                margin-top: 10px;
            }
            .social-media a {
                color: white;
                margin: 0 10px;
                font-size: 20px;
                text-decoration: none;
                vertical-align: middle;
                transition: color 0.3s;
            }
            .social-media a:hover {
                color: #d4d4d4;
            }
            .social-media span {
                margin-left: 6px;
                vertical-align: middle;
                font-size: 14px;
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
            .header-logout {
                color: white;
                background-color: #007BFF;
                text-decoration: none;
                font-weight: bold;
                padding: 8px 15px;
                border: 1px solid white;
                border-radius: 4px;
                transition: background-color 0.3s;
            }
            .header-logout:hover {
                background-color: rgba(255,255,255,0.2);
            }
            .action-link {
                color: white;
                display: block;
                background: #007BFF;
                text-decoration: none;
                padding: 12px 25px;
                border-radius: 5px;
                transition: background-color 0.3s;
                margin: 10px 0;
                width: fit-content;
                min-width: 200px;
                font-weight: bold;
                font-size: 16px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }
            .action-link:hover {
                 background-color: #007BFF;
            }


        </style>
    </head>
    <body>
        <%
            BmCustomer c = (BmCustomer)session.getAttribute("customer");
            if(c == null){
                response.sendRedirect("index.html");
                return;
            }
        %>
        <div class="header">
            <h1>Welcome, <%=c.getBFullname()%></h1>
            <form action="index.html">
                <input type="submit" class="header-logout" value="Logout">
            </form>
            <!--<a href="logoutServlet.do" method="POST" class="header-logout">Logout</a>-->
        </div>
        <div class="container">
        <div class="sidebar">
            <h2>Quick Actions</h2>
            <a href="transfer.jsp" class="action-link">Transfer Funds</a>
            <a href="RetrieveAccountTypeServlet.do?customerId=<%= c.getBCustomerid() %>&source=deposit" class="action-link">Deposit Money</a>
            <a href="RetrieveAccountTypeServlet.do?customerId=<%= c.getBCustomerid() %>&source=withdraw" class="action-link">Withdraw Money</a>
            <a href="complaint.jsp?customerId=<%= c.getBCustomerid() %>" class="action-link">Lodge Complaint</a>
            <a href="ViewTransactionsHistoryServlet.do?customerId=<%= c.getBCustomerid() %>" class="action-link">View Transactions</a>
            <a href="checkBalanceServlet.do?customerId=<%= c.getBCustomerid() %>" class="action-link">Account Balance</a>

            <h2>Loan Application</h2>
            <a href="loanApplication.jsp" class="action-link">Apply for a Loan</a>
            <a href="loanStatus.do?customerId=<%= c.getBCustomerid() %>" class="action-link">View Loan Status</a>

            <h2>Create an Account</h2>
            <a href="selectAccountType.jsp?customerId=<%= c.getBCustomerid() %>" class="action-link">Create an Account</a>
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
            &copy; 2025 BMS | Contact Support: support@bms.com | Phone: 123-456-7890
            <div class="social-media">
                <a href="https://x.com/Nedbank?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor" target="_blank" aria-label="X Social Media">
                    <i class="fab fa-twitter"></i><span>X</span>
                </a>
                <a href="https://github.com/EvanTaljaard2337/Bank-Management-System" target="_blank" aria-label="Facebook">
                    <i class="fab fa-facebook-f"></i><span>Facebook</span>
                </a>
                <a href="https://github.com/EvanTaljaard2337/Bank-Management-System" target="_blank" aria-label="Instagram">
                    <i class="fab fa-instagram"></i><span>Instagram</span>
                </a>
                <a href="https://github.com/EvanTaljaard2337/Bank-Management-System" target="_blank" aria-label="GitHub">
                    <i class="fab fa-github"></i><span>GitHub</span>
                </a>
            </div>
        </div>
    </body>
</html>


