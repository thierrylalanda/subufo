/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.session.entity;

import com.gciapplication.entity.Readdata;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author messi
 */
@Local
public interface ReaddataFacadeLocal {

    void create(Readdata readdata);

    void edit(Readdata readdata);

    void remove(Readdata readdata);

    Readdata find(Object id);

    List<Readdata> findAll();

    List<Readdata> findRange(int[] range);

    int count();

    boolean demoperiodeisfinith();

    boolean Isfisthtime();

    boolean IsCompletVersion();
    
    Readdata findOne();

}
