/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import za.ac.tut.ejb.bl.BmComplaintFacadeLocal;
import za.ac.tut.entities.BmComplaint;

/**
 *
 * @author thand
 */
public class ViewComplaintsServlet extends HttpServlet {
    @EJB
    private BmComplaintFacadeLocal cfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filter = request.getParameter("filter");
        List<BmComplaint> filteredComplaints = getComplaints(filter);
        
        request.setAttribute("filteredComplaints", filteredComplaints);
        RequestDispatcher disp = request.getRequestDispatcher("view_complaints_outcome.jsp");
        disp.forward(request, response);
    }
    private List<BmComplaint> getComplaints(String filter) {
        List<BmComplaint> complaints = cfl.findAll();
        List<BmComplaint> filteredComplaints = new ArrayList<>();

        for (BmComplaint c : complaints) {
            if (c.getBStatus() != null && c.getBStatus().equalsIgnoreCase(filter)) {
                filteredComplaints.add(c);
            }
        }

        return filteredComplaints;
}

}
