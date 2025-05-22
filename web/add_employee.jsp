<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 0;
            margin: 0;
            background: #f4f4f4;
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
            text-decoration: none;
            font-weight: bold;
            padding: 8px 15px;
            border: 1px solid white;
            border-radius: 4px;
        }

        .header a:hover {
            background-color: rgba(255,255,255,0.2);
        }

        .container {
            max-width: 500px;
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


        .message {
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 5px;
            font-weight: bold;
            text-align: center;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        form label {
            font-weight: bold;
            color: #555;
            margin-top: 15px;
            display: block;
            font-size: 16px;
        }

        form input,
        form select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background: #007BFF;
            color: white;
            border: none;
            padding: 12px;
            font-weight: bold;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
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
        <h1>Add New Employee</h1>
        <a href="index.html">Logout</a>
    </div>

    <div class="container">
        <h2>Add Employee</h2>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
                String type = (String) request.getAttribute("type"); // optional: "error" or "success"
                String cssClass = "message " + ("error".equals(type) ? "error" : "success");
        %>
            <div class="<%=cssClass%>"><%=message%></div>
        <%
            }
        %>

        <form method="POST" action="AddEmployeeServlet.do">
            <label for="fullName">Full Name:</label>
            <input type="text" name="fullName" id="fullName" placeholder="Enter full name" required />

            <label for="email">Email:</label>
            <input type="email" name="email" id="email" placeholder="Enter email" required />

            <label for="phone">Phone:</label>
            <input type="tel" name="phone" id="phone" placeholder="Enter phone number" required />

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" placeholder="Enter password" required />

            <label for="role">Employee Role:</label>
            <select name="role" id="role" required>
                <option value="" disabled selected>Select role</option>
                <option value="support">Customer Support Agent</option>
                <option value="loanofficer">Loan Officer</option>
                <option value="bankmanager">Bank Manager</option>
                <option value="admin">System Administrator</option>
            </select>
            <div class="button-wrapper">
                <button type="submit" class="submit-btn">Add Employee</button>
             </div>
        </form>
    </div>

    <div class="footer">
        &copy; 2025 Your Bank Name | Manager Portal
    </div>
</body>
</html>
