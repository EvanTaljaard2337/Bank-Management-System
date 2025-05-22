/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author Evan
 */
public class UpdateCustomerServlet extends HttpServlet {
    @EJB
    private BmCustomerFacadeLocal cfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                try {
            // 1. Get parameters
            Integer customerId = Integer.parseInt(request.getParameter("customerId"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");

            // 2. Find existing customer
            BmCustomer customer = cfl.find(customerId);

            if (customer != null) {
                // 3. Update fields
                customer.setBFullname(fullName);
                customer.setBEmail(email);
                customer.setBAddress(address);
                customer.setBPhone(phone);

                // 4. Persist changes
                cfl.edit(customer);

                // 5. Redirect or forward to confirmation
                request.setAttribute("successMsg", "Customer updated successfully.");
                request.getRequestDispatcher("update_customer_outcome.jsp").forward(request, response);
            } else {
                request.setAttribute("errMsg", "Customer not found.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("errMsg", "Error updating customer: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
