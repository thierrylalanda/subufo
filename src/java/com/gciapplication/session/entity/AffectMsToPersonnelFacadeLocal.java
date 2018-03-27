/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.session.entity;

import com.gciapplication.entity.AffectMsToPersonnel;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author messi
 */
@Local
public interface AffectMsToPersonnelFacadeLocal {

    void create(AffectMsToPersonnel affectMsToPersonnel);

    void edit(AffectMsToPersonnel affectMsToPersonnel);

    void remove(AffectMsToPersonnel affectMsToPersonnel);

    AffectMsToPersonnel find(Object id);

    List<AffectMsToPersonnel> findAll();

    List<AffectMsToPersonnel> findRange(int[] range);

    int count();

    List<AffectMsToPersonnel> findAllByIDPersonnel(int personnel);

    List<AffectMsToPersonnel> findAllByIDMS(int magasin);

}
