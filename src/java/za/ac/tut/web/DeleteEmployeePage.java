package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import za.ac.tut.ejb.bl.*;
import za.ac.tut.entities.*;

/**
 * Servlet to delete an employee based on ID and department.
 */
public class DeleteEmployeePage extends HttpServlet {

    @EJB
    private BmBankManagerFacadeLocal bml;

    @EJB
    private BmCustomerSupportAgentFacadeLocal csfl;

    @EJB
    private BmLoanOfficerFacadeLocal lofl;

    @EJB
    private BmSystemAdministratorFacadeLocal safl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Integer empId = Integer.parseInt(request.getParameter("empId"));
            String department = request.getParameter("department");

            boolean deleted = false;

            switch (department.toLowerCase()) {
                case "support":
                    BmCustomerSupportAgent support = csfl.find(empId);
                    if (support != null) {
                        csfl.remove(support);
                        deleted = true;
                    }
                    break;

                case "loanofficer":
                    BmLoanOfficer officer = lofl.find(empId);
                    if (officer != null) {
                        lofl.remove(officer);
                        deleted = true;
                    }
                    break;

                case "bankmanager":
                    BmBankManager manager = bml.find(empId);
                    if (manager != null) {
                        bml.remove(manager);
                        deleted = true;
                    }
                    break;

                case "admin":
                    BmSystemAdministrator admin = safl.find(empId);
                    if (admin != null) {
                        safl.remove(admin);
                        deleted = true;
                    }
                    break;

                default:
                    request.setAttribute("errMsg", "Unknown department type.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    return;
            }

            if (deleted) {
                request.setAttribute("message", "Employee successfully deleted.");
                RequestDispatcher disp = request.getRequestDispatcher("delete_emp_success_page.jsp");
                disp.forward(request, response);
            } else {
                request.setAttribute("errMsg", "Employee not found with given ID.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errMsg", "Invalid employee ID.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errMsg", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
