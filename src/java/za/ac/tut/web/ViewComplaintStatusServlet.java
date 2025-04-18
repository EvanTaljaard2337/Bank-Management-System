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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.BmComplaintFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.entities.BmComplaint;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author Evan
 */
@WebServlet("/viewComplaintStatus")
public class ViewComplaintStatusServlet extends HttpServlet {
    @EJB
    private BmComplaintFacadeLocal bcm;
    @EJB 
    private BmCustomerFacadeLocal bcl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();    
        BmCustomer c = (BmCustomer)session.getAttribute("customer"); 
        String custName = c.getBFullname();
        
        BmCustomer customer = cust(custName);        
       // Integer id =customer.getBCustomerid();
          
        List<BmComplaint> complaintList = bcm.findByCustomerId(customer);
        
        session.setAttribute("complaints",complaintList);
        RequestDispatcher disp = request.getRequestDispatcher("view_complaint.jsp");
        disp.forward(request, response);
    }
    private BmCustomer cust(String custName){
        return bcl.findIdByName(custName);
    }
 
}
