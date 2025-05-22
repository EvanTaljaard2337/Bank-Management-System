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
import javax.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.BmAccountFacadeLocal;
import za.ac.tut.entities.BmAccount;

/**
 *
 * @author Evan
 */
public class ViewAccountsServlet extends HttpServlet {
    @EJB
    private BmAccountFacadeLocal afl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountType = request.getParameter("accountType");
        List<BmAccount> accounts = findFilteredAcc(accountType);
        request.setAttribute("accounts", accounts);
        RequestDispatcher disp = request.getRequestDispatcher("view_accounts_outcome.jsp");
        disp.forward(request, response);
    }
    private List<BmAccount> findFilteredAcc(String accountType){
        List<BmAccount> allAcc = afl.findAll();
        List<BmAccount> filteredAcc = new ArrayList<>();

        if (accountType == null || accountType.trim().isEmpty()) {
            return allAcc; // return all if no filter selected
        }
        for (BmAccount acc : allAcc) {
            if (acc.getBAccounttype().equalsIgnoreCase(accountType)) {
                filteredAcc.add(acc);
            }
        }

        return filteredAcc;
    }
}
