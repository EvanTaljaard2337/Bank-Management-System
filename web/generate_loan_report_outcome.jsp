<%@page import="za.ac.tut.entities.BmLoan"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Loan Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .home-button {
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
        }
        .home-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Generate Loan Report</h1>
    
    <%
        List<BmLoan> loans = (List<BmLoan>) request.getAttribute("loans");
        if (loans != null && !loans.isEmpty()) {
    %>
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
                        <td><%= loan.getBCustomerid() %></td>
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
        <p>No loans found matching the criteria.</p>
    <%
        }
    %>
    
    <a href="home.jsp" class="home-button">Home</a>
</body>
</html>