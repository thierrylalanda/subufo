/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.session.entity;

import com.gciapplication.entity.Page;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author messi
 */
@Local
public interface PageFacadeLocal {

    void create(Page page);

    void edit(Page page);

    void remove(Page page);

    Page find(Object id);

    List<Page> findAll();

    List<Page> findRange(int[] range);
    List<Page> findByNiveau(int idNiveau);
    int count();
    
}
