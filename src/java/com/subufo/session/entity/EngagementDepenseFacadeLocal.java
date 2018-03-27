/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.session.entity;

import com.subufo.entity.EngagementDepense;
import java.sql.Date;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author messi
 */
@Local
public interface EngagementDepenseFacadeLocal {

    void create(EngagementDepense engagementDepense);

    void edit(EngagementDepense engagementDepense);

    void remove(EngagementDepense engagementDepense);

    EngagementDepense find(Object id);

    List<EngagementDepense> findAll();

    List<EngagementDepense> findAllByPeriode(Date d, Date d1, String statut);

    List<EngagementDepense> findAllByMonth(Date d1, String statut);

    List<Double> findAllConsommation(Date d1, String statut, String nature);

    List<EngagementDepense> findAllByStatut(String statut);
    
    List<EngagementDepense> findAllByPersonnelStatut(int id);

    List<EngagementDepense> findRange(int[] range);

    EngagementDepense findLastInsert();

    int count();

    List<EngagementDepense> findReportinByCriteria(Date d, Date d1, String rubrique, int entite, int indicateur);

    List<EngagementDepense> findReportinByAll(int entite);
}
