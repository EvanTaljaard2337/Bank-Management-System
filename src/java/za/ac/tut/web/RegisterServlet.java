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
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.entities.BmBankManager;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author Evan
 */
public class RegisterServlet extends HttpServlet {
    @EJB 
    private BmCustomerFacadeLocal af1;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        BmBankManager manager = (BmBankManager)session.getAttribute("manager");
        
        String source = request.getParameter("source");
        String fullName = request.getParameter("fullName");
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String formatedPhone = "";
        if(phone!=null){
            formatedPhone=formatPhone(phone);
        }
        else{
            request.setAttribute("errMsg", "Your phone number was not provided!");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request,response);
        }
        try{
            if(source.equals("manager") && source!=null){
                BmCustomer c = register(fullName,email,password,address,phone,id);
                af1.create(c);

                session.setAttribute("manager",manager);
                request.setAttribute("manager",manager);
                session.setAttribute("customer",c);
                request.setAttribute("customer",c);
                RequestDispatcher disp = request.getRequestDispatcher("add_customer_outcome.jsp");
                disp.forward(request,response);
            }
            else{
                BmCustomer c = register(fullName,email,password,address,phone,id);
                af1.create(c);

                session.setAttribute("customer",c);
                request.setAttribute("customer",c);
                RequestDispatcher disp = request.getRequestDispatcher("customer_dashboard.jsp");
                disp.forward(request,response);
            }
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg",e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
    }
    private BmCustomer register(String fullName,String email,String password,String address,String phone,String id){
        BmCustomer c = new BmCustomer();
        c.setBAddress(address);
        c.setBCustomerid(Integer.parseInt(id));
        c.setBEmail(email);
        c.setBFullname(fullName);
        c.setBPassword(password);
        c.setBPhone(phone);
        return c;
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

