<%@page import="za.ac.tut.entities.BmComplaint"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaints Submitted by Customer</title>
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
            .home-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #007BFF;
                text-decoration: none;
                font-weight: bold;
            }
            .home-link:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>My Submitted Complaints</h1>
        </div>
        <div class="container">
            <%
                // Retrieve the list of complaints from the session
                List<BmComplaint> complaints = (List<BmComplaint>)session.getAttribute("complaints");
                
                if (complaints != null && !complaints.isEmpty()) {
            %>
            <table>
                <tr>
                    <th>Complaint ID</th>
                    <th>Status</th>
                    <th>Date Created</th>
                    <th>Description</th>
                </tr>
                <%
                    // Iterate over the list of complaints and display each one
                    for (BmComplaint complaint : complaints) {
                %>
                <tr>
                    <td><%= complaint.getBComplaintid() %></td>
                    <td><%= complaint.getBStatus() %></td>
                    <td><%= complaint.getBCreatedat() %></td>
                    <td><%= complaint.getBDescription() %></td> <!-- Assuming you have a description field -->
                </tr>
                <%
                    }
                %>
            </table>
            <%
                } else {
            %>
            <p>No complaints found. Please check your submission or contact support.</p>
            <%
                }
            %>
            <p><a class="home-link" href="customer_dashboard.jsp">Home</a></p>
        </div>
    </body>
</html>