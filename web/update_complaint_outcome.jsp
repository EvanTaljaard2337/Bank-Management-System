<%-- 
    Document   : update_complaint_outcome
    Created on : 07 Apr 2025, 10:47:22 PM
    Author     : thand
--%>

<%@page import="za.ac.tut.entities.BmComplaint"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Complaint Outcome Page</title>
    </head>
    <body>
        <h1>Update complaint outcome</h1>
        <%
            BmComplaint complaint = (BmComplaint)request.getAttribute("complaint");
        %>
        <p>
            Below is updated complaint.
        </p>
        <table>
            <th>Complaint ID</th>
            <th>Customer ID</th>
            <th>Description</th>
            <th>Status</th>
            <th>Date</th>
            <tr>
                <td><%=complaint.getBComplaintid()%></td>
                <td><%=complaint.getBCustomerid().getBCustomerid()%></td>
                <td><%=complaint.getBDescription()%></td>
                <td><%=complaint.getBStatus()%></td>
                <td><%=complaint.getBCreatedat()%></td>
            </tr>
        </table>
    </body>
</html>
