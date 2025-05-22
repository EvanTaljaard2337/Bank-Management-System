package za.ac.tut.web;

import java.io.IOException;
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

public class UpdateEmployeeServlet extends HttpServlet {

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
            String fullName = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            // Input validation
            if (fullName == null || fullName.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                phone == null || phone.trim().isEmpty() ||
                department == null || department.trim().isEmpty()) {

                request.setAttribute("errMsg", "All fields are required. Please complete the form.");
                request.getRequestDispatcher("update_employee_page.jsp").forward(request, response);
                return;
            }

            // Department-based update
            switch (department.toLowerCase()) {
                case "support":
                    BmCustomerSupportAgent support = csfl.find(empId);
                    if (support != null) {
                        support.setBFullname(fullName);
                        support.setBEmail(email);
                        support.setBPhone(phone);
                        csfl.edit(support);
                    }
                    break;

                case "loanofficer":
                    BmLoanOfficer officer = lofl.find(empId);
                    if (officer != null) {
                        officer.setBFullname(fullName);
                        officer.setBEmail(email);
                        officer.setBPhone(phone);
                        lofl.edit(officer);
                    }
                    break;

                case "bankmanager":
                    BmBankManager manager = bml.find(empId);
                    if (manager != null) {
                        manager.setBFullname(fullName);
                        manager.setBEmail(email);
                        manager.setBPhone(phone);
                        bml.edit(manager);
                    }
                    break;

                case "admin":
                    BmSystemAdministrator admin = safl.find(empId);
                    if (admin != null) {
                        admin.setBFullname(fullName);
                        admin.setBEmail(email);
                        admin.setBPhone(phone);
                        safl.edit(admin);
                    }
                    break;

                default:
                    request.setAttribute("errMsg", "Unknown department type.");
                    request.getRequestDispatcher("update_employee_page.jsp").forward(request, response);
                    return;
            }

            // Success message
            request.setAttribute("message", "Employee details successfully updated!");
            RequestDispatcher disp = request.getRequestDispatcher("update_emp_success_page.jsp");
            disp.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errMsg", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
