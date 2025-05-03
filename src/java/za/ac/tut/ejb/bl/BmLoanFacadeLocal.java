/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmLoan;

/**
 *
 * @author thand
 */
@Local
public interface BmLoanFacadeLocal {

    void create(BmLoan bmLoan);

    void edit(BmLoan bmLoan);

    void remove(BmLoan bmLoan);

    BmLoan find(Object id);

    List<BmLoan> findAll();

    List<BmLoan> findRange(int[] range);

    int count();
    
    List<BmLoan> findANumberOfLoans(Integer limit);
    
    Integer cntLoans(String filter);
    
    boolean updateLoanStatus(Integer loanId, String newStatus);
    
    List<BmLoan> findLoansByCustId(BmCustomer customerId);
    
}
