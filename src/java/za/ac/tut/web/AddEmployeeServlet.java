/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
public class AddEmployeeServlet extends HttpServlet {
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
        
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        String formatedNumer = "";
                // Check if email exists already
        if(phone!=null){
            formatedNumer=formatPhone(phone);
        }
        else{
            request.setAttribute("error", "The phone number is invalid.");
            request.getRequestDispatcher("add_employee.jsp").forward(request, response);
            return;
        }
        if (emailExists(email, role)) {
            request.setAttribute("error", "An employee with this email already exists.");
            request.getRequestDispatcher("add_employee.jsp").forward(request, response);
            return;
        }
        try{
            registerEmployee(fullName,email,formatedNumer,password,role);
            request.setAttribute("message", "Employee registered successfully!");
            RequestDispatcher disp = request.getRequestDispatcher("employee_created.jsp");
            disp.forward(request, response);
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
    }
    private void registerEmployee(String fullName,String email,String phone,String password,String role){
        switch (role) {
            case "support":
                BmCustomerSupportAgent agent =addSupportAgent(fullName,email,phone,password);
                csfl.create(agent);
                break;
            case "loanofficer":
                BmLoanOfficer loanOfficer = addLoanOfficer(fullName,email,phone,password);
                lofl.create(loanOfficer);
                break;
            case "bankmanager":
                BmBankManager manager = addManager(fullName,email,phone,password);
                bml.create(manager);
                break;
            case "admin":
                BmSystemAdministrator admin =addAdministrator(fullName,email,phone,password);
                safl.create(admin);
                break;
            default:
                break;
        }
    }
    private BmBankManager addManager(String fullName,String email,String phone,String password){
        BmBankManager manager = new BmBankManager();
        manager.setBEmail(email);
        manager.setBFullname(fullName);
        manager.setBPhone(phone);
        manager.setbPassword(password);
        return manager;
    }
    private BmCustomerSupportAgent addSupportAgent(String fullName,String email,String phone,String password){
        BmCustomerSupportAgent agent = new BmCustomerSupportAgent();
        agent.setBEmail(email);
        agent.setBFullname(fullName);
        agent.setBPhone(phone);
        agent.setbPassword(password);
        return agent;
    }
    private BmLoanOfficer addLoanOfficer(String fullName,String email,String phone,String password){
        BmLoanOfficer loanOfficer = new BmLoanOfficer();
        loanOfficer.setBEmail(email);
        loanOfficer.setBFullname(fullName);
        loanOfficer.setBPhone(phone);
        loanOfficer.setbPassword(password);
        return loanOfficer;
    }
    private BmSystemAdministrator addAdministrator(String fullName,String email,String phone,String password){
        BmSystemAdministrator admin = new BmSystemAdministrator();
        admin.setBEmail(email);
        admin.setBFullname(fullName);
        admin.setBPhone(phone);
        admin.setBPassword(password);
        return admin;
    }
    private boolean emailExists(String email, String role) {
        switch (role.toLowerCase()) {
            case "support":
                return csfl.findByEmail(email) != null;
            case "loanofficer":
                return lofl.findByEmail(email) != null;
            case "bankmanager":
                return bml.findByEmail(email) != null;
            case "admin":
                return safl.findByEmail(email) != null;
            default:
                return false;
        }
    }
    private String formatPhone(String phone) {
        StringBuilder formattedNumber = new StringBuilder();
        for (int i = 0; i < phone.length(); i++) {
            formattedNumber.append(phone.charAt(i));
            if (i == 2 || i == 5) {
                formattedNumber.append("-");
            }
        }
        return formattedNumber.toString();
    }
}