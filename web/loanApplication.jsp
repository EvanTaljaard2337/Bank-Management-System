<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Application</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 2em;
                background-color: #f4f4f4; /* matches dashboard background */
            }
            h1 {
                color: #007BFF; /* dashboard primary blue color */
                text-align: center;
            }
            form {
                background: white;
                padding: 20px;
                border-radius: 10px; /* same border radius */
                max-width: 500px;
                margin: 20px auto;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
            label {
                display: block;
                margin-top: 15px;
                font-weight: bold;
                color: #007BFF; /* dashboard heading blue */
            }
            input[type="text"],
            input[type="email"],
            input[type="date"],
            input[type="number"],
            select,
            textarea {
                width: 100%;
                padding: 8px;
                margin-top: 8px;
                border: 1px solid #ccc;
                border-radius: 8px;
                box-sizing: border-box;
                font-size: 14px;
                transition: border-color 0.3s ease;
            }
            input[type="text"]:focus,
            input[type="email"]:focus,
            input[type="date"]:focus,
            input[type="number"]:focus,
            select:focus,
            textarea:focus {
                border-color: #007BFF; /* consistent focus color */
                outline: none;
            }
            textarea {
                resize: vertical;
            }
            button {
                margin-top: 20px;
                background-color: #007BFF;
                color: white;
                border: none;
                padding: 14px 20px;
                border-radius: 8px;
                cursor: pointer;
                font-size: 16px;
                width: 100%;
                transition: background-color 0.3s ease;
            }
            button:hover {
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
        </style>
    </head>
    <body>
        <h1>Loan Application Form</h1>
        <form action="ApplyForLoanServlet.do" method="POST">
            <label for="fullName">Full Name</label>
            <input type="text" id="fullName" name="fullName" required />

            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="dob" required />

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" required />

            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" required />

            <label for="address">Residential Address</label>
            <textarea id="address" name="address" rows="3" required></textarea>

            <label for="loanAmount">Loan Amount Requested (Rand)</label>
            <input type="number" id="loanAmount" name="loanAmount" min="1000" step="100" required />

            <label for="loanType">Type of Loan</label>
            <select id="loanType" name="loanType" required>
                <option value="">-- Please select --</option>
                <option value="personal">Personal Loan</option>
                <option value="home">Home Loan</option>
                <option value="car">Car Loan</option>
                <option value="education">Education Loan</option>
                <option value="business">Business Loan</option>
                <option value="debt">Debt Consolidation Loan</option>
            </select>

            <label for="loanPurpose">Purpose of the Loan</label>
            <select id="loanPurpose" name="loanPurpose" required>
                <option value="">-- Please select --</option>
                <option value="home">Home Renovation</option>
                <option value="car">Car Purchase</option>
                <option value="education">Education</option>
                <option value="business">Business</option>
                <option value="debt">Debt Consolidation</option>
                <option value="other">Other</option>
            </select>

            <label for="employmentStatus">Employment Status</label>
            <select id="employmentStatus" name="employmentStatus" required>
                <option value="">-- Please select --</option>
                <option value="employed">Employed</option>
                <option value="self-employed">Self-Employed</option>
                <option value="unemployed">Unemployed</option>
                <option value="student">Student</option>
                <option value="retired">Retired</option>
            </select>

            <label for="annualIncome">Annual Income (Rand)</label>
            <input type="number" id="annualIncome" name="annualIncome" min="0" step="1000" required />

            <button type="submit">Submit Application</button>
        </form>
    </body>
</html>

