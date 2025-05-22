<%@page import="za.ac.tut.entities.BmBankManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>View Customers</title>
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
            max-width: 600px;
            margin: 40px auto;
            background: white;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        h2 {
            margin-top: 0;
            text-align: center;
            color: #007BFF;
            font-size: 26px;
            margin-bottom: 30px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: bold;
            color: #555;
            margin-top: 15px;
            display: block;
            font-size: 16px;
        }
        input[type="text"] {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        input[type="submit"] {
            margin-top: 25px;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
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
        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 30px 20px;
            }
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
<%
    BmBankManager m = (BmBankManager) session.getAttribute("manager");
    if (m == null || m.getBFullname() == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
    <div class="header">
        <a href="bankManagerDashboard.jsp" class="header-btn">Home</a>
        <h1>View Customers</h1>
        <a href="index.html">Logout</a>
    </div>
<div class="container">
    <h2>Search for customers</h2>
    <form action="GetAllCustomersServlet.do" method="GET">
        <label for="customerId">Customer ID:</label>
        <input type="text" name="customerId" id="customerId" />

        <label for="fullName">Full Name:</label>
        <input type="text" name="fullName" id="fullName" />

        <label for="email">Email:</label>
        <input type="text" name="email" id="email" />

        <div class="button-wrapper">
            <button type="submit" class="submit-btn">Filter</button>
        </div>
    </form>
</div>

<div class="footer">
    &copy; 2025 Bank Management System | All rights reserved.
</div>

</body>
</html>
