/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author thand
 */
@Local
public interface BmCustomerFacadeLocal {

    void create(BmCustomer bmCustomer);

    void edit(BmCustomer bmCustomer);

    void remove(BmCustomer bmCustomer);

    BmCustomer find(Object id);

    List<BmCustomer> findAll();

    List<BmCustomer> findRange(int[] range);

    int count();
    
    BmCustomer findByEmailAndPassword(String email,String password);
    
    BmCustomer findIdByName(String name);
    
    BmCustomer findFullName(String fullName);
}
