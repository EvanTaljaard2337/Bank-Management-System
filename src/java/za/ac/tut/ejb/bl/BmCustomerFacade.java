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
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author thand
 */
@Stateless
public class BmCustomerFacade extends AbstractFacade<BmCustomer> implements BmCustomerFacadeLocal {

    @PersistenceContext(unitName = "BMSEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public BmCustomerFacade() {
        super(BmCustomer.class);
    }
    
    @Override
    public BmCustomer findByEmailAndPassword(String email,String password){
        TypedQuery<BmCustomer> query = em.createQuery("SELECT c FROM BmCustomer c WHERE c.bEmail = :email AND c.bPassword = :password", BmCustomer.class);
        query.setParameter("email", email);
        query.setParameter("password", password); // Ensure you hash the password in a real application
        List<BmCustomer> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
    @Override
    public BmCustomer findIdByName(String name){
        TypedQuery<BmCustomer> query = em.createQuery("SELECT c FROM BmCustomer c WHERE c.bFullname = :name", BmCustomer.class);
        query.setParameter("name", name); // Correctly bind the parameter
        List<BmCustomer> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
    @Override
    public BmCustomer findFullName(String fullName){
        TypedQuery<BmCustomer> query = em.createNamedQuery("BmCustomer.findByBFullname", BmCustomer.class);
        query.setParameter("bFullname", fullName); // Correctly bind the parameter
        List<BmCustomer> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
    @Override
    public BmCustomer findByEmail(String email){
        Query query = em.createNamedQuery("BmCustomer.findByBEmail",BmCustomer.class);
        query.setParameter("bEmail",email);
        BmCustomer bankManager = (BmCustomer)query.getSingleResult();
        return bankManager;
    }
}
