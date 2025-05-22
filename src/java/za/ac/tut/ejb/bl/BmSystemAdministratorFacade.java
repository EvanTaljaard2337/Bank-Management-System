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
import za.ac.tut.entities.BmSystemAdministrator;

/**
 *
 * @author thand
 */
@Stateless
public class BmSystemAdministratorFacade extends AbstractFacade<BmSystemAdministrator> implements BmSystemAdministratorFacadeLocal {

    @PersistenceContext(unitName = "BMSEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BmSystemAdministratorFacade() {
        super(BmSystemAdministrator.class);
    }
    
    @Override
    public BmSystemAdministrator findByEmailAndPassword(String email,String password){
        TypedQuery<BmSystemAdministrator> query = em.createQuery("SELECT c FROM BmSystemAdministrator c WHERE c.bEmail = :email AND c.bPassword = :password", BmSystemAdministrator.class);
        query.setParameter("email", email);
        query.setParameter("password", password); // Ensure you hash the password in a real application
        List<BmSystemAdministrator> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
    @Override
    public BmSystemAdministrator findByEmail(String email){
        try{
            Query query = em.createNamedQuery("BmSystemAdministrator.findByBEmail",BmSystemAdministrator.class);
            query.setParameter("bEmail",email);
            BmSystemAdministrator bankManager = (BmSystemAdministrator)query.getSingleResult();
            return bankManager;
        }
        catch(NoResultException e){
            return null;
        }
    }
}
