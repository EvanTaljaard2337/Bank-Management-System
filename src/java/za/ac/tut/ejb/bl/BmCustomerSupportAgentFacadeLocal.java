/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.BmCustomerSupportAgent;

/**
 *
 * @author thand
 */
@Local
public interface BmCustomerSupportAgentFacadeLocal {

    void create(BmCustomerSupportAgent bmCustomerSupportAgent);

    void edit(BmCustomerSupportAgent bmCustomerSupportAgent);

    void remove(BmCustomerSupportAgent bmCustomerSupportAgent);

    BmCustomerSupportAgent find(Object id);

    List<BmCustomerSupportAgent> findAll();

    List<BmCustomerSupportAgent> findRange(int[] range);

    int count();
   
    BmCustomerSupportAgent findByEmailAndPassword(String email,String password);
    BmCustomerSupportAgent findByEmail(String email);
}
