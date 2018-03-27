/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.session.entity;

import com.gestion.DataSource.mysql.date_du_jour;
import com.subufo.entity.EngagementDepense;
import java.sql.Date;
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
public class EngagementDepenseFacade extends AbstractFacade<EngagementDepense> implements EngagementDepenseFacadeLocal {

    @PersistenceContext(unitName = "GCIApplicationPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EngagementDepenseFacade() {
        super(EngagementDepense.class);
    }

    @Override
    public List<EngagementDepense> findAllByPeriode(Date d, Date d1, String statut) {
        Query query;
        if (statut.equalsIgnoreCase("Tous")) {
            query = getEntityManager().createNamedQuery("EngagementDepense.findByPeriodeDateDemandeTous");

        } else {
            query = getEntityManager().createNamedQuery("EngagementDepense.findByPeriodeDateDemande");
            query.setParameter("statut", statut);
        }

        query.setParameter("date1", d);
        query.setParameter("date2", d1);

        return query.getResultList();
    }

    @Override
    public List<EngagementDepense> findAllByMonth(Date d1, String statut) {
        Query query = getEntityManager().createNamedQuery("EngagementDepense.findByMonth");
        query.setParameter("dateDemande", d1);
        query.setParameter("statut", statut);
        return query.getResultList();
    }

    @Override
    public List<EngagementDepense> findAllByStatut(String statut) {
        Query query = getEntityManager().createNamedQuery("EngagementDepense.findByStatut");
        query.setParameter("statut", statut);
        return query.getResultList();
    }

    @Override
    public EngagementDepense findLastInsert() {
        Query query = getEntityManager().createNamedQuery("EngagementDepense.findByLastInsert");

        return (EngagementDepense) query.getSingleResult();
    }

    @Override
    public List<Double> findAllConsommation(Date d1, String statut, String nature) {
        // List<String> nature = date_du_jour.findNatureEngagement();
        double m = 0;
        List<Double> montant = new ArrayList<>();
        for (int i = 1; i < 12; i++) {
            Query query = getEntityManager().createNativeQuery("SELECT SUM(engagement_depense.montant_ttc) FROM engagement_depense WHERE engagement_depense.statut = ? AND \n"
                    + "YEAR(engagement_depense.date_demande) = YEAR(?) AND MONTH(engagement_depense.date_demande) = ? AND engagement_depense.nature_depense = ?");
            query.setParameter(1, statut);
            query.setParameter(2, d1);
            query.setParameter(3, i);
            query.setParameter(4, nature);

            if (query.getSingleResult() != null) {
                montant.add((Double) query.getSingleResult());
            } else {

                montant.add(m);
            }

        }

        return montant;
    }

    @Override
    public List<EngagementDepense> findReportinByCriteria(Date d, Date d1, String rubrique, int entite, int indicateur) {
        String statut = "receptionner";
        Query query = null;
        switch (indicateur) {
            case 0:
                query = getEntityManager().createNamedQuery("EngagementDepense.findReportinByRegion");
                query.setParameter("region", entite);
                break;
            case 1:
                query = getEntityManager().createNamedQuery("EngagementDepense.findReportinByDirection");
                query.setParameter("direction", entite);
                break;
            case 2:
                query = getEntityManager().createNamedQuery("EngagementDepense.findReportingByService");
                query.setParameter("service", entite);
                break;
            case 3:
                query = getEntityManager().createNamedQuery("EngagementDepense.findReportingByPersonnel");
                query.setParameter("personnel", entite);
                break;
            default:
                break;
        }
        query.setParameter("rubrique", rubrique);
        query.setParameter("d1", d1);
        query.setParameter("d2", d);
        query.setParameter("statut", statut);

        return query.getResultList();
    }

    @Override
    public List<EngagementDepense> findReportinByAll(int entite) {
        String statut = "receptionner";
        Query query = getEntityManager().createNamedQuery("EngagementDepense.findReportinByAll");
        query.setParameter("region", entite);
        query.setParameter("statut", statut);
        return query.getResultList();
    }

    @Override
    public List<EngagementDepense> findAllByPersonnelStatut(int id) {
        Query query = getEntityManager().createNamedQuery("EngagementDepense.findByDemandeur");
        query.setParameter("demandeur", id);       
        return query.getResultList();
    }
}
