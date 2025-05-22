<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    BmBankManager m = (BmBankManager)session.getAttribute("manager");
    if (m == null || m.getBFullname() == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Employees</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .header-bar {
            background-color: #007BFF;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-title {
            font-size: 22px;
            margin: 0;
            text-align: center; /* Center the title */
        }

        .welcome-msg {
            font-size: 16px;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 35px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 30px;
            font-size: 26px;
        }

        label {
            font-weight: bold;
            color: #555;
            margin-top: 15px;
            display: block;
            font-size: 16px;
        }

        select,
        input[type="text"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        select:focus,
        input[type="text"]:focus {
            outline: none;
            border-color: #007BFF;
        }

        .btn {
            margin-top: 30px;
            width: 100%;
            padding: 14px;
            background: #007BFF;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 123, 255, 0.4);
        }

        .btn:hover {
            background: #0056b3;
            box-shadow: 0 4px 12px rgba(0, 86, 179, 0.5);
        }

        .footer-bar {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            text-align: center;
            margin-top: 60px;
        }
        .logout-btn {
            background-color: #007BFF;
            color: white;
            border: 1px solid white;
            border-radius: 4px;
            padding: 8px 15px;
            font-weight: bold;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: rgba(255, 255, 255, 0.2);
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
            .submit-btn {
                background: #007BFF;
                color: white;
                border: none;
                padding: 12px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                width: 30%;
                transition: background-color 0.3s;
            }
            .submit-btn:hover {
                background-color: #0056b3;
            }
            .button-wrapper {
                display: flex;
                justify-content: center; /* Center the button horizontally */
                margin-top: 20px; /* Optional: Add some space above the button */
            }            
    </style>
</head>
<body>

<div class="header-bar">
    <a href="bankManagerDashboard.jsp" class="header-btn">Home</a>
    <h2 class="header-title">View Employees</h2>
    <form action="logoutServlet.do" method="POST" style="margin: 0;">
        <input type="submit" value="Logout" class="logout-btn">
    </form>
</div>

<div class="container">
    <h1>Employee Lookup</h1>
    <form action="ViewEmployeesServlet.do" method="GET">
        <label for="department">Select Department</label>
        <select name="department" id="department" required>
            <option value="" disabled selected>Select role</option>
            <option value="support">Customer Support Agent</option>
            <option value="loanofficer">Loan Officer</option>
            <option value="bankmanager">Bank Manager</option>
            <option value="admin">System Administrator</option>
        </select>

        <label for="empId">Employee ID</label>
        <input type="text" name="empId" id="empId" placeholder="Optional – leave blank to view all" />

        <div class="button-wrapper">
               <button type="submit" class="submit-btn">View</button>
        </div>
    </form>
</div>

<div class="footer-bar">
    &copy; 2025 Your Bank Name. All rights reserved.
</div>

</body>
</html>
