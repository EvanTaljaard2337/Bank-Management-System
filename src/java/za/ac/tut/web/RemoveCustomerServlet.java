/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.util.Set;
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
public class RemoveCustomerServlet extends HttpServlet {
    @EJB
    private BmCustomerFacadeLocal bcf;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String custID =request.getParameter("userID");
        
        BmCustomer r = bcf.find(Integer.parseInt(custID));
        
        if(r != null){
            try{
                bcf.remove(r);
                request.setAttribute("message","User removed successfully");
            }
            catch(Exception e){
                request.setAttribute("message","Error removing user:"+e.getMessage());
            }
        }
        else{
            request.setAttribute("message","User not found.");
            
        }
        RequestDispatcher disp = request.getRequestDispatcher("delete_user_account.jsp");
        disp.forward(request, response);
    }

}

