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
    <title>Find Customer Account</title>
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


        .welcome-msg {
            font-size: 16px;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            background: white;
            border-radius: 12px;
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

        label {
            font-weight: bold;
            color: #555;
            margin-bottom: 10px;
            display: block;
            font-size: 16px;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            margin-bottom: 25px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #0056b3;
            outline: none;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            flex-wrap: wrap;
        }

        input[type="submit"],
        .home-button {
            flex: 1;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #007BFF;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 123, 255, 0.4);
            text-decoration: none;
        }

        input[type="submit"]:hover,
        .home-button:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 12px rgba(0, 86, 179, 0.6);
        }
        
        .error-message {
            color: #e74c3c;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }

        .footer-bar {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            text-align: center;
            margin-top: 60px;
        }

        @media (max-width: 480px) {
            .button-group {
                flex-direction: column;
            }
        }
        input[type="submit"],
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

        input[type="submit"]:hover,
        .header-logout:hover {
            background-color: rgba(255,255,255,0.2);
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
        <h1>Update Customer Account</h1>
        <form action="logoutServlet.do" method="post">
            <input type="submit" value="Logout" class="header-logout">
        </form>
    </div>
    
    <div class="container">
        <h2>Find Customer Account</h2>

        <form method="POST" action="FindCustomerAccountServlet.do">
            <label for="accountNumber">Insert Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required />

            <div class="button-wrapper">
                <button type="submit" class="submit-btn">Submit</button>  
            </div>
        </form>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <p class="error-message"><%= error %></p>
        <% } %>
    </div>

    <div class="footer-bar">
        &copy; 2025 Your Bank Name. All rights reserved.
    </div>

</body>
</html>
