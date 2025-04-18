/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import za.ac.tut.ejb.bl.BmComplaintFacadeLocal;
import za.ac.tut.entities.BmComplaint;

/**
 *
 * @author thand
 */
public class UpdateComplaintStatusServlet extends HttpServlet {
    @EJB
    private BmComplaintFacadeLocal cfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = request.getParameter("status");
        Integer id = Integer.parseInt(request.getParameter("id"));
        
        BmComplaint complaint = updateComplait(status, id);
        
        request.setAttribute("complaint", complaint);
        RequestDispatcher disp = request.getRequestDispatcher("update_complaint_outcome.jsp");
        disp.forward(request, response);
    }
    private BmComplaint updateComplait(String status, Integer id){
        List<BmComplaint> complaints = cfl.findAll();
        BmComplaint complaint = null;
        
        for(BmComplaint c : complaints){
            if(c.getBComplaintid().compareTo(id) == 0){
                c.setBStatus(status);
                cfl.edit(c);
                complaint = c;
                break;
            }
            
        }
        return complaint;
    }
}
