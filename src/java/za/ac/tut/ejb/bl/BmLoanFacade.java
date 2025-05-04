/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.util.List;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import za.ac.tut.entities.BmAccount;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmLoan;

/**
 *
 * @author thand
 */
@Stateless
public class BmLoanFacade extends AbstractFacade<BmLoan> implements BmLoanFacadeLocal {

    @PersistenceContext(unitName = "BMSEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BmLoanFacade() {
        super(BmLoan.class);
    }

    @Override
    public List<BmLoan> findANumberOfLoans(Integer limit) {
        Query query = em.createQuery("SELECT c FROM BmLoan c");
        query.setMaxResults(limit);
        List<BmLoan> loans = query.getResultList();
        return loans;
    }

    @Override
    public Integer cntLoans(String filter) {
        Query query;
        if ("all".equalsIgnoreCase(filter)) {
            query = em.createQuery("SELECT COUNT(c) FROM BmLoan c");
        } else {
            query = em.createQuery("SELECT COUNT(c) FROM BmLoan c WHERE c.bStatus = :filter");
            query.setParameter("filter", filter);
        }
        Long cntLong = (Long) query.getSingleResult();
        return cntLong.intValue();
    }
    
    @Override
    public boolean updateLoanStatus(Integer loanId, String newStatus) {
        try {
            // Find the loan
            BmLoan loan = em.find(BmLoan.class, loanId);
            if (loan == null) {
                return false;
            }

            // Update loan status
            loan.setBStatus(newStatus);
            em.merge(loan);

            // If approved, update account balance
            if ("Approved".equalsIgnoreCase(newStatus)) {
                // Find the customer's account
                Query accountQuery = em.createQuery(
                    "SELECT a FROM BmAccount a WHERE a.bCustomerid = :customerId");
                accountQuery.setParameter("customerId", loan.getBCustomerid());
                BmAccount account = (BmAccount) accountQuery.getSingleResult();

                // Update balance
                if (account != null) {
                    BigDecimal newBalance = account.getBBalance().add(loan.getBLoanamount());
                    account.setBBalance(newBalance);
                    em.merge(account);
                }
            }

            return true;
        } catch (Exception e) {
            throw new EJBException("Failed to update loan status", e);
        }
    }
    @Override
    public List<BmLoan> findLoansByCustId(BmCustomer customerId){
        TypedQuery<BmLoan> query = em.createQuery("SELECT b FROM BmLoan b WHERE b.bCustomerid = :customersId", BmLoan.class);
        query.setParameter("customersId",customerId); // Correctly bind the parameter
        return query.getResultList();
    }
    @Override
    public double getOutstandingLoans(BmCustomer customerId, String loanStatus) {
        // Step 1: Get all approved loans for the customer
        List<BmLoan> loans = em.createQuery(
            "SELECT l FROM BmLoan l WHERE l.bStatus = :loanStatus AND l.bCustomerid = :customerId", BmLoan.class)
            .setParameter("loanStatus", loanStatus)
            .setParameter("customerId", customerId)
            .getResultList();

        // Step 2: Calculate total disbursed and repaid amounts
        double totalLoanAmount = 0.0;
        double totalPayments = 0.0;

        for (BmLoan loan : loans) {
                    // Sum the total loan amount for this loan
            totalLoanAmount += loan.getBLoanamount().doubleValue();

        // Sum relevant transactions (e.g., deposits or withdrawals) that affect the loan
            Double payments = em.createQuery(
            "SELECT COALESCE(SUM(t.bAmount), 0) FROM BmTransaction t " +
            "WHERE t.bAccountid IN (SELECT a.bAccountid FROM BmAccount a WHERE a.bCustomerid = :customerId)", 
            Double.class)
            .setParameter("customerId", customerId)
            .getSingleResult();

            totalPayments += (payments != null ? payments : 0.0);
        }

        // Calculate outstanding loans
        double outstanding = totalLoanAmount - totalPayments;
        return outstanding > 0 ? outstanding : 0.0;
    }
}
