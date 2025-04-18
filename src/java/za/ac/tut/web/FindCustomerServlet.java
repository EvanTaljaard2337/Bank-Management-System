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
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author Evan
 */
public class FindCustomerServlet extends HttpServlet {
    @EJB
    private BmCustomerFacadeLocal bcf;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer custId = Integer.parseInt(request.getParameter("custId"));
        
        BmCustomer bmc = bcf.find(custId);
        request.setAttribute("customer",bmc);
        
        RequestDispatcher disp = request.getRequestDispatcher("display_customer_account.jsp");
        disp.forward(request,response);
    }
}
