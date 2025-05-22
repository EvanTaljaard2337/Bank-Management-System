/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import za.ac.tut.entities.BmBankManager;
import za.ac.tut.entities.BmLoanOfficer;

/**
 *
 * @author thand
 */
@Stateless
public class BmLoanOfficerFacade extends AbstractFacade<BmLoanOfficer> implements BmLoanOfficerFacadeLocal {

    @PersistenceContext(unitName = "BMSEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BmLoanOfficerFacade() {
        super(BmLoanOfficer.class);
    }
    @Override
    public BmLoanOfficer findByEmailAndPassword(String email,String password){
        TypedQuery<BmLoanOfficer> query = em.createQuery("SELECT c FROM BmLoanOfficer c WHERE c.bEmail = :email AND c.bPassword = :password", BmLoanOfficer.class);
        query.setParameter("email", email);
        query.setParameter("password", password); // Ensure you hash the password in a real application
        List<BmLoanOfficer> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
    @Override
    public BmLoanOfficer findByEmail(String email){
        try{
            Query query = em.createNamedQuery("BmLoanOfficer.findByBEmail",BmLoanOfficer.class);
            query.setParameter("bEmail",email);
            BmLoanOfficer bankManager = (BmLoanOfficer)query.getSingleResult();
            return bankManager;
        }
        catch(NoResultException e){
            return null;
        }
    }
}
