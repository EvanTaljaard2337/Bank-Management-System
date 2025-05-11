<%-- 
    Document   : loan_report
    Created on : 03 May 2025, 3:18:15 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Report | Bank Management System</title>
        <style>
            /* Base Styles */
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                color: #333;
                line-height: 1.6;
            }
            
            /* Header Styles */
            .header {
                background: #007BFF;
                color: white;
                padding: 15px 30px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
            
            .header h1 {
                margin: 0;
                font-size: 24px;
                font-weight: 600;
            }
            
            .header a {
                color: white;
                text-decoration: none;
                font-weight: bold;
                padding: 8px 15px;
                border: 1px solid white;
                border-radius: 4px;
                transition: all 0.3s ease;
            }
            
            .header a:hover {
                background-color: rgba(255,255,255,0.2);
                transform: translateY(-1px);
            }
            
            /* Main Container */
            .container {
                max-width: 1200px;
                margin: 30px auto;
                background: white;
                border-radius: 8px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.08);
                padding: 30px;
                overflow: hidden;
            }
            
            /* Report Title */
            .report-title {
                color: #007BFF;
                margin: 0 0 15px 0;
                text-align: center;
                font-size: 28px;
                font-weight: 600;
                border-bottom: 2px solid #007BFF;
                padding-bottom: 10px;
            }
            
            /* Report Message */
            .report-message {
                font-size: 18px;
                color: #555;
                text-align: center;
                margin-bottom: 30px;
            }
            
            /* Report Content */
            .report-content {
                padding: 25px;
                background-color: #f9faff;
                border-radius: 6px;
                border: 1px solid #e0e6ff;
                margin-bottom: 30px;
            }
            
            .report-content p {
                font-size: 16px;
                margin-bottom: 20px;
                color: #444;
            }
            
            /* Placeholder for Data */
            .data-placeholder {
                text-align: center;
                color: #777;
                padding: 40px 0;
                background-color: #f0f4ff;
                border-radius: 4px;
                border: 1px dashed #b8c6ff;
                margin-top: 20px;
            }
            
            /* Navigation Links */
            .nav-links {
                display: flex;
                justify-content: center;
                gap: 20px;
                margin-top: 30px;
            }
            
            .nav-links a {
                display: inline-block;
                padding: 10px 25px;
                background-color: #007BFF;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                font-weight: 600;
                transition: all 0.3s ease;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            
            .nav-links a:hover {
                background-color: #0069d9;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            }
            
            /* Footer */
            .footer {
                text-align: center;
                padding: 20px;
                background: #007BFF;
                color: white;
                font-size: 14px;
                margin-top: 40px;
            }
            
            /* Print Styles */
            @media print {
                .header, .footer, .nav-links {
                    display: none;
                }
                .container {
                    box-shadow: none;
                    margin: 0;
                    padding: 0;
                    border-radius: 0;
                }
                .report-content {
                    border: none;
                    background: none;
                    padding: 0;
                }
            }
            
            /* Responsive Adjustments */
            @media (max-width: 768px) {
                .container {
                    margin: 15px;
                    padding: 20px;
                }
                .header {
                    padding: 15px;
                }
                .nav-links {
                    flex-direction: column;
                    align-items: center;
                }
                .nav-links a {
                    width: 100%;
                    text-align: center;
                    margin-bottom: 10px;
                }
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Loan Report</h1>
            <a href="index.html">Logout</a>
            <%
                int appLoans = (Integer)request.getAttribute("approved");
                int rejLoans = (Integer)request.getAttribute("rejected");
                int pendingLoans = (Integer)request.getAttribute("pending");
            %>
        </div>
        <div class="container">
            <h2 class="report-title">Loan Portfolio Report</h2>
            <p class="report-message">This is your comprehensive loan report</p>
            
            <div class="report-content">
                <p>Report generated on: <strong><%= new java.util.Date() %></strong></p>
                    
                <div class="data-placeholder">
                    <table>
                        <tr>
                            <td>Approved Loans: </td>
                            <td><%=appLoans%></td>
                        </tr>
                        <tr>
                            <td>Rejected Loans: </td>
                            <td><%=rejLoans%></td>
                        </tr>
                         <tr>
                            <td>Pending Loans: </td>
                            <td><%=pendingLoans%></td>
                        </tr>
                        
                    </table>
                </div>
            </div>
            <form method="post" action="DownloadLoanReportServlet.do">
                <button type="submit" style="
                    display: inline-block;
                    padding: 10px 25px;
                    background-color: #007BFF;
                    color: white;
                    border: none;
                    border-radius: 4px;
                    font-weight: 600;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                    margin: 20px auto;
                    display: block;
                "
                onmouseover="this.style.backgroundColor='#0069d9'; this.style.transform='translateY(-2px)'; this.style.boxShadow='0 4px 8px rgba(0,0,0,0.15)'"
                onmouseout="this.style.backgroundColor='#007BFF'; this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 5px rgba(0,0,0,0.1)'"
                >
                    Download Report as Text File
                </button>
</form>

            <div class="nav-links">
                <a href="loanOfficerDashboard.jsp">Back to Dashboard</a>
                <a href="index.html">Home Page</a>
            </div>
        </div>
        <div class="footer">
            &copy; 2025 Your Bank Name | Loans Department
        </div>
    </body>
</html>