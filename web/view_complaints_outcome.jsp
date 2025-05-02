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
                text-align: center;
            }
            .header h1 {
                margin: 0;
                font-size: 24px;
            }
            .container {
                max-width: 1200px;
                margin: 20px auto;
                background: white;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }
            p {
                font-size: 18px;
                color: #555;
                text-align: center;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #007BFF;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>View Complaints Outcome</h1>
        </div>
        <div class="container">
            <p>Below is the list of complaints you requested.</p>
            <table>
                <thead>
                    <tr>
                        <th>Complaint ID</th>
                        <th>Customer ID</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<BmComplaint> complains = (List<BmComplaint>)request.getAttribute("filteredComplaints");
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
                </tbody>
            </table>
        </div>
    </body>
</html>