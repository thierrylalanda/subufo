/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.session.entity;

import com.subufo.entity.Op;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author messi
 */
@Local
public interface OpFacadeLocal {

    void create(Op op);

    void edit(Op op);

    void remove(Op op);

    Op find(Object id);

    List<Op> findAll();
    
    List<Op> findAllByEngagement(int engagement);
    
    List<Op> findAllByEngagementAndStatus(int engagement,String status);

    List<Op> findRange(int[] range);

    int count();
    
}
