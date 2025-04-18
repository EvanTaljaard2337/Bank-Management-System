<%-- 
    Document   : display_customer_account
    Created on : 05 Apr 2025, 16:09:43
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmCustomer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Customer Details Page</title>
               <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }
            h1 {
                color: #333;
                text-align: center;
            }
            p {
                font-size: 16px;
                line-height: 1.5;
                text-align: center;
            }
            table {
                width: 50%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }
            td:first-child {
                font-weight: bold;
                background-color: #f9f9f9;
            }
            a {
                display: block;
                text-align: center;
                margin-top: 20px;
                text-decoration: none;
                color: #007BFF;
                font-weight: bold;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <h1>Customer summary:</h1>
        <%
            BmCustomer bmc = (BmCustomer)request.getAttribute("customer");
            Integer custId = bmc.getBCustomerid();
            String fullName = bmc.getBFullname();
            String email = bmc.getBEmail();
            String address = bmc.getBAddress();
            String phone = bmc.getBPhone();
        %>
        <p>
            Below are the details of the customer.
        </p>
        <table>
                <tr>
                    <td>Customer ID:</td>
                    <td><%=custId%></td>
                </tr>
                <tr>
                    <td>Full Name:</td>
                    <td><%=fullName%></td>
                </tr>
                <tr>
                    <td>Email Address:</td>
                    <td><%=email%></td>
                </tr>
                                <tr>
                    <td>Address:</td>
                    <td><%=address%></td>
                </tr>
                                <tr>
                    <td>Phone Number:</td>
                    <td><%=phone%></td>
                </tr>
        </table>
        <p>
            <a href="index.html">home</a>      
        </p>
    </body>
</html>
