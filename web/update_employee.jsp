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
    <title>Find Employee</title>
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

        .container {
            max-width: 500px;
            margin: 60px auto;
            background-color: #ffffff;
            padding: 35px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #007BFF;
            margin-top: 0;
            margin-bottom: 30px;
            font-size: 26px;
        }

        label {
            font-weight: bold;
            color: #555;
            margin-bottom: 10px;
            display: block;
            font-size: 16px;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        input[type="text"]:focus,
        select:focus {
            border-color: #007BFF;
            outline: none;
        }

        .action-button {
            display: block;
            margin: 0 auto; /* center horizontally */
            color: white;
            background-color: #007BFF;
            text-decoration: none;
            font-weight: bold;
            padding: 10px 20px;
            border: 2px solid white;
            border-radius: 6px;
            transition: background-color 0.3s, color 0.3s;
            font-size: 14px;
            cursor: pointer;
        }

        .action-button:hover {
            background-color: #0056b3; /* fixed hover color */
            color: white;
        }

        .footer-bar {
            background-color: #007BFF;
            color: white;
            text-align: center;
            padding: 10px 20px;
            margin-top: 60px;
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
            .header-logout {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border: 1px solid white;
            border-radius: 4px;
            background: #007BFF;
            transition: background-color 0.3s;
            font-size: 14px;
            cursor: pointer;
        }

        .header-logout:hover {
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
                width: 30%;
                font-weight: bold;
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
    <div class="header">
        <a href="bankManagerDashboard.jsp" class="header-btn">Home</a>
        <h1>Find Employee</h1>
        <form action="logoutServlet.do" method="post">
            <input type="submit" value="Logout" class="header-logout">
        </form>
    </div>
<div class="container">
    <h2>Search Employee</h2>
    <form action="FindEmployeeServlet.do" method="GET">
        <label for="empId">Employee ID Number:</label>
        <input type="text" name="empId" id="empId" required>

        <label for="department">Employee Department:</label>
        <select name="department" id="department" required>
            <option value="" disabled selected>Select department</option>
            <option value="support">Customer Support Agent</option>
            <option value="loanofficer">Loan Officer</option>
            <option value="bankmanager">Bank Manager</option>
            <option value="admin">System Administrator</option>
        </select>
        <div class="button-wrapper">
               <button type="submit" class="submit-btn">Search</button>
         </div>
    </form>
</div>

<div class="footer-bar">
    &copy; 2025 Your Bank Name. All rights reserved.
</div>

</body>
</html>
