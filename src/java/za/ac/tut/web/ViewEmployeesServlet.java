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
import za.ac.tut.ejb.bl.BmBankManagerFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerSupportAgentFacadeLocal;
import za.ac.tut.ejb.bl.BmLoanOfficerFacadeLocal;
import za.ac.tut.ejb.bl.BmSystemAdministratorFacadeLocal;
import za.ac.tut.entities.BmBankManager;
import za.ac.tut.entities.BmCustomerSupportAgent;
import za.ac.tut.entities.BmLoanOfficer;
import za.ac.tut.entities.BmSystemAdministrator;

/**
 *
 * @author Evan
 */
public class ViewEmployeesServlet extends HttpServlet {
    @EJB
    private BmBankManagerFacadeLocal bml;
    @EJB
    private BmCustomerSupportAgentFacadeLocal csfl;
    @EJB
    private BmLoanOfficerFacadeLocal lofl;
    @EJB
    private BmSystemAdministratorFacadeLocal safl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String department = request.getParameter("department");
        String empIds = request.getParameter("empId");
        Integer empId=null;
        
        if(empIds!=null && !empIds.trim().isEmpty()){
            try{
                empId = Integer.parseInt(empIds.trim());
            }
            catch(NumberFormatException e){
                request.setAttribute("errMsg","Invalid Employee Number!");
                RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
                disp.forward(request, response);
                return;
            }
        }
        try{
            switch (department) {
                case "support":
                    List<BmCustomerSupportAgent> agent =addSupportAgent(empId);
                    request.setAttribute("list", agent);
                    
                    break;
                case "loanofficer":
                    List<BmLoanOfficer> loanOfficer = addLoanOfficer(empId);
                    request.setAttribute("list", loanOfficer);
                    break;
                case "bankmanager":
                    List<BmBankManager> manager = addManager(empId);
                    request.setAttribute("list", manager);
                    break;
                case "admin":
                    List<BmSystemAdministrator> admin =addAdministrator(empId);
                    request.setAttribute("list", admin);
                    break;
                default:
                    break;
            }
            RequestDispatcher disp = request.getRequestDispatcher("view_employee_outcome.jsp");
            disp.forward(request, response);
            
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute("errMsg", e.getMessage());
            RequestDispatcher disp = request.getRequestDispatcher("error.jsp");
            disp.forward(request, response);
        }
    }

    private List<BmBankManager> addManager(Integer empId){
        List<BmBankManager> manager = new ArrayList<>();
        List<BmBankManager> allManagers = bml.findAll();
        if(empId==null){
            return allManagers;
        }
        for(BmBankManager bm:allManagers){
            if(bm.getBManagerid() == empId){
                manager.add(bm);
            }
        }
        return manager;
    }
    private List<BmCustomerSupportAgent> addSupportAgent(Integer empId){
        List<BmCustomerSupportAgent> agent = new ArrayList<>();
        List<BmCustomerSupportAgent> agents = csfl.findAll();
        
        if(empId==null){
            return agents;
        }
        for(BmCustomerSupportAgent agentMan : agents){
            if(agentMan.getBAgentid() == empId){
                agent.add(agentMan);
            }
        }
        return agent;
    }
    private List<BmLoanOfficer> addLoanOfficer(Integer empId){
        List<BmLoanOfficer> loanOfficer = new ArrayList<>();
        List<BmLoanOfficer> allOfficers = lofl.findAll();
        if(empId==null){
            return allOfficers;
        }
        for(BmLoanOfficer ol : allOfficers){
            if(ol.getBOfficerid()==empId){
                loanOfficer.add(ol);
            }
        }
        return loanOfficer;
    }
    private List<BmSystemAdministrator> addAdministrator(Integer empId){
        List<BmSystemAdministrator> admin = new ArrayList<>();
        List<BmSystemAdministrator> allAdmin = safl.findAll();
        if(empId==null){
            return allAdmin;
        }
        for(BmSystemAdministrator adm : allAdmin){
            if(adm.getBAdminid() == empId){
                admin.add(adm);
            }
        }
        return admin;
    }
}