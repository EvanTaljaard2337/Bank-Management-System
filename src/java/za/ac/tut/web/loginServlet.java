/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.rmi.server.Dispatcher;
import za.ac.tut.ejb.bl.BmBankManagerFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerSupportAgentFacadeLocal;
import za.ac.tut.ejb.bl.BmLoanOfficerFacadeLocal;
import za.ac.tut.ejb.bl.BmSystemAdministratorFacadeLocal;
import za.ac.tut.entities.BmBankManager;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmCustomerSupportAgent;
import za.ac.tut.entities.BmLoanOfficer;
import za.ac.tut.entities.BmSystemAdministrator;

/**
 *
 * @author Evan
 */
public class loginServlet extends HttpServlet {
    @EJB
    private BmCustomerFacadeLocal bcr;
    @EJB
    private BmSystemAdministratorFacadeLocal bsa;
    @EJB
    private BmBankManagerFacadeLocal bbm;
    @EJB 
    private BmCustomerSupportAgentFacadeLocal bcs;
    @EJB 
    private BmLoanOfficerFacadeLocal blo;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String email = request.getParameter("email");
        String userPassword = request.getParameter("password");
        
        try{
            BmCustomer customer = bcr.findByEmailAndPassword(email, userPassword);
            BmSystemAdministrator admin = bsa.findByEmailAndPassword(email, userPassword);//null pointer exception occurs
            BmBankManager manager = bbm.findByEmailAndPassword(email, userPassword);
            BmCustomerSupportAgent support = bcs.findByEmailAndPassword(email, userPassword);
            BmLoanOfficer officer = blo.findByEmailAndPassword(email, userPassword);
            
            if(customer != null){
                request.setAttribute("customer",customer);
                session.setAttribute("customer",customer);
                RequestDispatcher disp = request.getRequestDispatcher("customer_dashboard.jsp");
                disp.forward(request, response);
            }
            else if(admin != null){
                request.setAttribute("admin",admin);
                session.setAttribute("admin",admin);
                RequestDispatcher disp = request.getRequestDispatcher("adminDashboard.jsp");
                disp.forward(request, response);
            }
            else if(manager != null){
                request.setAttribute("manager",manager);
                session.setAttribute("manager",manager);
                RequestDispatcher disp = request.getRequestDispatcher("bankManagerDashboard.jsp");
                disp.forward(request, response);
            }
            else if(support != null){
                request.setAttribute("support",support);
                session.setAttribute("support",support);
                RequestDispatcher disp = request.getRequestDispatcher("supportAgentDashboard.jsp");
                disp.forward(request, response);
            }
            else if(officer != null){
                request.setAttribute("officer",officer);
                session.setAttribute("officer",officer);
                RequestDispatcher disp = request.getRequestDispatcher("loanOfficerDashboard.jsp");
                disp.forward(request, response);
            }
            else{
                request.setAttribute("errMsg","Invalid email or password");
                RequestDispatcher disp = request.getRequestDispatcher("index.html");
                disp.forward(request, response);
            }
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg",e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
    }
}
