/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.session.entity;

import com.subufo.entity.Op;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author messi
 */
@Stateless
public class OpFacade extends AbstractFacade<Op> implements OpFacadeLocal {

    @PersistenceContext(unitName = "GCIApplicationPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OpFacade() {
        super(Op.class);
    }

    @Override
    public List<Op> findAllByEngagement(int engagement) {
       Query query = getEntityManager().createNamedQuery("Op.findByDepense");
        query.setParameter("engagement", engagement);
        
        return query.getResultList();
    }

    @Override
    public List<Op> findAllByEngagementAndStatus(int engagement, String status) {
         Query query = getEntityManager().createNamedQuery("Op.findByDepenseAndStatut");
        query.setParameter("engagement", engagement);
        query.setParameter("statut", status);
        return query.getResultList();
    }
    
}
