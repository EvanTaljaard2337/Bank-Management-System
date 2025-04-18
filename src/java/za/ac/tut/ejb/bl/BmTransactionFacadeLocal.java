/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.BmTransaction;

/**
 *
 * @author thand
 */
@Local
public interface BmTransactionFacadeLocal {

    void create(BmTransaction bmTransaction);

    void edit(BmTransaction bmTransaction);

    void remove(BmTransaction bmTransaction);

    BmTransaction find(Object id);

    List<BmTransaction> findAll();

    List<BmTransaction> findRange(int[] range);

    int count();
    
}
