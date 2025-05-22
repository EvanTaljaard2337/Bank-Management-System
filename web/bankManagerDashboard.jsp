<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bank Manager Dashboard</title>
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
            background-color: #0056b3;
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
        BmBankManager m = (BmBankManager)session.getAttribute("manager");
        if (m.getBFullname() == null) {
            response.sendRedirect("index.html"); // fallback
            return;
        }
    %>
    <div class="header">
        <h1>Welcome, <%=m.getBFullname()%></h1>
        <form action="logoutServlet.do" method="POST">
            <input type="submit" class="header-logout" value="Logout">
        </form>
    </div>

    <div class="container">
        <div class="sidebar">
            <h2>Quick Actions</h2>
            <a href="view_transactions.jsp" class="action-link">View Transactions</a>
            <a href="generate_summary_report.jsp" class="action-link">Summary Report</a>
            <a href="generate_transaction_report.jsp" class="action-link">Transaction Report</a>
            <a href="generate_loan_report.jsp" class="action-link">Loan Report</a>
            <a href="generate_complaint_report.jsp" class="action-link">Complaint Report</a>
            <a href="user_activity_report.jsp" class="action-link">User Activity Report</a>

            <h2>Manage Customers</h2>
            <a href="add_customer.jsp" class="action-link">Add Customer</a>
            <a href="view_customers.jsp" class="action-link">View Customers</a>
            <a href="findUser.jsp" class="action-link">Update Customer</a>
            <a href="delete_customer.jsp" class="action-link">Delete Customer</a>

            <h2>Manage Accounts</h2>
            <a href="add_account.jsp" class="action-link">Add Account</a>
            <a href="view_accounts.jsp" class="action-link">View Accounts</a>
            <a href="update_account.jsp" class="action-link">Update Account</a>
            <a href="delete_account.jsp" class="action-link">Delete Account</a>
            
            <h2>Manage Employees</h2>
            <a href="add_employee.jsp" class="action-link">Add Employee</a>
            <a href="view_employees.jsp" class="action-link">View Employees</a>
            <a href="update_employee.jsp" class="action-link">Update Employee</a>
            <a href="delete_employee.jsp" class="action-link">Delete Employee</a>
        </div>

        <div class="content">
            <h2>Dashboard Overview</h2>
            <p>Manage bank operations, customers, accounts, and reports from this dashboard.</p>
            <div class="card">
                <h3>Manager Details</h3>
                <p><strong>Full Name:</strong> <%=m.getBFullname()%></p>
                <p><strong>Email:</strong> <%=m.getBEmail()%></p>
                <!-- Add more manager-specific details here -->
            </div>
        </div>
    </div>

    <div class="footer">
        &copy; 2025 BMS | Bank Manager Portal
    </div>
</body>
</html>
