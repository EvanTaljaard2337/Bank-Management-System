<%-- 
    Document   : account_created_page
    Created on : 03 May 2025, 18:34:22
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Account Created</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        p {
            font-size: 16px;
            line-height: 1.5;
            color: #555;
            text-align: center;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Account Application Submitted</h1>
        <%
            String accountType = (String)request.getAttribute("accountType");
            BmBankManager manager = (BmBankManager)session.getAttribute("manager");
        %>
        <p>Your request for a <b><%=accountType%></b> has been created successfully!</p>
        <p>The Bank will review your application shortly.</p>
        <%if(manager!=null){%><p>Click <a href="bankManagerDashboard.jsp">here</a> to go to the home page</p>
        <%}else{%><p>Click <a href="customer_dashboard.jsp">here</a> to go to the home page</p><%}%>
    </div>
</body>
</html>