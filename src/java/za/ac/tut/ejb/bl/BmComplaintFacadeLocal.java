/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.BmComplaint;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author thand
 */
@Local
public interface BmComplaintFacadeLocal {

    void create(BmComplaint bmComplaint);

    void edit(BmComplaint bmComplaint);

    void remove(BmComplaint bmComplaint);

    BmComplaint find(Object id);

    List<BmComplaint> findAll();

    List<BmComplaint> findRange(int[] range);

    int count();
    
    BmComplaint status(BmCustomer customer);
    
     public List<BmComplaint> findByCustomerId(BmCustomer customer);
}
