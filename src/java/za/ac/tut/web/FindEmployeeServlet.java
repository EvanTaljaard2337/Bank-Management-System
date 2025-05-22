/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmBankManagerFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerSupportAgentFacadeLocal;
import za.ac.tut.ejb.bl.BmLoanOfficerFacadeLocal;
import za.ac.tut.ejb.bl.BmSystemAdministratorFacadeLocal;
import za.ac.tut.entities.BmBankManager;
import za.ac.tut.entities.BmCustomerSupportAgent;
import za.ac.tut.entities.BmLoanOfficer;
import za.ac.tut.entities.BmSystemAdministrator;

/**
 *
 * @author Evan
 */
public class FindEmployeeServlet extends HttpServlet {
    @EJB
    private BmBankManagerFacadeLocal bml;
    @EJB
    private BmCustomerSupportAgentFacadeLocal csfl;
    @EJB
    private BmLoanOfficerFacadeLocal lofl;
    @EJB
    private BmSystemAdministratorFacadeLocal safl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String departments = request.getParameter("department");
        String empId = request.getParameter("empId");
        Integer employeeId = null;
        try {
            if (empId != null && !empId.trim().isEmpty()) {
                Object employee = null;
                employeeId = Integer.parseInt(empId);
                switch (departments) {
                    case "support":
                        employee = csfl.find(employeeId);
                        
                        break;
                    case "loanofficer":
                        employee = lofl.find(employeeId);
                        break;
                    case "bankmanager":
                        employee = bml.find(employeeId);
                        break;
                    case "admin":
                        employee = safl.find(employeeId);
                        break;
                    default:
                        request.setAttribute("errMsg", "Invalid department specified.");
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                        return;
                }

                if (employee != null) {
                    request.setAttribute("employee", employee);
                    request.setAttribute("department", departments);
                    request.getRequestDispatcher("update_employee_page.jsp").forward(request, response);
                } else {
                    request.setAttribute("errMsg", "Employee not found.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errMsg", "Employee ID cannot be empty.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
