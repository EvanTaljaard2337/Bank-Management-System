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
import javax.persistence.TypedQuery;
import za.ac.tut.entities.BmComplaint;
import za.ac.tut.entities.BmCustomer;

/**
 *
 * @author thand
 */
@Stateless
public class BmComplaintFacade extends AbstractFacade<BmComplaint> implements BmComplaintFacadeLocal {

    @PersistenceContext(unitName = "BMSEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BmComplaintFacade() {
        super(BmComplaint.class);
    }
    @Override
    public BmComplaint status(BmCustomer customer) {
        //int customerId = customer.getBCustomerid();
        TypedQuery<BmComplaint> query = em.createQuery("SELECT c FROM BmComplaint c WHERE c.bCustomerid = :customerId", BmComplaint.class);
        query.setParameter("customerId", customer); // Correctly bind the parameter
        List<BmComplaint> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
    @Override
    public List<BmComplaint> findByCustomerId(BmCustomer customer) {
        TypedQuery<BmComplaint> query = em.createQuery("SELECT c FROM BmComplaint c WHERE c.bCustomerid = :customerId", BmComplaint.class);
        query.setParameter("customerId", customer);
        return query.getResultList();
    }

}
