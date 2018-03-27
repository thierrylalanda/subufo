/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.genaralConfiguration;

import java.util.List;
import javax.ejb.Local;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author messi
 */
@Local
public interface testeLocal {

    public void myTimer();

    public List<Integer> consommationMensuelleMS();

    public List<Integer> EntrerMensuelleMS();

    public List<Integer> EntrerMensuelleMP();

    public List<Integer> consommationMensuelleMP();
    
    public List<Integer> consommationMensuelleMS(String annee);

    public List<Integer> EntrerMensuelleMS(String annee);

    public List<Integer> EntrerMensuelleMP(String annee);

    public List<Integer> consommationMensuelleMP(String annee);

    void StatistiqueSortiMS(int idMS, HttpServletResponse response);

    void StatistiqueSortiMP(int idMP, HttpServletResponse response);
    
    void StatistiqueSortiMS(int idMS, HttpServletResponse response,String annee);

    void StatistiqueSortiMP(int idMP, HttpServletResponse response,String annee);
}
