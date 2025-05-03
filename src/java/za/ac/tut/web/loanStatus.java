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
import javax.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmLoanFacadeLocal;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmLoan;

/**
 *
 * @author Evan
 */
public class loanStatus extends HttpServlet {
    @EJB
    private BmLoanFacadeLocal lfl;
    @EJB
    private BmCustomerFacadeLocal cfl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            //HttpSession session = request.getSession();
            Integer customerId = Integer.parseInt(request.getParameter("customerId"));
            BmCustomer customer = cfl.find(customerId);
            List<BmLoan> loans = lfl.findLoansByCustId(customer);
            
            request.setAttribute("loans",loans);
            RequestDispatcher disp = request.getRequestDispatcher("customer_loan_list.jsp");
            disp.forward(request,response);
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            RequestDispatcher dips = request.getRequestDispatcher("error.jsp");
            dips.forward(request,response);
        }
    }
}
