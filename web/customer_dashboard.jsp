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
        <title>Customer Created Page</title>
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
            }
            .header h1 {
                margin: 0;
                font-size: 24px;
            }
            .header a {
                color: white;
                text-decoration: none;
                font-weight: bold;
            }
            .container {
                display: flex;
                padding: 20px;
                max-width: 1200px;
                margin: 20px auto;
                background: white;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .sidebar {
                flex: 1;
                padding: 20px;
                border-right: 1px solid #ddd;
            }
            .sidebar h2 {
                color: #007BFF;
                margin-bottom: 20px;
            }
            .sidebar p {
                margin: 10px 0;
            }
            .sidebar a {
                color: #007BFF;
                text-decoration: none;
                font-weight: bold;
            }
            .sidebar a:hover {
                text-decoration: underline;
            }
            .content {
                flex: 2;
                padding: 20px;
            }
            .content h2 {
                color: #333;
            }
        </style>
    </head>
    <body>
            <%

                BmCustomer c = (BmCustomer)session.getAttribute("customer");  
                
            %>
        <div class = "header">
            <h1>Welcome, <%=c.getBFullname()%></h1>
            <a href="index.html">Logout</a>
        </div>
        <div class="container">
            <div class="sidebar">
                <h2>Actions</h2>
                <p><a href="transfer.jsp">Transfer funds</a></p>
                <p><a href="complaint.jsp">complaints</p>
            </div>
        </div>
    </body>
</html>
