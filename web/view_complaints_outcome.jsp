<%-- 
    Document   : view_complaints_outcome
    Created on : 07 Apr 2025, 10:13:37 PM
    Author     : thand
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.BmComplaint"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Complaints Outcome Page</title>
    </head>
    <body>
        <h1>View Complaints Outcome</h1>
        <%
            List<BmComplaint> complains = (List<BmComplaint>)request.getAttribute("filteredComplaints");
        %>
        <p>
            Below is the list of complaints you requested.
        </p>
        <table>
            <th>Complaint ID</th>
            <th>Customer ID</th>
            <th>Description</th>
            <th>Status</th>
            <th>Date</th>
            <%
                for(BmComplaint c : complains){
                    Integer complaintID = c.getBComplaintid();
                    Integer custID = c.getBCustomerid().getBCustomerid();
                    String desc = c.getBDescription();
                    String status = c.getBStatus();
                    Date date = c.getBCreatedat();
            %>
            <tr>
                <td><%=complaintID%></td>
                <td><%=custID%></td>
                <td><%=desc%></td>
                <td><%=status%></td>
                <td><%=date%></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
