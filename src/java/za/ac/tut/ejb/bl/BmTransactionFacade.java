/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import static com.sun.tools.javac.tree.TreeInfo.name;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import za.ac.tut.entities.BmAccount;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmTransaction;

/**
 *
 * @author thand
 */
@Stateless
public class BmTransactionFacade extends AbstractFacade<BmTransaction> implements BmTransactionFacadeLocal {
    
    @PersistenceContext(unitName = "BMSEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BmTransactionFacade() {
        super(BmTransaction.class);
    }

    @Override
    public List<BmTransaction> findTransactionHistory(BmAccount Accountid) {
        TypedQuery<BmTransaction> query = em.createQuery("SELECT b FROM BmTransaction b WHERE b.bAccountid = :Accountid", BmTransaction.class);
        query.setParameter("Accountid",Accountid); // Correctly bind the parameter
        return query.getResultList();
    }
    
 @Override
    public double getTotalDeposits(LocalDate startDate, LocalDate endDate) {
        TypedQuery<BigDecimal> query = em.createQuery(
            "SELECT SUM(t.bAmount) FROM BmTransaction t WHERE t.bTransactiontype = 'Deposit' AND t.bTransactiondate BETWEEN :startDate AND :endDate", 
            BigDecimal.class);
        query.setParameter("startDate", java.sql.Date.valueOf(startDate));
        query.setParameter("endDate", java.sql.Date.valueOf(endDate));
        
        BigDecimal result = query.getSingleResult();
        return result!=null ? result.doubleValue():0.0;
    }

    @Override
    public double getTotalWithdrawals(LocalDate startDate, LocalDate endDate) {
        TypedQuery<BigDecimal> query = em.createQuery(
            "SELECT SUM(t.bAmount) FROM BmTransaction t WHERE t.bTransactiontype = 'Withdrawal' AND t.bTransactiondate BETWEEN :startDate AND :endDate", 
            BigDecimal.class);
        query.setParameter("startDate", java.sql.Date.valueOf(startDate));
        query.setParameter("endDate", java.sql.Date.valueOf(endDate));
        BigDecimal result = query.getSingleResult();
        return result!=null ? result.doubleValue():0.0;
    }

    @Override
    public int getTotalTransactions(LocalDate startDate, LocalDate endDate) {
        TypedQuery<Long> query = em.createQuery(
            "SELECT COUNT(t) FROM BmTransaction t WHERE t.bTransactiondate BETWEEN :startDate AND :endDate", 
            Long.class);
        query.setParameter("startDate", java.sql.Date.valueOf(startDate));
        query.setParameter("endDate", java.sql.Date.valueOf(endDate));
        return query.getSingleResult() != null ? query.getSingleResult().intValue() : 0;
    }
    
}
