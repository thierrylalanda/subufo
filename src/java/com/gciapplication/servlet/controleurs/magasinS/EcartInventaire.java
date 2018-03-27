/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.servlet.controleurs.magasinS;

import com.gciapplication.entity.EcartinventaireMS;
import com.gciapplication.entity.MagasinSecondaire;
import com.gciapplication.session.entity.EcartinventaireMSFacadeLocal;
import com.gciapplication.session.entity.MagasinSecondaireFacadeLocal;
import com.gciapplication.session.entity.PersonnelFacadeLocal;
import com.gestion.DataSource.mysql.date_du_jour;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author messi
 */
@WebServlet(name = "EcartInventaire", urlPatterns = {"/ecatinventaire"})
public class EcartInventaire extends HttpServlet {

    @EJB
    private MagasinSecondaireFacadeLocal magasinSecondaireFacade;

    @EJB
    private EcartinventaireMSFacadeLocal ecartinventaireMSFacade;

    String action = "";
    List<EcartinventaireMS> lists = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("id") != null) {
            String vue = request.getParameter("vue");
            action = request.getParameter("action");
            int idMS;

            if (session.getAttribute("id_magasin") == null) {
                idMS = Integer.parseInt(request.getParameter("id_magasin"));
                session.setAttribute("id_magasin", idMS);
            } else {
                idMS = (int) session.getAttribute("id_magasin");
            }
            String redirect;
            int niveau = 0;
            if (request.getParameter("niveau") != null) {
                niveau = Integer.parseInt(request.getParameter("niveau"));
                session.setAttribute("niveau", niveau);
            }

            if (niveau == 5 || (int) session.getAttribute("niveau") == 5) {
                MagasinSecondaire secondaire = magasinSecondaireFacade.find(idMS);
                request.setAttribute("magasin", secondaire);
                redirect = "/WEB-INF/administrateur/main1.jsp";
                request.setAttribute("vues", "Historique inventaire");
            } else {
                redirect = "/WEB-INF/magasignerS/main.jsp";

            }
            if (action.equalsIgnoreCase("all")) {
                lists.removeAll(lists);
                //Personnel p = personnelFacade.find(idMagasigner);
                lists = ecartinventaireMSFacade.findAllByIdMS(idMS);

            }
            if (action.equalsIgnoreCase("date")) {
                String date1 = request.getParameter("date1");
                String date2 = request.getParameter("date2");
                // date_du_jour date = new date_du_jour();
                Date d = date_du_jour.dateConvert(date1);
                Date dd = date_du_jour.dateConvert(date2);
                lists.removeAll(lists);
                lists = ecartinventaireMSFacade.findDate(d, dd, idMS);
            }

            request.setAttribute("historique", lists);
            request.setAttribute("vue", vue);
            request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
