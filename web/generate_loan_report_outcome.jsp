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
            justify-content: center; /* Center the buttons horizontally */
            gap: 15px;
            margin-top: 30px;
        }
        .export-button,
        .home-button {
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .export-button:hover,
        .home-button:hover {
            background-color: #0056b3;
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

        <div class="button-container">
            <a href="generate_loan_report.jsp" class="export-button">Back to filter</a>
            <a href="bankManagerDashboard.jsp" class="home-button">Back to Dashboard</a>
            <% if (loans != null && !loans.isEmpty()) { %>
                <form method="get" action="LoanReportServlet.do">
                    <input type="hidden" name="export" value="pdf">
                    <input type="hidden" name="loanStatus" value="<%= request.getParameter("loanStatus") != null ? request.getParameter("loanStatus") : "" %>">
                    <input type="hidden" name="loanType" value="<%= request.getParameter("loanType") != null ? request.getParameter("loanType") : "" %>">
                    <input type="hidden" name="minAmount" value="<%= request.getParameter("minAmount") != null ? request.getParameter("minAmount") : "" %>">
                    <input type="hidden" name="maxAmount" value="<%= request.getParameter("maxAmount") != null ? request.getParameter("maxAmount") : "" %>">
                    <input type="hidden" name="minInterestRate" value="<%= request.getParameter("minInterestRate") != null ? request.getParameter("minInterestRate") : "" %>">
                    <input type="hidden" name="maxInterestRate" value="<%= request.getParameter("maxInterestRate") != null ? request.getParameter("maxInterestRate") : "" %>">
                    <button type="submit" class="export-button">Export as Pdf File</button>
                </form>
            <% } %>
        </div>
    </div>

    <div class="footer">
        &copy; 2025 Your Bank Name | Manager Portal
    </div>
</body>
</html>
