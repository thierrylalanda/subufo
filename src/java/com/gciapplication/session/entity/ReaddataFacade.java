/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.session.entity;

import com.gciapplication.entity.Readdata;
import com.gestion.DataSource.mysql.date_du_jour;
import java.sql.Date;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author messi
 */
@Stateless
public class ReaddataFacade extends AbstractFacade<Readdata> implements ReaddataFacadeLocal {

    @PersistenceContext(unitName = "GCIApplicationPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReaddataFacade() {
        super(Readdata.class);
    }

    @Override
    public boolean demoperiodeisfinith() {
        boolean enddemo = false;
        Query query = getEntityManager().createNativeQuery("SELECT * FROM readdata", Readdata.class);
        Readdata r = (Readdata) query.getSingleResult();
        Date d = date_du_jour.dateJourUniqueDate();
        if (date_du_jour.getyear(d) >= date_du_jour.getyear(new Date(r.getInstallationDate().getTime()))) {
            if (d.after(r.getDemoperiode()) || d.compareTo(r.getDemoperiode()) == 0) {
                enddemo = true;
            }
        }else{
            enddemo = true;
        }        
        return enddemo;
    }

    @Override
    public boolean Isfisthtime() {
        boolean fisth = false;
        Query query = getEntityManager().createNativeQuery("SELECT * FROM readdata", Readdata.class);
        Readdata r = (Readdata) query.getSingleResult();
        if (r.getIsfirsttime() == 1) {
            fisth = true;
        }
        return fisth;
    }

    @Override
    public boolean IsCompletVersion() {
        boolean fisth = false;
        Query query = getEntityManager().createNativeQuery("SELECT * FROM readdata", Readdata.class);
        Readdata r = (Readdata) query.getSingleResult();
        Date d = date_du_jour.dateJourUniqueDate();
        if (date_du_jour.getyear(d) >= date_du_jour.getyear(new Date(r.getInstallationDate().getTime()))) {
            if (r.getIscompletversion() == 1) {
                fisth = true;
            }
        }
        
        return fisth;
    }

    @Override
    public Readdata findOne() {
        Query query = getEntityManager().createNativeQuery("SELECT * FROM readdata", Readdata.class);
        return (Readdata) query.getSingleResult();
    }

}
