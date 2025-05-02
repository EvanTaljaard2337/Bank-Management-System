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
import za.ac.tut.ejb.bl.BmAccountFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.entities.BmAccount;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author Evan
 */
public class RetrieveAccountTypeServlet extends HttpServlet {
    @EJB
    private BmCustomerFacadeLocal bfl;
    @EJB
    private BmAccountFacadeLocal afl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String source = request.getParameter("source");
        if (source.equals("deposit")){
            try{
                Integer id = Integer.parseInt(request.getParameter("customerId"));
                List<BmAccount> customerAccounts = findAccount(id);

                request.setAttribute("accountTypes",customerAccounts);
                RequestDispatcher disp = request.getRequestDispatcher("deposit.jsp");
                disp.forward(request,response);
            }
            catch(Exception e){
                e.printStackTrace();
                request.setAttribute("errMsg", e.getMessage());
                RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
                disp.forward(request,response);
            }
        }
        else{
            try{
                Integer id = Integer.parseInt(request.getParameter("customerId"));
                List<BmAccount> customerAccounts = findAccount(id);
                request.setAttribute("accountTypes",customerAccounts);
                RequestDispatcher disp = request.getRequestDispatcher("withdraw.jsp");
                disp.forward(request,response);
            }
            catch(Exception e){
                e.printStackTrace();
                request.setAttribute("errMsg", e.getMessage());
                RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
                disp.forward(request,response);
            }
        }
    }
    private List<BmAccount> findAccount(Integer id){
        BmCustomer customer = bfl.find(id);
        List<BmAccount> accounts = afl.findAll();
        List<BmAccount> filteredAccount = new ArrayList<>();
        for(BmAccount acc:accounts){
            if(acc.getBAccountid()!=null && acc.getBCustomerid().equals(customer)){
                    filteredAccount.add(acc);
                //filteredAccount.add(acc);
            }
        }
        return filteredAccount;
    }
}
