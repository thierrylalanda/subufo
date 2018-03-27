/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.Administrator;

import com.gciapplication.entity.Login;
import com.gciapplication.entity.Personnel;
import com.gciapplication.session.entity.LoginFacadeLocal;
import com.gciapplication.session.entity.PersonnelFacadeLocal;
import com.gestion.DataSource.mysql.Message;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;

/**
 *
 * @author messi
 */
@WebServlet(name = "Json", urlPatterns = {"/Json"})
public class recuvaPassword extends HttpServlet {

    @EJB
    private LoginFacadeLocal loginFacade;

    @EJB
    private PersonnelFacadeLocal personnelFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("action") != null) {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            Personnel p = (Personnel) session.getAttribute("personnel");
            JSONArray AllConsommation = new JSONArray();
            Login l= loginFacade.findBypersonnelID(p.getIdPersonnel());
            AllConsommation.put(l.getUsername()).put(l.getPassword());
           
            response.setContentType("application/json");
            try {
                response.getWriter().print(AllConsommation);
            } catch (IOException ex) {

            }
        } else {
            String matricule = request.getParameter("matricule");
            String mail = request.getParameter("email");
            boolean error = false;
            Personnel personnel = new Personnel();
            try {
                personnel = personnelFacade.findByMatriculeByMail(matricule, mail);
            } catch (Exception e) {
                error = true;
            }
            if (error) {
                Message message = new Message("Email Ou Le Matricule est Incorrect");
                request.setAttribute("message", message);
            } else if (personnel.getIdPersonnel() == null) {
                Message message = new Message("Oupt! une erreur c'est Produit");
                request.setAttribute("message", message);
            } else {
                request.setAttribute("show", "OK");
                request.setAttribute("personnel", personnel);
            }

            request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
