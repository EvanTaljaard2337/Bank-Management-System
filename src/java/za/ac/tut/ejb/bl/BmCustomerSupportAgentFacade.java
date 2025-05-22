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
import za.ac.tut.entities.BmCustomerSupportAgent;

/**
 *
 * @author thand
 */
@Stateless
public class BmCustomerSupportAgentFacade extends AbstractFacade<BmCustomerSupportAgent> implements BmCustomerSupportAgentFacadeLocal {

    @PersistenceContext(unitName = "BMSEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BmCustomerSupportAgentFacade() {
        super(BmCustomerSupportAgent.class);
    }
    
    @Override
    public BmCustomerSupportAgent findByEmailAndPassword(String email,String password){
        TypedQuery<BmCustomerSupportAgent> query = em.createQuery("SELECT c FROM BmCustomerSupportAgent c WHERE c.bEmail = :email AND c.bPassword = :password", BmCustomerSupportAgent.class);
        query.setParameter("email", email);
        query.setParameter("password", password); // Ensure you hash the password in a real application
        List<BmCustomerSupportAgent> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
    @Override
    public BmCustomerSupportAgent findByEmail(String email){
        try{
            Query query = em.createNamedQuery("BmCustomerSupportAgent.findByBEmail",BmCustomerSupportAgent.class);
            query.setParameter("bEmail",email);
            BmCustomerSupportAgent bankManager = (BmCustomerSupportAgent)query.getSingleResult();
            return bankManager;
        }
        catch(NoResultException e){
            return null;
        }
    }
}
