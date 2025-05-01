<%-- 
    Document   : view_loans
    Created on : 07 Apr 2025, 7:52:27 PM
    Author     : thand
--%>

<%@page import="javax.ejb.EJB"%>
<%@page import="za.ac.tut.ejb.bl.BmLoanFacadeLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Loans Page</title>
    </head>
    <body>
        <h1>View Loans</h1>
        <p>
            Filter the list by selecting a status below.
        </p>
        <form action="ViewLoansServlet.do" method="GET">
            <table>
                <tr>
                    <td>Filter By: </td>
                    <td>
                        <select name="filter">
                            <option value="pending">Pending</option>
                            <option value="approved">Approved</option>
                            <option value="rejected">Rejected</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="VIEW"/></td>
                </tr>
            </table>
        </form>
        <br>
        <p>
            Filter list by selecting the number of loans to view.
        </p>
        <form action="ViewANumberOfLoansServlet.do" method="GET">
            <table>
                <tr>
                    <td>Filter by: </td>
                    <td>
                        <input 
                            type="range" 
                            min="1" 
                            max="50" 
                            name="num" 
                            id="loanRange" 
                            oninput="document.getElementById('rangeValue').textContent = this.value" 
                        />
                        <!-- Display the current value dynamically -->
                        <span id="rangeValue">25</span> <!-- Default value to match slider -->
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="VIEW" /></td>
                </tr>
            </table>
        </form>
        <ul>
            <li><a href="index.html">Login page.</a></li>
            <li><a href="loanOfficerDashboard.jsp">Dashboard</a></li>
        </ul>
    </body>
</html>
