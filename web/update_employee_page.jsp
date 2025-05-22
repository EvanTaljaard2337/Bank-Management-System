<%@page import="za.ac.tut.entities.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #ffffff;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #007BFF;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        .btn {
            margin-top: 25px;
            background: #007BFF;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #0056b3;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            color: #007BFF;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Employee Details</h1>

        <%
            Object emp = request.getAttribute("employee");
            String department = (String)request.getAttribute("department");
            Integer empId = 0;
            String fullName = "";
            String email = "";
            String phone = "";

            if (emp instanceof BmBankManager) {
                BmBankManager m = (BmBankManager)emp;
                empId = m.getBManagerid();
                fullName = m.getBFullname();
                email = m.getBEmail();
                phone = m.getBPhone();
            } else if (emp instanceof BmCustomerSupportAgent) {
                BmCustomerSupportAgent a = (BmCustomerSupportAgent)emp;
                empId = a.getBAgentid();
                fullName = a.getBFullname();
                email = a.getBEmail();
                phone = a.getBPhone();
            } else if (emp instanceof BmLoanOfficer) {
                BmLoanOfficer o = (BmLoanOfficer)emp;
                empId = o.getBOfficerid();
                fullName = o.getBFullname();
                email = o.getBEmail();
                phone = o.getBPhone();
            } else if (emp instanceof BmSystemAdministrator) {
                BmSystemAdministrator sa = (BmSystemAdministrator)emp;
                empId = sa.getBAdminid();
                fullName = sa.getBFullname();
                email = sa.getBEmail();
                phone = sa.getBPhone();
            }
        %>

        <form action="UpdateEmployeeServlet.do" method="post">
            <input type="hidden" name="department" value="<%= department %>">
            <input type="hidden" name="empId" value="<%= empId %>">

            <label>Full Name:</label>
            <input type="text" name="fullname" value="<%= fullName %>" required>

            <label>Email:</label>
            <input type="email" name="email" value="<%= email %>" required>

            <label>Phone:</label>
            <input type="text" name="phone" value="<%= phone %>" required>

            <div style="text-align: center;">
                <button class="btn" type="submit" style="width: 200px;">Update</button>
            </div>
            </form>

            <div style="text-align: center; margin-top: 15px;">
                <form action="bankManagerDashboard.jsp" method="get">
                    <button class="btn" type="submit" style="width: 200px;">Back to Dashboard</button>
                </form>
            </div>
    </div>
</body>
</html>
