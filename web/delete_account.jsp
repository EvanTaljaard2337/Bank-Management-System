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
    <meta charset="UTF-8" />
    <title>Delete User Account</title>
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
        .header a.logout-link {
            color: white;
            background-color: #007BFF;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border: 1px solid white;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            font-size: 14px;
            cursor: pointer;
        }
        .header a.logout-link:hover {
            background-color: rgba(255,255,255,0.2);
        }
        .container {
            max-width: 450px;
            margin: 40px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
            box-sizing: border-box;
        }
        h2 {
            text-align: center;
            color: #007BFF;
            margin-top: 0;
            margin-bottom: 30px;
            font-size: 26px;
        }
        label {
            display: block;
            font-weight: bold;
            color: #555;
            margin-bottom: 10px;
            font-size: 16px;
        }
        input[type="text"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
            margin-bottom: 25px;
        }
        input[type="text"]:focus {
            border-color: #0056b3;
            outline: none;
        }
        input[type="submit"] {
            width: 100%;
            padding: 14px;
            font-size: 18px;
            font-weight: 700;
            color: white;
            background-color: #007BFF;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 2px 6px rgba(0, 123, 255, 0.4);
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 12px rgba(0, 86, 179, 0.6);
        }
        .back-link {
            display: block;
            margin-top: 25px;
            width: 100%;
            text-align: center;
            font-weight: 700;
            color: white;
            background-color: #007BFF;
            padding: 12px 0;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 123, 255, 0.4);
            cursor: pointer;
        }
        .back-link:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 12px rgba(0, 86, 179, 0.6);
            text-decoration: none;
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
                width: 50%;
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
    <h1>Delete User Account</h1>
    <a href="index.html" class="logout-link">Logout</a>
</div>

<div class="container">
    <h2>Remove Customer Account</h2>
    <form action="RemoveAccountServlet.do" method="POST">
        <label for="customerAccount">Insert Customer Account ID:</label>
        <input type="text" name="customerAccount" id="customerAccount" required />
        <div class="button-wrapper">
            <button type="submit" class="submit-btn">Delete Account</button>
        </div>
    </form>
</div>

<div class="footer">
    &copy; 2025 Bank Management System | All rights reserved.
</div>

</body>
</html>
