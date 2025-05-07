<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.BmLoan"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Loan Report</title>
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

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .home-button, .export-button {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .home-button {
            background-color: #007BFF;
            color: white;
            text-decoration: none;
        }
        .home-button:hover {
            background-color: #0056b3;
        }
        .export-button {
            background-color: #28a745;
            color: white;
            text-decoration: none;
        }
        .export-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Loan Report</h1>
        <a href="index.html">Logout</a>
    </div>

    <div class="container">
        <%
            List<BmLoan> loans = (List<BmLoan>) request.getAttribute("loans");
            if (loans != null && !loans.isEmpty()) {
        %>
            <h2>Filtered Loan Results</h2>
            <table>
                <thead>
                    <tr>
                        <th>Loan ID</th>
                        <th>Customer ID</th>
                        <th>Loan Amount</th>
                        <th>Interest Rate</th>
                        <th>Status</th>
                        <th>Loan Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (BmLoan loan : loans) {
                    %>
                        <tr>
                            <td><%= loan.getBLoanid() %></td>
                            <td><%= loan.getBCustomerid().getBCustomerid() %></td>
                            <td><%= loan.getBLoanamount() %></td>
                            <td><%= loan.getBInterestrate() %></td>
                            <td><%= loan.getBStatus() %></td>
                            <td><%= loan.getbLoanType() %></td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        <%
            } else {
        %>
            <h2>No loans found matching the criteria.</h2>
        <%
            }
        %>

        <a href="bankManagerDashboard.jsp" class="home-button">Back to Dashboard</a>
        <% if (loans != null && !loans.isEmpty()) { %>
            <form method="get" action="LoanReportServlet.do">
                <input type="hidden" name="export" value="text">
                <!-- Preserving filter parameters for the next export -->
                <input type="hidden" name="loanStatus" value="<%= request.getParameter("loanStatus") != null ? request.getParameter("loanStatus") : "" %>">
                <input type="hidden" name="loanType" value="<%= request.getParameter("loanType") != null ? request.getParameter("loanType") : "" %>">
                <input type="hidden" name="minAmount" value="<%= request.getParameter("minAmount") != null ? request.getParameter("minAmount") : "" %>">
                <input type="hidden" name="maxAmount" value="<%= request.getParameter("maxAmount") != null ? request.getParameter("maxAmount") : "" %>">
                <input type="hidden" name="minInterestRate" value="<%= request.getParameter("minInterestRate") != null ? request.getParameter("minInterestRate") : "" %>">
                <input type="hidden" name="maxInterestRate" value="<%= request.getParameter("maxInterestRate") != null ? request.getParameter("maxInterestRate") : "" %>">
                 <input type="submit" value="Export as Text File" class="export-button">
            </form>
         <% } %>
    </div>
    <div class="footer">
        &copy; 2025 Your Bank Name | Manager Portal
    </div>
</body>
</html>

