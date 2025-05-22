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
                box-shadow: 0 2px 6px rgba(0,0,0,0.2);
            }

            .header h1 {
                margin: 0;
                font-size: 24px;
                flex-grow: 1; /* Allow the title to take up available space */
                text-align: center; /* Center the title */
            }

        .logout-button {
            color: white;
            background-color: #007BFF;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border: 1px solid white;
            border-radius: 4px;
            transition: background-color 0.3s;
            font-size: 14px;
            cursor: pointer;
        }
        .logout-button:hover {
            background-color: rgba(255,255,255,0.2);
            color: white;
        }

        .container {
            max-width: 800px;
            margin: 30px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #007BFF;
            font-size: 26px;
            margin-bottom: 30px;
        }


        .filter-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-weight: bold;
            color: #555;
            margin-bottom: 10px;
            display: block;
            font-size: 16px;
        }

        select, input[type="date"] {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
            width: 100%;
        }

        .button-wrapper {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .button-wrapper button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button-wrapper button:hover {
            background-color: #0056b3;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background: #007BFF;
            color: white;
            font-size: 14px;
            margin-top: 40px;
        }
            .header-btn {
                color: white;
                text-decoration: none;
                font-weight: bold;
                padding: 8px 15px;
                border: 1px solid white;
                border-radius: 4px;
                transition: background-color 0.3s;
                margin-left: 10px; /* Add some space between the title and the button */
            }

            .header-btn:hover {
                background-color: rgba(255,255,255,0.2);
            }        
    </style>
</head>
<body>
    <div class="header">
        <a href="bankManagerDashboard.jsp" class="header-btn">Home</a>
        <h1>Complaint Report</h1>
        <a href="index.html" class="header-btn">Logout</a>
    </div>
    <div class="container">
        <h2>Generate Complaint Report</h2>
        <form action="ComplaintReportServlet.do" method="get" class="filter-form">
            <div>
                <label for="status">Status:</label>
                <select name="status" id="status">
                    <option value="">All</option>
                    <option value="Pending">Pending</option>
                    <option value="Open">Open</option>
                    <option value="In Progress">In Progress</option>
                    <option value="Resolved">Resolved</option>
                </select>
            </div>

            <div>
                <label for="startDate">Start Date:</label>
                <input type="date" id="startDate" name="startDate" required max="" />
            </div>

            <div>
                <label for="endDate">End Date:</label>
                <input type="date" id="endDate" name="endDate" required max="" />
            </div>

            <div class="button-wrapper">
                <button type="submit">Generate Report</button>
            </div>
        </form>
    </div>

    <div class="footer">
        &copy; 2025 Your Bank Name | Manager Portal
    </div>

    <script>
        const today = new Date().toISOString().split('T')[0];
        document.getElementById("startDate").setAttribute("max", today);
        document.getElementById("endDate").setAttribute("max", today);
    </script>
</body>
</html>
