<%@page import="za.ac.tut.entities.BmComplaint"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Complaint Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
        }
        .filter-form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        label {
            font-weight: bold;
            margin-right: 10px;
        }
        select, input[type="date"] {
            padding: 6px;
            margin-right: 20px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .complaints-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .complaints-table th, .complaints-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        .complaints-table th {
            background-color: #007BFF;
            color: white;
            font-weight: normal;
        }
        .complaints-table tr:last-child td {
            border-bottom: none;
        }
        .no-data {
            padding: 20px;
            font-style: italic;
            color: #666;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <h1>Complaint Report</h1>

    <form action="ComplaintReportServlet.do" method="get" class="filter-form">
        <label for="status">Status:</label>
        <select name="status" id="status">
            <option value="">All</option>
            <option value="Pending">Pending</option>
            <option value="Open">Open</option>
            <option value="In Progress">In Progress</option>
            <option value="Resolved">Resolved</option>
        </select>

        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" required max="" />

        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" required max="" />

        <button type="submit">Generate Report</button>
    </form>
    <script>
        // Get today's date in YYYY-MM-DD format
        const today = new Date().toISOString().split('T')[0];
        document.getElementById("startDate").setAttribute("max", today);
        document.getElementById("endDate").setAttribute("max", today);
    </script>
</body>
</html>

