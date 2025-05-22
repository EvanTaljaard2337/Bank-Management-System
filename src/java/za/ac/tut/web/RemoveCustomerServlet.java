/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
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
public class RemoveCustomerServlet extends HttpServlet {
    @EJB
    private BmCustomerFacadeLocal bcf;
    @EJB
    private BmAccountFacadeLocal afl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String custID =request.getParameter("custId").trim();
        
        BmCustomer r = customerDetails(Integer.parseInt(custID));
        
        if(r != null){
            List<BmAccount> a = customersAccounts(r);
            try{
                deleteAccounts(a);
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
        RequestDispatcher disp = request.getRequestDispatcher("delete_customer_outcome.jsp");
        disp.forward(request, response);
    }
    private BmCustomer customerDetails(Integer custId){
        BmCustomer r = bcf.find(custId);
        if(r==null) return null;
        r.getBAddress();
        r.getBCustomerid();
        r.getBEmail();
        r.getBFullname();
        r.getBPassword();
        r.getBPhone();
        return r;
    }
    private List<BmAccount> customersAccounts(BmCustomer customer) {
        List<BmAccount> allAccounts = afl.findAll();
        List<BmAccount> customerAccounts = new ArrayList<>();

        for (BmAccount account : allAccounts) {
            if (account.getBCustomerid().equals(customer.getBCustomerid())) {
                customerAccounts.add(account);
            }
        }
        return customerAccounts;
    }
    private void deleteAccounts(List<BmAccount> a){
        for(BmAccount del:a){
            afl.remove(del);
        }
    }
}

