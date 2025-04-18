/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.BmBankManager;

/**
 *
 * @author thand
 */
@Local
public interface BmBankManagerFacadeLocal {

    void create(BmBankManager bmBankManager);

    void edit(BmBankManager bmBankManager);

    void remove(BmBankManager bmBankManager);

    BmBankManager find(Object id);

    List<BmBankManager> findAll();

    List<BmBankManager> findRange(int[] range);

    int count();
    
    BmBankManager findByEmailAndPassword(String email,String password);
}
