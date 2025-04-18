/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.BmComplaintFacadeLocal;
import za.ac.tut.ejb.bl.BmCustomerFacadeLocal;
import za.ac.tut.entities.BmComplaint;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author Evan
 */
public class processComplaintServlet extends HttpServlet {
    @EJB
    private BmCustomerFacadeLocal bcr;
    @EJB
    private BmComplaintFacadeLocal bct;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("customerName");
        String complaintDetails = request.getParameter("complaintDetails");
        
        BmComplaint b = riseComplaint(complaintDetails,name);     
        bct.create(b);   
        RequestDispatcher disp = request.getRequestDispatcher("complaint_submision.jsp");
        disp.forward(request, response);
    }
    private BmComplaint riseComplaint(String complaintDetails,String name){
        
        BmComplaint bc = new BmComplaint();
        bc.setBDescription(complaintDetails);//setting customer complaint details
        bc.setBCustomerid(customer(name));//setting the customer id
        bc.setBStatus("pending");//need to add status
        Date currentDate = new Date();
        bc.setBCreatedat(currentDate);
        return bc;
    }
     //Looking in a way to retrieve or see who is the customer creating the complaint
    private BmCustomer customer(String name){
        BmCustomer c = bcr.findIdByName(name);
        c.getBCustomerid();
        return c;
    }
}
