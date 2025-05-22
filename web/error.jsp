<%@page import="za.ac.tut.entities.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Error Page</title>
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
            max-width: 700px;
            margin: 60px auto;
            background: white;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
        }
        .container h2 {
            color: #007BFF;
            font-size: 26px;
            margin-bottom: 25px;
        }
        .error-message {
            color: #dc3545;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .error-details {
            font-size: 16px;
            color: #333;
            margin-bottom: 30px;
            white-space: pre-wrap;
            word-break: break-word;
        }
        .dashboard-link {
            display: inline-block;
            background-color: #007BFF;
            color: white;
            padding: 12px 25px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            transition: background-color 0.3s;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        .dashboard-link:hover {
            background-color: #0056b3;
        }
        .footer {
            text-align: center;
            padding: 20px;
            background: #007BFF;
            color: white;
            font-size: 14px;
            margin-top: 60px;
        }
        @media (max-width: 768px) {
            .container {
                margin: 30px 20px;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Error Page</h1>
        <a href="index.html">Logout</a>
    </div>

    <div class="container">
        <h2>An Error Occurred</h2>
        <%
            String errMsg = (String) request.getAttribute("errMsg");
            if (errMsg == null || errMsg.trim().isEmpty()) {
                errMsg = "No additional error information provided.";
            }
        %>
        <p class="error-details"><%= errMsg %></p>

        <%
            BmCustomer cust = (BmCustomer) session.getAttribute("customer");
            BmSystemAdministrator admin = (BmSystemAdministrator) session.getAttribute("admin");
            BmBankManager manager = (BmBankManager) session.getAttribute("manager");
            BmCustomerSupportAgent agent = (BmCustomerSupportAgent) session.getAttribute("support_agent");
            BmLoanOfficer officer = (BmLoanOfficer) session.getAttribute("officer");
        %>

        <%
            if (cust != null) {
        %>
            <a class="dashboard-link" href="customer_dashboard.jsp">Back to Dashboard</a>
        <%
            } else if (admin != null) {
        %>
            <a class="dashboard-link" href="adminDashboard.jsp">Back to Dashboard</a>
        <%
            } else if (manager != null) {
        %>
            <a class="dashboard-link" href="bankManagerDashboard.jsp">Back to Dashboard</a>
        <%
            } else if (agent != null) {
        %>
            <a class="dashboard-link" href="supportAgentDashboard.jsp">Back to Dashboard</a>
        <%
            } else if (officer != null) {
        %>
            <a class="dashboard-link" href="loanOfficerDashboard.jsp">Back to Dashboard</a>
        <%
            }
        %>
    </div>

    <div class="footer">
        &copy; 2025 Your Bank Name | Contact Support: support@yourbank.com | Phone: 123-456-7890
    </div>
</body>
</html>
