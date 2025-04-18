/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.BmAccount;

/**
 *
 * @author thand
 */
@Local
public interface BmAccountFacadeLocal {

    void create(BmAccount bmAccount);

    void edit(BmAccount bmAccount);

    void remove(BmAccount bmAccount);

    BmAccount find(Object id);

    List<BmAccount> findAll();

    List<BmAccount> findRange(int[] range);

    int count();
    
}
