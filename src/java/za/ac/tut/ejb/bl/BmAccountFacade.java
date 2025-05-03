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
import za.ac.tut.entities.BmAccount;
import za.ac.tut.entities.BmCustomer;
import za.ac.tut.entities.BmLoan;

/**
 *
 * @author thand
 */
@Stateless
public class BmAccountFacade extends AbstractFacade<BmAccount> implements BmAccountFacadeLocal {

    @PersistenceContext(unitName = "BMSEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BmAccountFacade() {
        super(BmAccount.class);
    }
    @Override
    public List<BmAccount> findAccountsByCustId(BmCustomer customerId){
        TypedQuery<BmAccount> query = em.createQuery("SELECT b FROM BmAccount b WHERE b.bCustomerid = :customersId", BmAccount.class);
        query.setParameter("customersId",customerId); // Correctly bind the parameter
        return query.getResultList();
    }
}
