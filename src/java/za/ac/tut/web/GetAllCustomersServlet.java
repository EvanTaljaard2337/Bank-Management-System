/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.entities.BmBankManager;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author Evan
 */
public class GetAllCustomersServlet extends HttpServlet {
    @EJB
    private BmCustomerFacadeLocal cfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        BmBankManager manager = (BmBankManager)session.getAttribute("manager");
        String customerIdStr = request.getParameter("customerId");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");

        Integer customerId = null;
        try {
            if (customerIdStr != null && !customerIdStr.trim().isEmpty()) {
                customerId = Integer.parseInt(customerIdStr.trim());
            }
        } catch (NumberFormatException e) {
            // Optional: handle invalid number format, maybe set error message
            request.setAttribute("errMsg", "Invalid Customer ID format.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        try {
            List<BmCustomer> filteredCustomers = filterCustomer(customerId, fullName, email);
            session.setAttribute("manager", manager);
            request.setAttribute("customers", filteredCustomers);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view_customers_results.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
    }

    private List<BmCustomer> filterCustomer(Integer customerId, String fullName, String email) {
        List<BmCustomer> result = new ArrayList<>();

        if (customerId != null) {
            BmCustomer c = cfl.find(customerId);
            if (c != null) result.add(c);
            return result;
        }

        if (fullName != null && !fullName.trim().isEmpty()) {
            BmCustomer c = cfl.findFullName(fullName.trim());
            if (c != null) result.add(c);
            return result;
        }

        if (email != null && !email.trim().isEmpty()) {
            BmCustomer c = cfl.findByEmail(email.trim());
            if (c != null) result.add(c);
            return result;
        }

        // No filters provided: return all customers
        return cfl.findAll();
    }

}
