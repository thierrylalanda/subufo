package com.gciapplication.servlet.controleurs.magasinS;

import com.gciapplication.entity.Appariel;
import com.gciapplication.entity.Article;
import com.gciapplication.entity.Butget;
import com.gciapplication.entity.CommandePersonnel;
import com.gciapplication.entity.MagasinSecondaire;
import com.gciapplication.entity.OperationConsommateur;
import com.gciapplication.entity.Personnel;
import com.gciapplication.entity.Region;
import com.gciapplication.entity.StockproduitMS;
import com.gciapplication.session.entity.ArticleFacadeLocal;
import com.gciapplication.session.entity.ButgetFacadeLocal;
import com.gciapplication.session.entity.CommandePersonnelFacadeLocal;
import com.gciapplication.session.entity.LoginFacadeLocal;
import com.gciapplication.session.entity.MagasinSecondaireFacadeLocal;
import com.gciapplication.session.entity.PersonnelFacadeLocal;
import com.gciapplication.session.entity.RegionFacadeLocal;
import com.gciapplication.session.entity.StockproduitMSFacadeLocal;
import com.gestion.DataSource.mysql.Message;
import com.gestion.DataSource.mysql.date_du_jour;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Commande_Client", urlPatterns = "/commande_client")
public class commande_client extends HttpServlet {

   
    @EJB
    private LoginFacadeLocal loginFacade;

    @EJB
    private RegionFacadeLocal regionFacade;

    @EJB
    private MagasinSecondaireFacadeLocal magasinSecondaireFacade;

    @EJB
    private ArticleFacadeLocal articleFacade;

    @EJB
    private ButgetFacadeLocal butgetFacade;

    @EJB
    private PersonnelFacadeLocal personnelFacade;

    @EJB
    private StockproduitMSFacadeLocal stockproduitMSFacade;

    @EJB
    private CommandePersonnelFacadeLocal commandePersonnelFacade;

    ArrayList<CommandePersonnel> listeCommandes = new ArrayList<>();
    ArrayList<OperationConsommateur> listeOperations = new ArrayList<>();

    Personnel p = new Personnel();
    Personnel p2 = new Personnel();

    String save = "", edit = "ok", nom_client = "";
    String interne = "";
    int fois = 0;

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

            p2 = (Personnel) session.getAttribute("personnel");

            String action = request.getParameter("action");
            String vue = request.getParameter("vue");

            if (request.getParameter("interne") != null) {
                interne = request.getParameter("interne");
                if (interne.equalsIgnoreCase("yes")) {
                    vue = "Commande Interne";
                    request.setAttribute("personnel", p2);
                } else {
                    vue = "Sortir pour consommation";
                    request.setAttribute("personnel", p);
                }
            }
            int idMS;

            if (session.getAttribute("id_magasin") == null) {
                idMS = Integer.parseInt(request.getParameter("id_magasin"));
                session.setAttribute("id_magasin", idMS);
            } else {
                idMS = (int) session.getAttribute("id_magasin");
            }

            int niveau = 0;
            String redirect;

            if (request.getParameter("niveau") != null) {
                niveau = Integer.parseInt(request.getParameter("niveau"));
                session.setAttribute("niveau", niveau);
            } else {
                niveau = loginFacade.findBypersonnelID(p2.getIdPersonnel()).getNiveauAcces();
                session.setAttribute("niveau", niveau);
            }
            if (niveau == 5 || (int) session.getAttribute("niveau") == 5) {

                MagasinSecondaire ms = magasinSecondaireFacade.find(idMS);

                request.setAttribute("magasin", ms);
                session.setAttribute("categoriee", ms.getCategorieproduitMSList());
                request.setAttribute("vues", "Sortir pour consommation");
                vue = "editeMagasinS";
                redirect = "/WEB-INF/administrateur/main1.jsp";

            } else {
                redirect = "/WEB-INF/magasignerS/main.jsp";

            }
            String unlock = "ok";
            if (action.equalsIgnoreCase("show")) {
                listeCommandes.clear();
                listeOperations.clear();
                nom_client = "";
                p = null;
                boolean error = false;
                nom_client = request.getParameter("client");
                p = personnelFacade.findByNomPrenom(nom_client);

                Region r1 = p.getService().getSite().getRegion();
                Region r2 = new Region();
                try {
                    r2 = p2.getService().getSite().getRegion();
                } catch (Exception e) {
                    error = true;
                    r2 = regionFacade.findAll().get(0);
                }

                if (r2.getNomRegion().equalsIgnoreCase(r1.getNomRegion()) || error) {

                    request.setAttribute("personnel", p);
                    request.setAttribute("edit", edit);
                    request.setAttribute("nom_client", nom_client);
                    request.setAttribute("vue", vue);
                    request.setAttribute("unlock", unlock);
                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                } else {
                    request.setAttribute("vue", vue);
                    Message message = new Message("Ce personnel n'est pas dans la region du " + r2.getNomRegion());
                    request.setAttribute("messag", message);

                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                }
            } else if (action.equalsIgnoreCase("ajouter")) {
                List<CommandePersonnel> l = new ArrayList<>();
                if (!interne.isEmpty()) {
                    if (interne.equalsIgnoreCase("yes")) {

                        l = commandePersonnelFacade.findCommandeNonReceptionner(p2.getIdPersonnel(), "non");
                    } else {

                        l = commandePersonnelFacade.findCommandeNonReceptionner(p.getIdPersonnel(), "non");
                    }
                }

                if (l.isEmpty()) {

                    String appariel = request.getParameter("appariel");
                    int designation = Integer.parseInt(request.getParameter("designation"));
                    int quantites = Integer.parseInt(request.getParameter("quantite"));

                    Article a = articleFacade.find(designation);
                    boolean get = false;
                    boolean butt = false;
                    StockproduitMS stock = new StockproduitMS();
                    try {
                        stock = stockproduitMSFacade.findByDesignationByidMS(idMS, a.getDesignation());
                    } catch (Exception e) {
                        get = true;
                    }

                    if (!get) {

                        try {
                            Butget b = butgetFacade.findByIdServiceAndTypeButget(p.getService().getIdService(), a.getCategorie().getTypeCategorie());

                        } catch (Exception e) {
                            butt = true;
                        }

                        if (!butt) {

                            CommandePersonnel cp = new CommandePersonnel();
                            OperationConsommateur oc = new OperationConsommateur();
                            boolean repeat = false;
                            if (!listeCommandes.isEmpty()) {
                                for (CommandePersonnel commande : listeCommandes) {
                                    if (commande.getDesignations().equalsIgnoreCase(stock.getDesignation())) {
                                        repeat = true;
                                        break;
                                    }

                                }
                            }

                            if (!repeat) {
                                cp.setCodeAppareil(new Appariel(appariel));
                                //cp.setIdCommande((int) (Math.random() * (10000000)));
                                cp.setDate(date_du_jour.dateJour());
                                cp.setDesignations(stock.getDesignation());
                                cp.setEtatCommande("encour de traitement");
                                cp.setQuantite(quantites);
                                cp.setIdMS(new MagasinSecondaire(idMS));

                                oc.setCodeProduit(stock.getCodeProduit());
                                oc.setAppariel(cp.getCodeAppareil().getNumeroParck());
                                oc.setCategorie(stock.getCategorie().getNomCategorie());
                                oc.setDate(date_du_jour.dateJour());
                                oc.setDesignation(stock.getDesignation());

                                oc.setMagasin(new MagasinSecondaire(idMS));
                                oc.setQuantite(quantites);
                                oc.setPrix(stock.getPrixUnitaire());
                                oc.setPrixTotal(stock.getPrixUnitaire() * cp.getQuantite());

                                if (!interne.isEmpty()) {
                                    if (interne.equalsIgnoreCase("yes")) {

                                        oc.setPersonnel(new Personnel(p2.getIdPersonnel()));
                                        cp.setIdPersonnel(new Personnel(p2.getIdPersonnel()));

                                    } else {

                                        oc.setPersonnel(new Personnel(p.getIdPersonnel()));
                                        cp.setIdPersonnel(new Personnel(p.getIdPersonnel()));
                                    }
                                }

                                if (cp.getQuantite() <= stock.getQuantite()) {

                                    listeCommandes.add(cp);
                                    listeOperations.add(oc);

                                    request.setAttribute("edit", edit);
                                    request.setAttribute("nom_client", nom_client);
                                    request.setAttribute("vue", vue);
                                    request.setAttribute("listeoperation", listeOperations);

                                    request.setAttribute("unlock", unlock);
                                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                                } else {

                                    request.setAttribute("edit", edit);
                                    request.setAttribute("nom_client", nom_client);
                                    request.setAttribute("vue", vue);
                                    request.setAttribute("listecommande", listeCommandes);
                                    request.setAttribute("listeoperation", listeOperations);
                                    //request.setAttribute("personnel", p);
                                    request.setAttribute("unlock", unlock);
                                    Message message = new Message("Une Erreur est Survenue le Stock des " + cp.getDesignations() + " est insuffissant veuillez revoir la Quantite que vous êtes entrain de commander");
                                    request.setAttribute("message", message);

                                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                                }
                            } else {
                                Message message = new Message("Une Erreur est survenue Vous essayez de commander deux fois un même Article : " + stock.getDesignation());
                                request.setAttribute("message", message);
                                request.setAttribute("edit", edit);
                                request.setAttribute("nom_client", nom_client);
                                request.setAttribute("vue", vue);
                                request.setAttribute("listeoperation", listeOperations);
                                //request.setAttribute("personnel", p);
                                request.setAttribute("unlock", unlock);
                                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                            }
                        } else {
                            Message message = new Message("Votre service ne possède aucun budget pour ce type d'article");
                            request.setAttribute("message", message);
                            request.setAttribute("edit", edit);
                            request.setAttribute("nom_client", nom_client);
                            request.setAttribute("vue", vue);
                            request.setAttribute("listeoperation", listeOperations);
                            //request.setAttribute("personnel", p);
                            request.setAttribute("unlock", unlock);
                            request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                        }
                    } else {
                        Message message = new Message("Une Erreur est survenue Vous essayez de commander deux fois un même Article : " + stock.getDesignation());
                        request.setAttribute("message", message);
                        request.setAttribute("edit", edit);
                        request.setAttribute("nom_client", nom_client);
                        request.setAttribute("vue", vue);
                        request.setAttribute("listeoperation", listeOperations);
                        //request.setAttribute("personnel", p);
                        request.setAttribute("unlock", unlock);
                        request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                    }
                } else {

                    request.setAttribute("vue", vue);
                    Message message = new Message("Vous ne pouvez pas passer une nouvelle commande tanque vous n'avez pas approuvé la réception de la commande précédente");
                    request.setAttribute("message", message);
                    request.setAttribute("nom_client", nom_client);
                    request.setAttribute("commandesEncour", l);
                    request.setAttribute("vue", vue);
                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                }
            } else if (action.equalsIgnoreCase("delete")) {
               // Personnel personnel = new Personnel();
                String code = request.getParameter("code");
                String designation = "";
                for (int i = 0; i < listeOperations.size(); i++) {
                    OperationConsommateur oc = listeOperations.get(i);

                    if (oc.getCodeProduit().equals(code)) {
                        designation = oc.getDesignation();

                        listeOperations.remove(i);
                        break;
                    }
                }
                for (int i = 0; i < listeCommandes.size(); i++) {
                    CommandePersonnel cp = listeCommandes.get(i);

                    if (cp.getDesignations().equals(designation)) {                       
                        listeCommandes.remove(i);
                        break;
                    }
                }

                request.setAttribute("edit", edit);
                request.setAttribute("nom_client", nom_client);
                request.setAttribute("vue", vue);
                request.setAttribute("personnel", p);
                request.setAttribute("unlock", unlock);
                request.setAttribute("listeoperation", listeOperations);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("update")) {

                String designation = "";
                String code = request.getParameter("code");
                int quantite = Integer.parseInt(request.getParameter("qte"));

                for (int i = 0; i < listeOperations.size(); i++) {
                    OperationConsommateur oc = listeOperations.get(i);

                    if (listeOperations.get(i).getCodeProduit().equals(code)) {
                        listeOperations.get(i).setQuantite(quantite);
                        listeOperations.get(i).setPrixTotal(listeOperations.get(i).getPrix() * (double) quantite);
                        designation = oc.getDesignation();
                        break;

                    }
                }
                for (int i = 0; i < listeCommandes.size(); i++) {

                    if (listeCommandes.get(i).getDesignations().equalsIgnoreCase(designation)) {
                        listeCommandes.get(i).setQuantite(quantite);
                        break;

                    }
                }

                response.setContentType("application/text");
                response.getWriter().print(quantite);

            } else if (action.equalsIgnoreCase("saveClient")) {

                if (!interne.isEmpty()) {
                    if (interne.equalsIgnoreCase("yes")) {

                        request.setAttribute("edit", edit);
                    }
                }

                for (int i = 0; i < listeCommandes.size(); i++) {
                    CommandePersonnel cp = listeCommandes.get(i);
                    commandePersonnelFacade.create(cp);
                }
                listeCommandes.clear();
                listeOperations.clear();
                nom_client = "";

                Message message = new Message("Votre Commande à bien été Enregistrer");
                request.setAttribute("message", message);
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
