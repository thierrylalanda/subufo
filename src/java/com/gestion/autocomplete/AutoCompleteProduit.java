package com.gestion.autocomplete;

import com.gciapplication.entity.Article;
import com.gciapplication.session.entity.ArticleFacadeLocal;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import java.util.List;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Servlet implementation class AutoComplete
 */
public class AutoCompleteProduit extends HttpServlet {

    @EJB
    private ArticleFacadeLocal articleFacade;

    public AutoCompleteProduit() {
        super();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // String categorie=request.getParameter("categorie");
    //   System.out.println(categorie);
             List<Article> produit = articleFacade.findAll();
       
                    ArrayList<String> al = new ArrayList<>();
                    for (Article art : produit) {
                        al.add(art.getDesignation());
                    }
                    
                    JSONArray json = new JSONArray(al);
                    response.setContentType("application/json");
                    response.getWriter().print(json);
                 
    }


}
