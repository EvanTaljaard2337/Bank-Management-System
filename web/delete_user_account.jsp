<%-- 
    Document   : delete_user_account
    Created on : 05 Apr 2025, 14:25:24
    Author     : Evan
--%>

<%@page import="za.ac.tut.entities.BmCustomer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User Acount Page</title>
    </head>
    <body>
        <h1>Remove User Account</h1>
        <%
            //BmCustomer r = (BmCustomer)request.getAttribute("customer");
            String msg = (String)request.getAttribute("message");
        %>
        <p>
            The user with the ID number <b><%=msg%></b> has been successfully removed from the data base.
            Please click <a href ="index.html">here</a> to go back to the home page.
        </p>
    </body>
</html>
