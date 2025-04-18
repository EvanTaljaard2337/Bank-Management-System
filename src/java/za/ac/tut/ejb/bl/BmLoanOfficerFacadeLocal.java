/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.BmLoanOfficer;

/**
 *
 * @author thand
 */
@Local
public interface BmLoanOfficerFacadeLocal {

    void create(BmLoanOfficer bmLoanOfficer);

    void edit(BmLoanOfficer bmLoanOfficer);

    void remove(BmLoanOfficer bmLoanOfficer);

    BmLoanOfficer find(Object id);

    List<BmLoanOfficer> findAll();

    List<BmLoanOfficer> findRange(int[] range);

    int count();
    
    BmLoanOfficer findByEmailAndPassword(String email,String password);
}
