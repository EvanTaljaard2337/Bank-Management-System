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
import za.ac.tut.ejb.bl.BmAccountFacadeLocal;
import za.ac.tut.entities.BmAccount;
import za.ac.tut.entities.BmBankManager;

/**
 *
 * @author Evan
 */
public class RemoveAccountServlet extends HttpServlet {
    @EJB
    private BmAccountFacadeLocal afl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer id = Integer.parseInt(request.getParameter("customerAccount"));
        BmAccount account  = deleteAccount(id);
        BmBankManager m = (BmBankManager)session.getAttribute("manager");
        
        if(account==null){
            request.setAttribute("errMsg","The account is not found!");
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
        
        try{
            afl.remove(account);
            request.setAttribute("message",Integer.toString(id));
            request.setAttribute("manager",m);
            RequestDispatcher disp = request.getRequestDispatcher("delete_user_account.jsp");
            disp.forward(request, response);
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
    }
    private BmAccount deleteAccount(Integer id){
        BmAccount account = afl.find(id);
        if(account==null) return null;
        account.getBAccounttype();
        account.getBBalance();
        account.getBStatus();
        account.getBAccountid();
        return account;
    }
}
