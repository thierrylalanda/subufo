/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.session.entity;

import com.subufo.entity.DonneurOrdre;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author messi
 */
@Local
public interface DonneurOrdreFacadeLocal {

    void create(DonneurOrdre donneurOrdre);

    void edit(DonneurOrdre donneurOrdre);

    void remove(DonneurOrdre donneurOrdre);

    void Delete(int idEngagement, int idvalideur);

    DonneurOrdre find(Object id);

    DonneurOrdre findByEngagement(int id,int idPersonnel);

    List<DonneurOrdre> findByEngagements(int id);

    List<DonneurOrdre> findAll();

    List<DonneurOrdre> findAllByValideur(int valideur);

    List<DonneurOrdre> findAllByEngagement(int engagement);

    List<DonneurOrdre> findRange(int[] range);

    int count();

    List<DonneurOrdre> listDemande(int controleur, String statut);

}
