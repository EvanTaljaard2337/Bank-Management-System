/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.BmSystemAdministrator;

/**
 *
 * @author thand
 */
@Local
public interface BmSystemAdministratorFacadeLocal {

    void create(BmSystemAdministrator bmSystemAdministrator);

    void edit(BmSystemAdministrator bmSystemAdministrator);

    void remove(BmSystemAdministrator bmSystemAdministrator);

    BmSystemAdministrator find(Object id);

    List<BmSystemAdministrator> findAll();

    List<BmSystemAdministrator> findRange(int[] range);

    int count();
    
    BmSystemAdministrator findByEmailAndPassword(String email,String password);
    
    public BmSystemAdministrator findByEmail(String email);
}
