<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Find User Account</title>
    <style>
        body {
            font-family: bold, sans-serif;
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
        .header a {
            color: white;
            background-color: #007BFF;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border: 1px solid white;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .header a:hover {
            background-color: rgba(255,255,255,0.2);
        }
        .container {
            max-width: 450px;
            margin: 40px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
        }
        h2 {
            text-align: center;
            color: #007BFF;
            margin-top: 0;
            margin-bottom: 30px;
            font-size: 26px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 10px 0;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            font-weight: bold;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .footer {
            background-color: #007BFF;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 40px;
            font-size: 14px;
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
        
        label {
            font-weight: bold;
            color: #555;
            margin-bottom: 10px;
            display: block;
            font-size: 16px;
        }
    </style>
</head>
<body>
<%
    BmBankManager m = (BmBankManager) session.getAttribute("manager");
    if (m == null || m.getBFullname() == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
    <div class="header">
        <a href="bankManagerDashboard.jsp" class="header-btn">Home</a>
         <h1>Find User Account</h1>
        <a href="index.html">Logout</a>
    </div>
<div class="container">
    <h2>Update Customer</h2>

    <form action="FindCustomerServlet.do" method="POST">
        <label for="custId">Insert Customer ID:</label>
        <input type="text" name="custId" id="custId" required />
        <div class="button-wrapper">
            <button type="submit" class="submit-btn">Find</button>
        </div>
    </form>
</div>

<div class="footer">
    &copy; 2025 Bank Management System | All rights reserved.
</div>
</body>
</html>
