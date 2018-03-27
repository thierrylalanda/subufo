/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.session.entity;

import com.subufo.entity.DonneurOrdre;
import com.subufo.entity.EngagementDepense;
import java.util.ArrayList;
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
public class DonneurOrdreFacade extends AbstractFacade<DonneurOrdre> implements DonneurOrdreFacadeLocal {

    @PersistenceContext(unitName = "GCIApplicationPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DonneurOrdreFacade() {
        super(DonneurOrdre.class);
    }

    @Override
    public List<DonneurOrdre> listDemande(int controleur, String statut) {
        Query query = getEntityManager().createNamedQuery("DonneurOrdre.finByControleurAndStatut");
        query.setParameter("controleur", Integer.parseInt(String.valueOf(controleur)));
        query.setParameter("statut", statut);
        return query.getResultList();
    }

    @Override
    public DonneurOrdre findByEngagement(int id,int idPersonnel) {
        Query query = getEntityManager().createNamedQuery("DonneurOrdre.findByDepense");
        query.setParameter("engagement", id);
        query.setParameter("id", idPersonnel);

        return  (DonneurOrdre) query.getResultList().get(0);
    }

    @Override
    public List<DonneurOrdre> findByEngagements(int id) {
        Query query = getEntityManager().createNamedQuery("DonneurOrdre.finAllByEngagement");
        query.setParameter("engagement", id);

        return query.getResultList();
    }

    @Override
    public void Delete(int idEngagement, int idvalideur) {
        Query query = getEntityManager().createNamedQuery("DonneurOrdre.Delete");
        query.setParameter("engagement", idEngagement);
        query.setParameter("id", idvalideur);
    }

    @Override
    public List<DonneurOrdre> findAllByValideur(int valideur) {
        List<DonneurOrdre> ll = new ArrayList<>();
        Query query = getEntityManager().createNamedQuery("DonneurOrdre.findAllDepenseByValideur");
        query.setParameter("valideur", valideur);
        List<DonneurOrdre> l = query.getResultList();
        l.stream().filter((donneurOrdre) -> (donneurOrdre.getEtat() == null)).forEach((donneurOrdre) -> {
            ll.add(donneurOrdre);
        });
        return ll;
    }

    @Override
    public List<DonneurOrdre> findAllByEngagement(int engagement) {
        Query query = getEntityManager().createNamedQuery("DonneurOrdre.finAllByEngagement");
        query.setParameter("engagement", engagement);

        return  query.getResultList();
    }
}
