/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author Michael
 */
public class CustomerDashboardServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        BmCustomer c = (BmCustomer)session.getAttribute("customer");
        
        request.setAttribute("customer", c);
        RequestDispatcher disp = request.getRequestDispatcher("customer_dashboard.jsp");
        disp.forward(request, response);
        
    }

}
