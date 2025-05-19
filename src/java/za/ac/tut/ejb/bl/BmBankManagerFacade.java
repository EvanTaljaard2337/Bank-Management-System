/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import za.ac.tut.entities.BmBankManager;

/**
 *
 * @author thand
 */
@Stateless
public class BmBankManagerFacade extends AbstractFacade<BmBankManager> implements BmBankManagerFacadeLocal {

    @PersistenceContext(unitName = "BMSEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BmBankManagerFacade() {
        super(BmBankManager.class);
    }
    @Override
    public BmBankManager findByEmailAndPassword(String email,String password){
        TypedQuery<BmBankManager> query = em.createQuery("SELECT c FROM BmBankManager c WHERE c.bEmail = :email AND c.bPassword = :password", BmBankManager.class);
        query.setParameter("email", email);
        query.setParameter("password", password); // Ensure you hash the password in a real application
        List<BmBankManager> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
    @Override
    public BmBankManager findByEmail(String email){
        Query query = em.createNamedQuery("BmBankManager.findByBEmail",BmBankManager.class);
        query.setParameter("bEmail",email);
        BmBankManager bankManager = (BmBankManager)query.getSingleResult();
        return bankManager;
    }
}
