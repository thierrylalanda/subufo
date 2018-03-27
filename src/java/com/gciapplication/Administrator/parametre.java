/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.Administrator;

import com.gciapplication.entity.Article;
import com.gciapplication.entity.Butget;
import com.gciapplication.entity.CategorieProduit;
import com.gciapplication.entity.CategorieproduitMP;
import com.gciapplication.entity.CategorieproduitMS;
import com.gciapplication.entity.CentreCout;
import com.gciapplication.entity.CommandeMP;
import com.gciapplication.entity.CommandeMS;
import com.gciapplication.entity.CommandePersonnel;
import com.gciapplication.entity.Direction;
import com.gciapplication.entity.EcartinventaireMP;
import com.gciapplication.entity.EcartinventaireMS;
import com.gciapplication.entity.MagasinPrincipal;
import com.gciapplication.entity.MagasinSecondaire;
import com.gciapplication.entity.OperationConsommateur;
import com.gciapplication.entity.Personnel;
import com.gciapplication.entity.Region;
import com.gciapplication.entity.Service;
import com.gciapplication.entity.Site;
import com.gciapplication.entity.StatistiqueArticlesDirection;
import com.gciapplication.entity.StatistiqueArticlesMagasinMp;
import com.gciapplication.entity.StatistiqueArticlesMagasinMs;
import com.gciapplication.entity.StatistiqueArticlesPersonnel;
import com.gciapplication.entity.StatistiqueArticlesRegion;
import com.gciapplication.entity.StatistiqueArticlesService;
import com.gciapplication.entity.StatistiqueArticlesSite;
import com.gciapplication.entity.StatistiqueCategoriMagasinMp;
import com.gciapplication.entity.StatistiqueCategorieDirection;
import com.gciapplication.entity.StatistiqueCategorieMagasinMs;
import com.gciapplication.entity.StatistiqueCategoriePersonnel;
import com.gciapplication.entity.StatistiqueCategorieRegion;
import com.gciapplication.entity.StatistiqueCategorieService;
import com.gciapplication.entity.StatistiqueCategorieSite;
import com.gciapplication.entity.StockproduitMP;
import com.gciapplication.entity.StockproduitMS;
import com.gciapplication.entity.TransfertStock;
import com.gciapplication.session.entity.ArticleFacadeLocal;
import com.gciapplication.session.entity.ButgetFacadeLocal;
import com.gciapplication.session.entity.CategorieProduitFacadeLocal;
import com.gciapplication.session.entity.CategorieproduitMPFacadeLocal;
import com.gciapplication.session.entity.CategorieproduitMSFacadeLocal;
import com.gciapplication.session.entity.CentreCoutFacadeLocal;
import com.gciapplication.session.entity.CommandeMPFacadeLocal;
import com.gciapplication.session.entity.CommandeMSFacadeLocal;
import com.gciapplication.session.entity.CommandePersonnelFacadeLocal;
import com.gciapplication.session.entity.DirectionFacadeLocal;
import com.gciapplication.session.entity.EcartinventaireMPFacadeLocal;
import com.gciapplication.session.entity.EcartinventaireMSFacadeLocal;
import com.gciapplication.session.entity.MagasinPrincipalFacadeLocal;
import com.gciapplication.session.entity.MagasinSecondaireFacadeLocal;
import com.gciapplication.session.entity.MouvementProduitsFacadeLocal;
import com.gciapplication.session.entity.OperationConsommateurFacadeLocal;
import com.gciapplication.session.entity.PersonnelFacadeLocal;
import com.gciapplication.session.entity.RegionFacadeLocal;
import com.gciapplication.session.entity.ServiceFacadeLocal;
import com.gciapplication.session.entity.SiteFacadeLocal;
import com.gciapplication.session.entity.StatistiqueArticlesDirectionFacadeLocal;
import com.gciapplication.session.entity.StatistiqueArticlesMagasinMpFacadeLocal;
import com.gciapplication.session.entity.StatistiqueArticlesMagasinMsFacadeLocal;
import com.gciapplication.session.entity.StatistiqueArticlesPersonnelFacadeLocal;
import com.gciapplication.session.entity.StatistiqueArticlesRegionFacadeLocal;
import com.gciapplication.session.entity.StatistiqueArticlesServiceFacadeLocal;
import com.gciapplication.session.entity.StatistiqueArticlesSiteFacadeLocal;
import com.gciapplication.session.entity.StatistiqueCategoriMagasinMpFacadeLocal;
import com.gciapplication.session.entity.StatistiqueCategorieDirectionFacadeLocal;
import com.gciapplication.session.entity.StatistiqueCategorieMagasinMsFacadeLocal;
import com.gciapplication.session.entity.StatistiqueCategoriePersonnelFacadeLocal;
import com.gciapplication.session.entity.StatistiqueCategorieRegionFacadeLocal;
import com.gciapplication.session.entity.StatistiqueCategorieServiceFacadeLocal;
import com.gciapplication.session.entity.StatistiqueCategorieSiteFacadeLocal;
import com.gciapplication.session.entity.StockproduitMPFacadeLocal;
import com.gciapplication.session.entity.StockproduitMSFacadeLocal;
import com.gciapplication.session.entity.TransfertStockFacadeLocal;
import com.gestion.DataSource.mysql.Message;
import com.gestion.DataSource.mysql.date_du_jour;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONException;

/**
 *
 * @author messi
 */
@WebServlet(name = "parametre", urlPatterns = {"/parametre"})
public class parametre extends HttpServlet {

    @EJB
    private EcartinventaireMSFacadeLocal ecartinventaireMSFacade;

    @EJB
    private EcartinventaireMPFacadeLocal ecartinventaireMPFacade;

    @EJB
    private CommandeMPFacadeLocal commandeMPFacade;

    @EJB
    private CommandeMSFacadeLocal commandeMSFacade;

    @EJB
    private CommandePersonnelFacadeLocal commandePersonnelFacade;

    @EJB
    private CentreCoutFacadeLocal centreCoutFacade;

    @EJB
    private StatistiqueCategoriePersonnelFacadeLocal statistiqueCategoriePersonnelFacade;

    @EJB
    private StatistiqueCategoriMagasinMpFacadeLocal statistiqueCategoriMagasinMpFacade;

    @EJB
    private StatistiqueCategorieDirectionFacadeLocal statistiqueCategorieDirectionFacade;

    @EJB
    private StatistiqueCategorieMagasinMsFacadeLocal statistiqueCategorieMagasinMsFacade;

    @EJB
    private StatistiqueCategorieRegionFacadeLocal statistiqueCategorieRegionFacade;

    @EJB
    private StatistiqueCategorieSiteFacadeLocal statistiqueCategorieSiteFacade;

    @EJB
    private StatistiqueCategorieServiceFacadeLocal statistiqueCategorieServiceFacade;

    @EJB
    private PersonnelFacadeLocal personnelFacade;

    @EJB
    private StatistiqueArticlesMagasinMpFacadeLocal statistiqueArticlesMagasinMpFacade;

    @EJB
    private StatistiqueArticlesSiteFacadeLocal statistiqueArticlesSiteFacade;

    @EJB
    private StatistiqueArticlesServiceFacadeLocal statistiqueArticlesServiceFacade;

    @EJB
    private StatistiqueArticlesRegionFacadeLocal statistiqueArticlesRegionFacade;

    @EJB
    private StatistiqueArticlesPersonnelFacadeLocal statistiqueArticlesPersonnelFacade;

    @EJB
    private StatistiqueArticlesMagasinMsFacadeLocal statistiqueArticlesMagasinMsFacade;

    @EJB
    private StatistiqueArticlesDirectionFacadeLocal statistiqueArticlesDirectionFacade;

    @EJB
    private TransfertStockFacadeLocal transfertStockFacade;

    @EJB
    private OperationConsommateurFacadeLocal operationConsommateurFacade;

    @EJB
    private DirectionFacadeLocal directionFacade;

    @EJB
    private SiteFacadeLocal siteFacade;

    @EJB
    private ServiceFacadeLocal serviceFacade;

    @EJB
    private RegionFacadeLocal regionFacade;

    @EJB
    private ButgetFacadeLocal butgetFacade;

    @EJB
    private CategorieproduitMSFacadeLocal categorieproduitMSFacade;

    @EJB
    private CategorieproduitMPFacadeLocal categorieproduitMPFacade;

    @EJB
    private StockproduitMPFacadeLocal stockproduitMPFacade;

    @EJB
    private StockproduitMSFacadeLocal stockproduitMSFacade;

    @EJB
    private MagasinPrincipalFacadeLocal magasinPrincipalFacade;

    @EJB
    private MagasinSecondaireFacadeLocal magasinSecondaireFacade;

    @EJB
    private CategorieProduitFacadeLocal categorieProduitFacade;
    @PersistenceContext(unitName = "GCIApplicationPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    @EJB
    private ArticleFacadeLocal articleFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        if (session.getAttribute("id") != null) {
            //Personnel p = (Personnel) session.getAttribute("personnel");
            int niveau = 0;
            String redirect;
            if (request.getParameter("niveau") != null) {
                niveau = Integer.parseInt(request.getParameter("niveau"));
            }
            switch (niveau) {
                case 4:
                    redirect = "/WEB-INF/controleurs/main.jsp";
                    break;
                case 2:
                    redirect = "/WEB-INF/magasignerS/main.jsp";
                    break;
                case 3:
                    redirect = "/WEB-INF/magasignierP/main.jsp";
                    break;
                default:
                    request.setAttribute("sites", siteFacade.findAll());
                    request.setAttribute("directions", directionFacade.findAll());
                    request.setAttribute("services", serviceFacade.findAll());
                    redirect = "/WEB-INF/administrateur/main1.jsp";
                    break;
            }
            String action = request.getParameter("action");
            String vue = request.getParameter("vue");
            request.setAttribute("vue", vue);
            List<Region> r = regionFacade.findAll();
            request.setAttribute("regions", r);
            List<CategorieProduit> catProdui = categorieProduitFacade.findAll();
            //catProduits.stream().forEach(System.out::println);
            List<CategorieProduit> catProduit = catProdui.stream()
                    .filter(s -> s.getStocker() == null)
                    .collect(Collectors.toList());
            System.out.println("taille " + catProduit.size() + " Et l'autre " + catProdui.size());
            //  catProduit.stream().forEach(System.out::println);
            request.setAttribute("type_categorie", catProduit);
            request.setAttribute("categories", catProduit);
            // les Reporting commence ici
            if (action.equalsIgnoreCase("getRepporting")) {

                String dates = request.getParameter("interval");
                String[] d = dates.split("-");
                String datedebut = d[0];
                String datefin = d[1];
                int idmag;
                Date d1 = date_du_jour.dateConvert(datedebut);
                Date d2 = date_du_jour.dateConvert(datefin);

                String[] categorie = request.getParameterValues("categorie");
                List<CategorieProduit> catProduits = new ArrayList<>();
                for (String id : categorie) {
                    CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                    catProduits.add(catprod);

                }

                if (request.getParameter("region") != null) {
                    String[] reg = request.getParameterValues("region");
                    List<Region> allregion = new ArrayList<>();
                    for (String string : reg) {
                        Region r1 = regionFacade.find(Integer.parseInt(string));
                        allregion.add(r1);
                    }
                    List<Map> maps = new ArrayList<>();
                    for (Region region : allregion) {
                        List<StatistiqueArticlesRegion> lregion = new ArrayList<>();
                        Map<String, List<StatistiqueArticlesRegion>> m = new HashMap();
                        for (CategorieProduit cat : catProduits) {
                            for (Article art : cat.getArticleList()) {
                                StatistiqueArticlesRegion articlesRegion = statistiqueArticlesRegionFacade.findAllByArticlesByPeriode(region.getIdRegion(), art.getDesignation(), d1, d2);
                                if (articlesRegion != null) {
                                    articlesRegion.setPrix(art.getPrix());
                                    lregion.add(articlesRegion);
                                }

                            }
                        }
                        m.put(region.getNomRegion(), lregion);
                        maps.add(m);
                    }

                    Message message = new Message("Etat de Consommation Par Article de la Periode Du " + datedebut + " AU " + datefin + " pour la Région: ");
                    request.setAttribute("message", message);
                    request.setAttribute("statreporting", "region");
                    request.setAttribute("services", serviceFacade.findAll());
                    request.setAttribute("regions", regionFacade.findAll());
                    request.setAttribute("sites", siteFacade.findAll());
                    request.setAttribute("reporting", maps);

                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                } else if (request.getParameter("id_magasin") != null) {

                    List<Map> maps = new ArrayList<>();

                    if (niveau == 2 || request.getParameter("nav") != null) {
                        idmag = Integer.parseInt(request.getParameter("id_magasin"));
                        MagasinSecondaire ms = magasinSecondaireFacade.find(idmag);
                        String[] categorieMS = request.getParameterValues("categorie");
                        List<CategorieproduitMS> catProduitsMS = new ArrayList<>();
                        for (String id : categorieMS) {
                            CategorieproduitMS catprod = categorieproduitMSFacade.find(Integer.parseInt(id));
                            catProduitsMS.add(catprod);
                        }

                        List<StatistiqueArticlesMagasinMs> lmagasinMs = new ArrayList<>();
                        for (CategorieproduitMS cat : catProduitsMS) {
                            for (StockproduitMS art : cat.getStockproduitMSList()) {
                                StatistiqueArticlesMagasinMs articlesMagasin = statistiqueArticlesMagasinMsFacade.findAllByArticlesByPeriode(idmag, art.getDesignation(), d1, d2);
                                if (articlesMagasin != null) {
                                    articlesMagasin.setPrix(art.getPrixUnitaire());
                                    lmagasinMs.add(articlesMagasin);
                                }
                            }
                        }
                        request.setAttribute("idMS", idmag);
                        request.setAttribute("reporting", lmagasinMs);
                        Message message = new Message("Etat de Consommation Par Article de la Periode Du " + datedebut + " AU " + datefin + " pour le Magasin: ");
                        request.setAttribute("message", message);
                        request.setAttribute("rapport", "ok");
                        request.setAttribute("rapportms", "ok");
                        request.setAttribute("categories", categorieproduitMSFacade.findCatByidMS(idmag));
                    } else {
                        String[] reg = request.getParameterValues("id_magasin");
                        List<MagasinSecondaire> allMS = new ArrayList<>();

                        for (String string : reg) {
                            MagasinSecondaire ms = magasinSecondaireFacade.find(Integer.parseInt(string));
                            allMS.add(ms);
                        }
                        for (MagasinSecondaire p : allMS) {
                            List<StatistiqueArticlesMagasinMs> lmagasinMs = new ArrayList<>();
                            Map<String, List<StatistiqueArticlesMagasinMs>> m = new HashMap();
                            for (CategorieProduit cat : catProduits) {
                                for (Article art : cat.getArticleList()) {
                                    StatistiqueArticlesMagasinMs articlesMagasin = statistiqueArticlesMagasinMsFacade.findAllByArticlesByPeriode(p.getIdMagasin(), art.getDesignation(), d1, d2);
                                    if (articlesMagasin != null) {
                                        articlesMagasin.setPrix(art.getPrix());
                                        lmagasinMs.add(articlesMagasin);
                                    }
                                }
                            }
                            m.put(p.getNomMagasin(), lmagasinMs);
                            maps.add(m);
                        }
                        request.setAttribute("reporting", maps);
                        Message message = new Message("Etat de Consommation Par Article de la Periode Du " + datedebut + " AU " + datefin + " pour le Magasin: ");
                        request.setAttribute("message", message);
                    }

                    request.setAttribute("statreporting", "MS");

                    request.setAttribute("services", serviceFacade.findAll());
                    request.setAttribute("regions", regionFacade.findAll());
                    request.setAttribute("sites", siteFacade.findAll());

                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                } else if (request.getParameter("personnel") != null) {
                    String[] reg = request.getParameterValues("personnel");
                    List<Personnel> allpersonnel = new ArrayList<>();

                    for (String string : reg) {
                        Personnel p = personnelFacade.find(Integer.parseInt(string));
                        allpersonnel.add(p);
                    }
                    List<Map> maps = new ArrayList<>();
                    for (Personnel p : allpersonnel) {
                        List<StatistiqueArticlesPersonnel> lpersonnel = new ArrayList<>();
                        Map<String, List<StatistiqueArticlesPersonnel>> m = new HashMap();
                        for (CategorieProduit cat : catProduits) {
                            for (Article art : cat.getArticleList()) {
                                StatistiqueArticlesPersonnel articlespersonnel = statistiqueArticlesPersonnelFacade.findAllByArticlesByPeriode(p.getIdPersonnel(), art.getDesignation(), d1, d2);

                                if (articlespersonnel != null) {
                                    articlespersonnel.setPrix(art.getPrix());
                                    lpersonnel.add(articlespersonnel);
                                }

                            }
                        }
                        m.put(p.getNomPrenom(), lpersonnel);
                        maps.add(m);
                    }
                    Message message = new Message("Etat de Consommation Par Article de la Periode Du " + datedebut + " AU " + datefin + " pour le Personnel: ");
                    request.setAttribute("message", message);
                    request.setAttribute("statreporting", "personnel");
                    request.setAttribute("services", serviceFacade.findAll());
                    request.setAttribute("regions", regionFacade.findAll());
                    request.setAttribute("sites", siteFacade.findAll());
                    request.setAttribute("reporting", maps);

                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                } else if (request.getParameter("service") != null) {

                    String[] reg = request.getParameterValues("service");
                    List<Service> allservice = new ArrayList<>();

                    for (String string : reg) {
                        Service s = serviceFacade.find(Integer.parseInt(string));
                        allservice.add(s);
                    }
                    List<Map> maps = new ArrayList<>();
                    for (Service p : allservice) {
                        List<StatistiqueArticlesService> lservice = new ArrayList<>();
                        Map<String, List<StatistiqueArticlesService>> m = new HashMap();
                        for (CategorieProduit cat : catProduits) {
                            for (Article art : cat.getArticleList()) {
                                StatistiqueArticlesService articlesService = statistiqueArticlesServiceFacade.findAllByArticlesByPeriode(p.getIdService(), art.getDesignation(), d1, d2);
                                if (articlesService != null) {
                                    articlesService.setPrix(art.getPrix());
                                    lservice.add(articlesService);
                                }

                            }
                        }
                        m.put(p.getNomService(), lservice);
                        maps.add(m);
                    }

                    Message message = new Message("Etat de Consommation Par Article de la Periode Du " + datedebut + " AU " + datefin + " pour le Service: ");
                    request.setAttribute("message", message);
                    request.setAttribute("statreporting", "service");
                    request.setAttribute("services", serviceFacade.findAll());
                    request.setAttribute("regions", regionFacade.findAll());
                    request.setAttribute("sites", siteFacade.findAll());
                    request.setAttribute("reporting", maps);

                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                } else if (request.getParameter("site") != null) {

                    String[] reg = request.getParameterValues("site");
                    List<Site> allsite = new ArrayList<>();

                    for (String string : reg) {
                        Site s = siteFacade.find(Integer.parseInt(string));
                        allsite.add(s);
                    }
                    List<Map> maps = new ArrayList<>();
                    for (Site p : allsite) {
                        List<StatistiqueArticlesSite> lsite = new ArrayList<>();
                        Map<String, List<StatistiqueArticlesSite>> m = new HashMap();
                        for (CategorieProduit cat : catProduits) {
                            for (Article art : cat.getArticleList()) {
                                StatistiqueArticlesSite articlesSite = statistiqueArticlesSiteFacade.findAllByArticlesByPeriode(p.getIdSite(), art.getDesignation(), d1, d2);
                                if (articlesSite != null) {
                                    articlesSite.setPrix(art.getPrix());
                                    lsite.add(articlesSite);
                                }

                            }
                        }
                        m.put(p.getNomSite(), lsite);
                        maps.add(m);
                    }
                    Message message = new Message("Etat de Consommation Par Article de la Periode Du " + datedebut + " AU " + datefin + " pour le Site: ");
                    request.setAttribute("message", message);
                    request.setAttribute("statreporting", "site");
                    request.setAttribute("services", serviceFacade.findAll());
                    request.setAttribute("regions", regionFacade.findAll());
                    request.setAttribute("sites", siteFacade.findAll());
                    request.setAttribute("reporting", maps);

                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                } else if (request.getParameter("direction") != null) {

                    String[] reg = request.getParameterValues("direction");
                    List<Direction> alldirect = new ArrayList<>();

                    for (String string : reg) {
                        Direction s = directionFacade.find(Integer.parseInt(string));
                        alldirect.add(s);
                    }
                    List<Map> maps = new ArrayList<>();
                    for (Direction p : alldirect) {
                        List<StatistiqueArticlesDirection> ldirection = new ArrayList<>();
                        Map<String, List<StatistiqueArticlesDirection>> m = new HashMap();
                        for (CategorieProduit cat : catProduits) {
                            for (Article art : cat.getArticleList()) {
                                StatistiqueArticlesDirection direction = statistiqueArticlesDirectionFacade.findAllByArticlesByPeriode(p.getIdDirection(), art.getDesignation(), d1, d2);
                                if (direction != null) {
                                    direction.setPrix(art.getPrix());
                                    ldirection.add(direction);
                                }

                            }
                        }
                        m.put(p.getNomDirection(), ldirection);
                        maps.add(m);
                    }
                    Message message = new Message("Etat de Consommation Par Article de la Periode Du " + datedebut + " AU " + datefin + " pour la Direction: ");
                    request.setAttribute("message", message);
                    request.setAttribute("statreporting", "direction");
                    request.setAttribute("services", serviceFacade.findAll());
                    request.setAttribute("regions", regionFacade.findAll());
                    request.setAttribute("sites", siteFacade.findAll());
                    request.setAttribute("reporting", maps);

                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                } else if (request.getParameter("id_magasinP") != null) {

                    if (niveau == 3 || request.getParameter("nav") != null) {
                        MagasinPrincipal mp = magasinPrincipalFacade.find(Integer.parseInt(request.getParameter("id_magasinP")));
                        String[] categorieMP = request.getParameterValues("categorie");
                        List<CategorieproduitMP> catProduitsMP = new ArrayList<>();
                        for (String id : categorieMP) {
                            CategorieproduitMP catprod = categorieproduitMPFacade.find(Integer.parseInt(id));
                            catProduitsMP.add(catprod);
                        }

                        List<StatistiqueArticlesMagasinMp> lmagasinMp = new ArrayList<>();
                        for (CategorieproduitMP cat : catProduitsMP) {
                            for (StockproduitMP art : cat.getStockproduitMPList()) {
                                StatistiqueArticlesMagasinMp articlesMagasinMp = statistiqueArticlesMagasinMpFacade.findAllByArticlesByPeriode(mp.getIdMagasin(), art.getDesignation(), d1, d2);
                                if (articlesMagasinMp != null) {
                                    articlesMagasinMp.setPrix(art.getPrixUnitaire());
                                    lmagasinMp.add(articlesMagasinMp);
                                }
                            }
                        }
                        request.setAttribute("categories", mp.getCategorieproduitMPList());
                        request.setAttribute("magasinP", mp);
                        request.setAttribute("vue", vue);
                        request.setAttribute("idMP", mp.getIdMagasin());
                        request.setAttribute("reporting", lmagasinMp);
                        Message message = new Message("Etat de Consommation Par Article de la Periode Du " + datedebut + " AU " + datefin + " pour le Magasin: ");
                        request.setAttribute("message", message);
                        request.setAttribute("rapportmp", "ok");
                        request.removeAttribute("stock");

                        request.setAttribute("categories", categorieproduitMPFacade.findCatByidMP(mp.getIdMagasin()));
                    } else {

                        String[] reg = request.getParameterValues("id_magasinP");
                        List<MagasinPrincipal> allMP = new ArrayList<>();

                        for (String string : reg) {
                            MagasinPrincipal mp = magasinPrincipalFacade.find(Integer.parseInt(string));
                            allMP.add(mp);
                        }

                        List<Map> maps = new ArrayList<>();
                        for (MagasinPrincipal p : allMP) {
                            List<StatistiqueArticlesMagasinMp> lmagasinMp = new ArrayList<>();
                            Map m = new HashMap();
                            for (CategorieProduit cat : catProduits) {
                                for (Article art : cat.getArticleList()) {
                                    StatistiqueArticlesMagasinMp articlesMagasinMp = statistiqueArticlesMagasinMpFacade.findAllByArticlesByPeriode(p.getIdMagasin(), art.getDesignation(), d1, d2);
                                    if (articlesMagasinMp != null) {
                                        articlesMagasinMp.setPrix(art.getPrix());
                                        lmagasinMp.add(articlesMagasinMp);
                                    }

                                }
                            }
                            m.put(p.getNomMagasin(), lmagasinMp);
                            maps.add(m);
                        }
                        request.setAttribute("reporting", maps);
                        Message message = new Message("Etat de Consommation Par Article de la Periode Du " + datedebut + " AU " + datefin + " pour le Magasin: ");
                        request.setAttribute("message", message);
                    }

                    request.setAttribute("statreporting", "MP");

                    request.setAttribute("services", serviceFacade.findAll());
                    request.setAttribute("regions", regionFacade.findAll());
                    request.setAttribute("sites", siteFacade.findAll());

                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                }

            } else if (action.equalsIgnoreCase("ReportingAllUserRegion")) {

                String[] categorie = request.getParameterValues("categorie");
                List<CategorieProduit> cps = new ArrayList<>();
                for (String id : categorie) {
                    CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                    cps.add(catprod);

                }
                int region = Integer.parseInt(request.getParameter("region"));
                String dates = request.getParameter("interval");
                String[] d = dates.split("-");
                String datedebut = d[0];
                String datefin = d[1];
                Date d1 = date_du_jour.dateConvert(datedebut);
                Date d2 = date_du_jour.dateConvert(datefin);

                Region r1 = regionFacade.find(region);
                JSONArray object = new JSONArray();
                List<OperationConsommateur> allopera = new ArrayList<>();

                for (CategorieProduit cat : cps) {
                    List<OperationConsommateur> oc = operationConsommateurFacade.findReportingAllUserRegion(region, cat.getTypeCategorie(), date_du_jour.caseDateToTimestamp(d1), date_du_jour.caseDateToTimestamp(d2));
                    if (!oc.isEmpty()) {
                        for (OperationConsommateur occ : oc) {
                            allopera.add(occ);
                        }
                    }
                }
                System.out.println(allopera);
                for (Service ser : serviceFacade.findAllServiseByRegion(r1.getNomRegion())) {
                    HashMap map = new HashMap();
                    JSONArray AllConsommation = new JSONArray();
                    double total = 0;
                    boolean ok = false;
                    for (OperationConsommateur op : allopera) {
                        if (ser.getNomService().equalsIgnoreCase(op.getPersonnel().getService().getNomService())) {
                            total += op.getPrixTotal();
                            HashMap dat = new HashMap();

                            dat.put("date", new java.sql.Date(op.getDate().getTime()));
                            dat.put("Personnel", op.getPersonnel().getNomPrenom());
                            dat.put("Categorie", op.getCategorie());
                            dat.put("Designation", op.getDesignation());
                            dat.put("Quantite", op.getQuantite());
                            dat.put("PU", op.getPrix());
                            dat.put("P.T", op.getPrixTotal());

                            dat.put("Appareil", op.getAppariel());
                            // dat.put("magasin", op.getMagasin().getNomMagasin());

                            AllConsommation.put(dat);

                            ok = true;
                        }
                    }
                    if (ok) {

                        map.put("legende", "Service : " + ser.getNomService());
                        map.put("data", AllConsommation);

                        object.put(map);
                    }

                }
                System.out.println(object);
                response.setContentType("application/json");
                response.getWriter().print(object);

            } else if (action.equalsIgnoreCase("ReportingAllUserSite")) {

                String[] categorie = request.getParameterValues("categorie");
                String[] sit = request.getParameterValues("site");
                List<CategorieProduit> cps = new ArrayList<>();
                for (String id : categorie) {
                    CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                    cps.add(catprod);

                }
                List<Site> allsite = new ArrayList<>();
                for (String id : sit) {
                    Site r1 = siteFacade.find(Integer.parseInt(id));
                    allsite.add(r1);

                }

                String dates = request.getParameter("interval");
                String[] d = dates.split("-");
                String datedebut = d[0];
                String datefin = d[1];
                Date d1 = date_du_jour.dateConvert(datedebut);
                Date d2 = date_du_jour.dateConvert(datefin);

                JSONArray object = new JSONArray();
                List<OperationConsommateur> allopera = new ArrayList<>();

                for (Site site : allsite) {
                    for (CategorieProduit cat : cps) {
                        List<OperationConsommateur> oc = operationConsommateurFacade.findReportingAllUserSite(site.getIdSite(), cat.getTypeCategorie(), date_du_jour.caseDateToTimestamp(d1), date_du_jour.caseDateToTimestamp(d2));
                        if (!oc.isEmpty()) {
                            for (OperationConsommateur occ : oc) {
                                allopera.add(occ);
                            }
                        }
                    }
                }
                for (Site ser : allsite) {
                    HashMap map = new HashMap();
                    JSONArray AllConsommation = new JSONArray();
                    double total = 0;
                    boolean ok = false;
                    for (OperationConsommateur op : allopera) {
                        if (ser.getNomSite().equalsIgnoreCase(op.getPersonnel().getService().getSite().getNomSite())) {
                            total += op.getPrixTotal();
                            HashMap dat = new HashMap();

                            dat.put("date", new java.sql.Date(op.getDate().getTime()));
                            dat.put("Personnel", op.getPersonnel().getNomPrenom());
                            dat.put("Categorie", op.getCategorie());
                            dat.put("Designation", op.getDesignation());
                            dat.put("Quantite", op.getQuantite());
                            dat.put("PU", op.getPrix());
                            dat.put("P.T", op.getPrixTotal());
                            dat.put("Appareil", op.getAppariel());
                            //  dat.put("magasin", op.getMagasin().getNomMagasin());

                            AllConsommation.put(dat);

                            ok = true;
                        }
                    }
                    if (ok) {

                        map.put("legende", "Site : " + ser.getNomSite());
                        map.put("data", AllConsommation);

                        object.put(map);
                    }
                }

                response.setContentType("application/json");
                response.getWriter().print(object);

            } else if (action.equalsIgnoreCase("ReportingAllUserservice")) {

                String[] categorie = request.getParameterValues("categorie");
                String[] serv = request.getParameterValues("service");
                List<CategorieProduit> cps = new ArrayList<>();
                for (String id : categorie) {
                    CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                    cps.add(catprod);

                }

                List<Service> allservice = new ArrayList<>();
                for (String id : serv) {
                    Service r1 = serviceFacade.find(Integer.parseInt(id));
                    allservice.add(r1);
                }

                String dates = request.getParameter("interval");
                String[] d = dates.split("-");
                String datedebut = d[0];
                String datefin = d[1];
                Date d1 = date_du_jour.dateConvert(datedebut);
                Date d2 = date_du_jour.dateConvert(datefin);

                JSONArray object = new JSONArray();
                List<OperationConsommateur> allopera = new ArrayList<>();

                for (Service service : allservice) {
                    for (CategorieProduit cat : cps) {
                        List<OperationConsommateur> oc = operationConsommateurFacade.findReportingAllUserService(service.getIdService(), cat.getTypeCategorie(), date_du_jour.caseDateToTimestamp(d1), date_du_jour.caseDateToTimestamp(d2));
                        if (!oc.isEmpty()) {
                            for (OperationConsommateur occ : oc) {
                                allopera.add(occ);
                            }
                        }
                    }
                }

                double total = 0;
                boolean ok = false;
                for (Service r1 : allservice) {
                    HashMap map = new HashMap();
                    JSONArray AllConsommation = new JSONArray();
                    for (OperationConsommateur op : allopera) {
                        HashMap dat = new HashMap();
                        if (r1.getNomService().equalsIgnoreCase(op.getPersonnel().getService().getNomService())) {
                            total += op.getPrixTotal();

                            dat.put("date", new java.sql.Date(op.getDate().getTime()));
                            dat.put("Personnel", op.getPersonnel().getNomPrenom());
                            dat.put("Categorie", op.getCategorie());
                            dat.put("Designation", op.getDesignation());
                            dat.put("Quantite", op.getQuantite());
                            dat.put("PU", op.getPrix());
                            dat.put("P.T", op.getPrixTotal());
                            dat.put("Appareil", op.getAppariel());
                            //dat.put("magasin", op.getMagasin().getNomMagasin());

                            AllConsommation.put(dat);

                            ok = true;
                        }
                    }
                    if (ok) {
                        if (AllConsommation.length() != 0) {

                            map.put("legende", "Service : " + r1.getNomService());
                            map.put("data", AllConsommation);

                            object.put(map);
                        }
                    }
                }
                response.setContentType("application/json");
                response.getWriter().print(object);

            } else if (action.equalsIgnoreCase("ReportingAllUserDirection")) {

                String[] categorie = request.getParameterValues("categorie");
                String[] direc = request.getParameterValues("direction");
                List<CategorieProduit> cps = new ArrayList<>();
                for (String id : categorie) {
                    CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                    cps.add(catprod);

                }

                List<Direction> alldirection = new ArrayList<>();
                for (String id : direc) {
                    Direction r1 = directionFacade.find(Integer.parseInt(id));
                    alldirection.add(r1);
                }

                String dates = request.getParameter("interval");
                String[] d = dates.split("-");
                String datedebut = d[0];
                String datefin = d[1];
                Date d1 = date_du_jour.dateConvert(datedebut);
                Date d2 = date_du_jour.dateConvert(datefin);

                JSONArray object = new JSONArray();
                List<OperationConsommateur> allopera = new ArrayList<>();

                for (Direction direct : alldirection) {
                    for (CategorieProduit cat : cps) {
                        List<OperationConsommateur> oc = operationConsommateurFacade.findReportingAllUserDirection(direct.getIdDirection(), cat.getTypeCategorie(), date_du_jour.caseDateToTimestamp(d1), date_du_jour.caseDateToTimestamp(d2));
                        if (!oc.isEmpty()) {
                            for (OperationConsommateur occ : oc) {
                                allopera.add(occ);
                            }
                        }
                    }
                }
                for (Direction direct : alldirection) {
                    HashMap map = new HashMap();
                    JSONArray AllConsommation = new JSONArray();
                    double total = 0;
                    boolean ok = false;
                    for (OperationConsommateur op : allopera) {
                        if (direct.getNomDirection().equalsIgnoreCase(op.getPersonnel().getService().getDirection().getNomDirection())) {
                            total += op.getPrixTotal();
                            HashMap dat = new HashMap();

                            dat.put("date", new java.sql.Date(op.getDate().getTime()));
                            dat.put("Personnel", op.getPersonnel().getNomPrenom());
                            dat.put("Categorie", op.getCategorie());
                            dat.put("Designation", op.getDesignation());
                            dat.put("Quantite", op.getQuantite());
                            dat.put("PU", op.getPrix());
                            dat.put("P.T", op.getPrixTotal());
                            dat.put("Appareil", op.getAppariel());
                            //dat.put("magasin", op.getMagasin().getNomMagasin());

                            AllConsommation.put(dat);

                            ok = true;
                        }
                    }
                    if (ok) {
                        if (AllConsommation.length() != 0) {

                            map.put("legende", "Direction : " + direct.getNomDirection());
                            map.put("data", AllConsommation);

                            object.put(map);
                        }
                    }
                }

                response.setContentType("application/json");
                response.getWriter().print(object);

            } else if (action.equalsIgnoreCase("ReportingAllUserMS")) {

                String[] categorie = request.getParameterValues("categorie");
                String[] mag = request.getParameterValues("id_magasin");
                List<CategorieProduit> cps = new ArrayList<>();
                for (String id : categorie) {
                    CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                    cps.add(catprod);

                }

                List<MagasinSecondaire> allMagMS = new ArrayList<>();
                for (String id : mag) {
                    MagasinSecondaire ms = magasinSecondaireFacade.find(Integer.parseInt(id));
                    allMagMS.add(ms);
                }
                String dates = request.getParameter("interval");
                String[] d = dates.split("-");
                String datedebut = d[0];
                String datefin = d[1];
                Date d1 = date_du_jour.dateConvert(datedebut);
                Date d2 = date_du_jour.dateConvert(datefin);

                JSONArray object = new JSONArray();

                List<OperationConsommateur> allopera = new ArrayList<>();

                for (MagasinSecondaire magms : allMagMS) {
                    List<OperationConsommateur> alloperas = new ArrayList<>();
                    for (CategorieProduit cat : cps) {

                        List<OperationConsommateur> oc = operationConsommateurFacade.findReportingAllUserMS(magms.getIdMagasin(), cat.getTypeCategorie(), date_du_jour.caseDateToTimestamp(d1), date_du_jour.caseDateToTimestamp(d2));
                        if (!oc.isEmpty()) {
                            alloperas.addAll(oc);

                        }
                    }
                    allopera.addAll(alloperas);
                }

                double total = 0;
                boolean ok = false;
                for (MagasinSecondaire magms : allMagMS) {
                    HashMap map = new HashMap();
                    JSONArray AllConsommation = new JSONArray();
                    for (OperationConsommateur op : allopera) {
                        if (magms.getIdMagasin().compareTo(op.getMagasin().getIdMagasin()) == 0) {
                            total += op.getPrixTotal();
                            HashMap dat = new HashMap();

                            dat.put("date", new java.sql.Date(op.getDate().getTime()));
                            dat.put("Personnel", op.getPersonnel().getNomPrenom());
                            dat.put("Categorie", op.getCategorie());
                            dat.put("Designation", op.getDesignation());
                            dat.put("Quantite", op.getQuantite());
                            dat.put("PU", op.getPrix());
                            dat.put("P.T", op.getPrixTotal());
                            dat.put("Appareil", op.getAppariel());
                            //dat.put("magasin", op.getMagasin().getNomMagasin());

                            AllConsommation.put(dat);

                            ok = true;
                        }
                    }
                    if (ok) {

                        if (AllConsommation.length() != 0) {
                            map.put("legende", "Magasin : " + magms.getNomMagasin());
                            map.put("data", AllConsommation);
                            object.put(map);
                        }

                    }
                }
                response.setContentType("application/json");
                response.getWriter().print(object);

            } else if (action.equalsIgnoreCase("ReportingAllMSInMP")) {

                String[] categorie = request.getParameterValues("categorie");
                String[] mag = request.getParameterValues("id_magasinP");
                List<CategorieProduit> cps = new ArrayList<>();
                for (String id : categorie) {
                    CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                    cps.add(catprod);

                }

                List<MagasinPrincipal> allMagMP = new ArrayList<>();
                for (String id : mag) {
                    MagasinPrincipal mp = magasinPrincipalFacade.find(Integer.parseInt(id));
                    allMagMP.add(mp);
                }
                String dates = request.getParameter("interval");
                String[] d = dates.split("-");
                String datedebut = d[0];
                String datefin = d[1];
                Date d1 = date_du_jour.dateConvert(datedebut);
                Date d2 = date_du_jour.dateConvert(datefin);

                JSONArray object = new JSONArray();

                List<TransfertStock> allopera = new ArrayList<>();
                for (MagasinPrincipal magmp : allMagMP) {
                    List<TransfertStock> alloperas = new ArrayList<>();
                    for (CategorieProduit cat : cps) {

                        List<TransfertStock> oc = transfertStockFacade.findReportingAllMSInMP(magmp.getIdMagasin(), "OK", cat.getTypeCategorie(), date_du_jour.caseDateToTimestamp(d1), date_du_jour.caseDateToTimestamp(d2));
                        if (!oc.isEmpty()) {
                            for (TransfertStock occ : oc) {
                                alloperas.add(occ);
                            }
                            oc.clear();
                        }

                    }
                    allopera.addAll(alloperas);
                }

                double total = 0;
                boolean ok = false;
                for (MagasinPrincipal mp : allMagMP) {
                    HashMap map = new HashMap();
                    JSONArray AllConsommation = new JSONArray();
                    for (TransfertStock op : allopera) {
                        if (mp.getIdMagasin().compareTo(op.getMp().getIdMagasin()) == 0) {
                            total += op.getPrixTotal();
                            HashMap dat = new HashMap();

                            dat.put("date", new java.sql.Date(op.getDate().getTime()));
                            dat.put("Categorie", op.getTypeProduit());
                            dat.put("Designation", op.getDesignation());
                            dat.put("Quantite", op.getQuantite());
                            dat.put("PU", op.getPrixUnitaire());
                            dat.put("P.T", op.getPrixTotal());
                            // dat.put("appareil", op.getAppariel());
                            dat.put("Magasin", op.getMs().getNomMagasin());

                            AllConsommation.put(dat);

                            ok = true;
                        }

                    }
                    if (ok) {

                        if (AllConsommation.length() != 0) {
                            map.put("legende", "Magasin : " + mp.getNomMagasin());
                            map.put("data", AllConsommation);
                            object.put(map);
                        }
                    }
                }
                response.setContentType("application/json");
                response.getWriter().print(object);

            } else if (action.equalsIgnoreCase("ReportingAllUserMSInMS")) {

                String[] categorie = request.getParameterValues("categorie");
                int mag = Integer.parseInt(request.getParameter("id_magasin"));
                List<CategorieproduitMS> cps = new ArrayList<>();
                for (String id : categorie) {
                    CategorieproduitMS catprod = categorieproduitMSFacade.find(Integer.parseInt(id));
                    cps.add(catprod);

                }

                String dates = request.getParameter("interval");
                String[] d = dates.split("-");
                String datedebut = d[0];
                String datefin = d[1];
                Date d1 = date_du_jour.dateConvert(datedebut);
                Date d2 = date_du_jour.dateConvert(datefin);

                JSONArray object = new JSONArray();
                List<OperationConsommateur> allopera = new ArrayList<>();
                MagasinSecondaire magms = magasinSecondaireFacade.find(mag);
                for (CategorieproduitMS cat : cps) {
                    List<OperationConsommateur> oc = operationConsommateurFacade.findReportingAllUserMS(magms.getIdMagasin(), cat.getNomCategorie(), date_du_jour.caseDateToTimestamp(d1), date_du_jour.caseDateToTimestamp(d2));
                    if (!oc.isEmpty()) {
                        for (OperationConsommateur occ : oc) {
                            allopera.add(occ);
                        }
                    }
                }

                HashMap map = new HashMap();
                JSONArray AllConsommation = new JSONArray();
                double total = 0;
                boolean ok = false;

                for (OperationConsommateur op : allopera) {
                    if (magms.getSite().getRegion().getNomRegion().equalsIgnoreCase(op.getPersonnel().getService().getSite().getRegion().getNomRegion())) {
                        total += op.getPrixTotal();
                        HashMap dat = new HashMap();

                        dat.put("date", new java.sql.Date(op.getDate().getTime()));
                        dat.put("Personnel", op.getPersonnel().getNomPrenom());
                        dat.put("Categorie", op.getCategorie());
                        dat.put("Designation", op.getDesignation());
                        dat.put("Quantite", op.getQuantite());
                        dat.put("PU", op.getPrix());
                        dat.put("P.T", op.getPrixTotal());
                        dat.put("Appareil", op.getAppariel());
                        //dat.put("magasin", op.getMagasin().getNomMagasin());

                        AllConsommation.put(dat);

                        ok = true;
                    }
                }
                if (ok) {
                    if (AllConsommation.length() != 0) {

                        map.put("legende", "Magasin : " + magms.getNomMagasin());
                        map.put("data", AllConsommation);

                        object.put(map);
                    }
                }

                response.setContentType("application/json");
                response.getWriter().print(object);

            } else if (action.equalsIgnoreCase("ReportingAllMSDansMP")) {

                String[] categorie = request.getParameterValues("categorie");
                int mag = Integer.parseInt(request.getParameter("id_magasinP"));
                List<CategorieproduitMP> cps = new ArrayList<>();
                for (String id : categorie) {
                    CategorieproduitMP catprod = categorieproduitMPFacade.find(Integer.parseInt(id));
                    cps.add(catprod);

                }
                MagasinPrincipal mp = magasinPrincipalFacade.find(mag);
                String dates = request.getParameter("interval");
                String[] d = dates.split("-");
                String datedebut = d[0];
                String datefin = d[1];
                Date d1 = date_du_jour.dateConvert(datedebut);
                Date d2 = date_du_jour.dateConvert(datefin);

                JSONArray object = new JSONArray();
                List<TransfertStock> allopera = new ArrayList<>();

                for (CategorieproduitMP cat : cps) {

                    List<TransfertStock> oc = transfertStockFacade.findReportingAllMSInMP(mp.getIdMagasin(), "OK", cat.getNomCategorie(), date_du_jour.caseDateToTimestamp(d1), date_du_jour.caseDateToTimestamp(d2));
                    if (!oc.isEmpty()) {
                        for (TransfertStock occ : oc) {
                            allopera.add(occ);
                        }
                        oc.clear();
                    }

                }

                HashMap map = new HashMap();
                JSONArray AllConsommation = new JSONArray();
                double total = 0;
                boolean ok = false;

                for (TransfertStock op : allopera) {
                    if (mp.getSite().getRegion().getNomRegion().equalsIgnoreCase(op.getMs().getSite().getRegion().getNomRegion())) {
                        total += op.getPrixTotal();
                        HashMap dat = new HashMap();

                        dat.put("date", new java.sql.Date(op.getDate().getTime()));
                        dat.put("Categorie", op.getTypeProduit());
                        dat.put("Designation", op.getDesignation());
                        dat.put("Quantite", op.getQuantite());
                        dat.put("PU", op.getPrixUnitaire());
                        dat.put("P.T", op.getPrixTotal());

                        // dat.put("appareil", op.getAppariel());
                        dat.put("Magasin", op.getMs().getNomMagasin());

                        AllConsommation.put(dat);

                        ok = true;
                    }

                }
                if (ok) {
                    if (AllConsommation.length() != 0) {

                        map.put("legende", "Magasin : " + mp.getNomMagasin());
                        map.put("data", AllConsommation);

                        object.put(map);
                    }
                }

                response.setContentType("application/json");
                response.getWriter().print(object);

            }
            //fin des reporting

            if (action.equalsIgnoreCase("redirect")) {

                request.setAttribute("articles", articleFacade.findAll());
                request.setAttribute("actif", "non");
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("Addarticles")) {
                int categorie = Integer.parseInt(request.getParameter("categorie"));
                String Code = request.getParameter("code");
                String designation = request.getParameter("designation");
                double prix = Double.parseDouble(request.getParameter("pu"));
                int critique = Integer.parseInt(request.getParameter("stock_alerte"));
                List<Article> listarticle = articleFacade.findAll();
                boolean error = false;
                if (!listarticle.isEmpty()) {

                    for (Article arti : listarticle) {
                        if (arti.getCode().equalsIgnoreCase(Code)) {
                            error = true;
                            break;
                        }
                    }

                }
                if (!error) {

                    Article article = new Article();
                    article.setCode(Code);
                    article.setPrix(prix);
                    article.setDesignation(designation);
                    article.setCategorie(new CategorieProduit(categorie));
                    article.setCritique(critique);
                    articleFacade.create(article);

                    CategorieProduit ca = categorieProduitFacade.find(categorie);
                    List<Article> l = articleFacade.findAllByCategorieProduit(categorie);
                    ca.setArticleList(l);
                    categorieProduitFacade.edit(ca);
                    List<CategorieProduit> catProdu = categorieProduitFacade.findAll();
                    List<CategorieProduit> catProd = catProdu.stream()
                            .filter(s -> s.getStocker() == null)
                            .collect(Collectors.toList());
                    request.setAttribute("articles", articleFacade.findAll());
                    request.setAttribute("actif", "actif");
                    request.setAttribute("categories", catProd);
                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                } else {
                    List<CategorieProduit> catProdu = categorieProduitFacade.findAll();
                    List<CategorieProduit> catProd = catProdu.stream()
                            .filter(s -> s.getStocker() == null)
                            .collect(Collectors.toList());
                    Message message = new Message("Cet Article Existe Deja");
                    request.setAttribute("message", message);
                    request.setAttribute("articles", articleFacade.findAll());
                    request.setAttribute("actif", "actif");
                    request.setAttribute("categories", catProd);
                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                }
            } else if (action.equalsIgnoreCase("Editearticles")) {
                int article = Integer.parseInt(request.getParameter("article"));
                Article a = articleFacade.find(article);
                List<Article> list = articleFacade.findAll();
                list.remove(a);
                List<CategorieProduit> catProdu = categorieProduitFacade.findAll();
                List<CategorieProduit> catProd = catProdu.stream()
                        .filter(s -> s.getStocker() == null)
                        .collect(Collectors.toList());
                request.setAttribute("allcategorieProduits", catProd);
                request.setAttribute("update", "modifier");
                request.setAttribute("article", a);
                request.setAttribute("actif", "non");
                request.setAttribute("articles", list);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("editCategorie")) {
                int cat = Integer.parseInt(request.getParameter("id_categorie"));
                CategorieProduit a = categorieProduitFacade.find(cat);

                List<CategorieProduit> catProdu = categorieProduitFacade.findAll();
                List<CategorieProduit> catProd = catProdu.stream()
                        .filter(s -> s.getStocker() == null)
                        .collect(Collectors.toList());
                request.setAttribute("type_categorie", catProd);
                request.setAttribute("categorie", a);
                request.setAttribute("update", "oui");
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("updateCategorie")) {

                int cat = Integer.parseInt(request.getParameter("id_categorie"));
                String designation = request.getParameter("type_categorie");

                CategorieProduit catproduit = categorieProduitFacade.find(cat);
                if (catproduit.getStocker() != null) {
                    catproduit.setTypeCategorie(designation);
                    categorieProduitFacade.edit(catproduit);
                } else {
                    String[] articl = request.getParameterValues("all_article");
                    boolean trouver = false;
                    List<Service> bs = serviceFacade.findAll();
                    for (Service bb : bs) {
                        for (CentreCout b1 : bb.getCentrecoutList()) {
                            for (Butget b : b1.getButgetList()) {
                                if (b.getTypeBudget().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                                    b.setTypeBudget(designation);
                                    butgetFacade.edit(b);
                                    trouver = true;
                                    break;
                                }
                            }
                            if (trouver) {
                                break;
                            }
                        }
                        if (trouver) {
                            break;
                        }
                    }
                    List<MagasinSecondaire> listCatMS = magasinSecondaireFacade.findAll();
                    List<MagasinPrincipal> listCatMP = magasinPrincipalFacade.findAll();
                    for (MagasinPrincipal catMP : listCatMP) {
                        for (CategorieproduitMP cats : catMP.getCategorieproduitMPList()) {
                            if (cats.getNomCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                                cats.setNomCategorie(designation);
                                categorieproduitMPFacade.edit(cats);
                                break;

                            }
                        }
                    }
                    for (MagasinSecondaire catMS : listCatMS) {
                        for (CategorieproduitMS cats : catMS.getCategorieproduitMSList()) {
                            if (cats.getNomCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                                cats.setNomCategorie(designation);
                                categorieproduitMSFacade.edit(cats);
                                break;
                            }
                        }
                    }
                    for (StatistiqueCategorieRegion stat : statistiqueCategorieRegionFacade.findAll()) {

                        if (stat.getCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setCategorie(designation);
                            statistiqueCategorieRegionFacade.edit(stat);

                        }
                    }
                    for (StatistiqueCategoriePersonnel stat : statistiqueCategoriePersonnelFacade.findAll()) {

                        if (stat.getCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setCategorie(designation);
                            statistiqueCategoriePersonnelFacade.edit(stat);

                        }
                    }
                    for (StatistiqueCategorieDirection stat : statistiqueCategorieDirectionFacade.findAll()) {

                        if (stat.getCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setCategorie(designation);
                            statistiqueCategorieDirectionFacade.edit(stat);

                        }
                    }
                    for (StatistiqueCategorieMagasinMs stat : statistiqueCategorieMagasinMsFacade.findAll()) {

                        if (stat.getCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setCategorie(designation);
                            statistiqueCategorieMagasinMsFacade.edit(stat);

                        }
                    }
                    for (StatistiqueCategoriMagasinMp stat : statistiqueCategoriMagasinMpFacade.findAll()) {

                        if (stat.getCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setCategorie(designation);
                            statistiqueCategoriMagasinMpFacade.edit(stat);

                        }
                    }
                    for (StatistiqueCategorieService stat : statistiqueCategorieServiceFacade.findAll()) {

                        if (stat.getCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setCategorie(designation);
                            statistiqueCategorieServiceFacade.edit(stat);

                        }
                    }
                    for (StatistiqueCategorieSite stat : statistiqueCategorieSiteFacade.findAll()) {

                        if (stat.getCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setCategorie(designation);
                            statistiqueCategorieSiteFacade.edit(stat);

                        }
                    }
                    for (TransfertStock stat : transfertStockFacade.findAll()) {
                        if (stat.getTypeProduit().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setTypeProduit(designation);
                            transfertStockFacade.edit(stat);

                        }
                    }
                    for (OperationConsommateur stat : operationConsommateurFacade.findAll()) {
                        if (stat.getCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setCategorie(designation);
                            operationConsommateurFacade.edit(stat);

                        }
                    }
                    for (CommandeMP stat : commandeMPFacade.findAll()) {
                        if (stat.getTypeProduit().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setTypeProduit(designation);
                            commandeMPFacade.edit(stat);

                        }
                    }
                    for (CommandeMS stat : commandeMSFacade.findAll()) {
                        if (stat.getTypeProduit().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setTypeProduit(designation);
                            commandeMSFacade.edit(stat);
                            break;
                        }
                    }

                    for (EcartinventaireMS stat : ecartinventaireMSFacade.findAll()) {
                        if (stat.getCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setCategorie(designation);
                            ecartinventaireMSFacade.edit(stat);

                        }
                    }
                    for (EcartinventaireMP stat : ecartinventaireMPFacade.findAll()) {
                        if (stat.getCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setCategorie(designation);
                            ecartinventaireMPFacade.edit(stat);

                        }
                    }
                    for (EcartinventaireMP stat : ecartinventaireMPFacade.findAll()) {
                        if (stat.getCategorie().equalsIgnoreCase(catproduit.getTypeCategorie())) {
                            stat.setCategorie(designation);
                            ecartinventaireMPFacade.edit(stat);

                        }
                    }

                    List<Article> as = new ArrayList<>();
                    for (String arti : articl) {
                        as.add(articleFacade.find(Integer.parseInt(arti)));
                    }
                    catproduit.getArticleList().removeAll(as);
                    for (Article a : catproduit.getArticleList()) {
                        articleFacade.remove(a);
                    }
                    catproduit.setArticleList(articleFacade.findAllByCategorieProduit(cat));
                    catproduit.setTypeCategorie(designation);
                    categorieProduitFacade.edit(catproduit);
                }
               List<CategorieProduit> catProdu = categorieProduitFacade.findAll();
                    List<CategorieProduit> catProd = catProdu.stream()
                            .filter(s -> s.getStocker() == null)
                            .collect(Collectors.toList());
                request.setAttribute("type_categorie", catProd);

                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("deleteCategorie")) {
                int cat = Integer.parseInt(request.getParameter("id_categorie"));
                CategorieProduit a = categorieProduitFacade.find(cat);
                categorieProduitFacade.remove(a);
               List<CategorieProduit> catProdu = categorieProduitFacade.findAll();
                    List<CategorieProduit> catProd = catProdu.stream()
                            .filter(s -> s.getStocker() == null)
                            .collect(Collectors.toList());
                request.setAttribute("type_categorie", catProd);

                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("SaveUpdatearticles")) {
                int id_article = Integer.parseInt(request.getParameter("article"));

                String Code = request.getParameter("code");
                //  int id_catego = Integer.parseInt(request.getParameter("categorie"));
                String designation = request.getParameter("designation");
                double prix = Double.parseDouble(request.getParameter("pu"));
                int critique = Integer.parseInt(request.getParameter("stock_alerte"));

                Article catproduit = articleFacade.find(id_article);
                try {
                    // List<MagasinPrincipal> Magasin = magasinPrincipalFacade.findAll();

                    for (StockproduitMP smp : stockproduitMPFacade.findAll()) {
                        if (smp.getCodeProduit().equalsIgnoreCase(catproduit.getCode())) {
                            smp.setPrixUnitaire(prix);
                            smp.setCodeProduit(Code);
                            smp.setDesignation(designation);
                            //  smp.setCategorie(article.getCategorie());
                            stockproduitMPFacade.edit(smp);
                        }
                    }
                    //  List<MagasinSecondaire> MagasinMS = magasinSecondaireFacade.findAll();
                    for (StockproduitMS smp : stockproduitMSFacade.findAll()) {
                        if (smp.getCodeProduit().equalsIgnoreCase(catproduit.getCode())) {
                            smp.setPrixUnitaire(prix);
                            smp.setCodeProduit(Code);
                            smp.setDesignation(designation);
                            // smp.setCategorie(article.getCategorie());
                            stockproduitMSFacade.edit(smp);
                        }
                    }
                    for (StatistiqueArticlesRegion stat : statistiqueArticlesRegionFacade.findAll()) {

                        if (stat.getArticles().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setArticles(designation);
                            statistiqueArticlesRegionFacade.edit(stat);

                        }
                    }
                    for (StatistiqueArticlesPersonnel stat : statistiqueArticlesPersonnelFacade.findAll()) {

                        if (stat.getArticles().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setArticles(designation);
                            statistiqueArticlesPersonnelFacade.edit(stat);

                        }
                    }
                    for (StatistiqueArticlesDirection stat : statistiqueArticlesDirectionFacade.findAll()) {

                        if (stat.getArticles().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setArticles(designation);
                            statistiqueArticlesDirectionFacade.edit(stat);

                        }
                    }
                    for (StatistiqueArticlesMagasinMp stat : statistiqueArticlesMagasinMpFacade.findAll()) {

                        if (stat.getArticles().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setArticles(designation);
                            statistiqueArticlesMagasinMpFacade.edit(stat);

                        }
                    }
                    for (StatistiqueArticlesMagasinMs stat : statistiqueArticlesMagasinMsFacade.findAll()) {

                        if (stat.getArticles().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setArticles(designation);
                            statistiqueArticlesMagasinMsFacade.edit(stat);

                        }
                    }
                    for (StatistiqueArticlesService stat : statistiqueArticlesServiceFacade.findAll()) {

                        if (stat.getArticles().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setArticles(designation);
                            statistiqueArticlesServiceFacade.edit(stat);

                        }
                    }
                    for (StatistiqueArticlesSite stat : statistiqueArticlesSiteFacade.findAll()) {

                        if (stat.getArticles().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setArticles(designation);
                            statistiqueArticlesSiteFacade.edit(stat);

                        }
                    }
                    for (TransfertStock stat : transfertStockFacade.findAll()) {
                        if (stat.getDesignation().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setDesignation(designation);
                            stat.setCodeProduit(Code);
                            transfertStockFacade.edit(stat);

                        }
                    }
                    for (OperationConsommateur stat : operationConsommateurFacade.findAll()) {
                        if (stat.getDesignation().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setDesignation(designation);
                            stat.setCodeProduit(Code);
                            operationConsommateurFacade.edit(stat);

                        }
                    }
                    for (CommandeMP stat : commandeMPFacade.findAll()) {
                        if (stat.getDesignation().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setDesignation(designation);
                            stat.setCodeProduit(Code);
                            commandeMPFacade.edit(stat);

                        }
                    }
                    for (CommandeMS stat : commandeMSFacade.findAll()) {
                        if (stat.getDesignation().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setDesignation(designation);
                            stat.setCodeProduit(Code);
                            commandeMSFacade.edit(stat);

                        }
                    }

                    for (EcartinventaireMS stat : ecartinventaireMSFacade.findAll()) {
                        if (stat.getDesignation().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setCategorie(designation);
                            stat.setCodeProduit(Code);
                            ecartinventaireMSFacade.edit(stat);

                        }
                    }
                    for (EcartinventaireMP stat : ecartinventaireMPFacade.findAll()) {
                        if (stat.getDesignation().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setCategorie(designation);
                            stat.setCodeProduit(Code);
                            ecartinventaireMPFacade.edit(stat);

                        }
                    }
                    for (EcartinventaireMP stat : ecartinventaireMPFacade.findAll()) {
                        if (stat.getDesignation().equalsIgnoreCase(catproduit.getDesignation())) {
                            stat.setDesignation(designation);
                            stat.setCodeProduit(Code);
                            ecartinventaireMPFacade.edit(stat);

                        }
                    }
                    commandePersonnelFacade.findAll().stream().filter((stat) -> (stat.getDesignations().equalsIgnoreCase(catproduit.getDesignation()))).map((stat) -> {
                        stat.setDesignations(designation);
                        return stat;
                    }).forEach((stat) -> {
                        commandePersonnelFacade.edit(stat);
                    });
                } catch (Exception e) {
                    System.out.print(e.getMessage());
                }
                catproduit.setCode(Code);
                catproduit.setPrix(prix);
                catproduit.setDesignation(designation);
                catproduit.setCritique(critique);
                // article.setCategorie(categorieProduitFacade.find(id_catego));
                articleFacade.edit(catproduit);
                
                List<CategorieProduit> catProdu = categorieProduitFacade.findAll();
                    List<CategorieProduit> catProd = catProdu.stream()
                            .filter(s -> s.getStocker() == null)
                            .collect(Collectors.toList());
                request.setAttribute("articles", articleFacade.findAll());
                request.setAttribute("categories", catProd);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("deletearticles")) {
                int article = Integer.parseInt(request.getParameter("article"));
                Article a = articleFacade.find(article);
                articleFacade.remove(a);
                request.setAttribute("articles", articleFacade.findAll());
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("AjoutArticleMS")) {

                int id_article = Integer.parseInt(request.getParameter("article"));
                int idMS = Integer.parseInt(request.getParameter("magasin"));
                int quantiter = Integer.parseInt(request.getParameter("quantite"));
                String date = request.getParameter("date");

                Article article = articleFacade.find(id_article);
                MagasinSecondaire ms = magasinSecondaireFacade.find(idMS);
                List<CategorieproduitMS> l = categorieproduitMSFacade.findCatByidMS(idMS);
                for (CategorieproduitMS cat : l) {
                    if (cat.getNomCategorie().equalsIgnoreCase(article.getCategorie().getTypeCategorie())) {
                        StockproduitMS s = new StockproduitMS();
                        s.setCategorie(new CategorieproduitMS(cat.getIdCategorie()));
                        s.setCodeProduit(article.getCode());
                        s.setDesignation(article.getDesignation());
                        s.setPrixUnitaire(article.getPrix());
                        s.setDateLivraison(date_du_jour.dateConvert(date));
                        s.setQuantite(quantiter);
                        s.setPrixTotal(s.getQuantite() * s.getPrixUnitaire());
                        stockproduitMSFacade.create(s);
                        cat.setStockproduitMSList(stockproduitMSFacade.findStockByIdCategorie(cat.getIdCategorie()));
                        categorieproduitMSFacade.edit(cat);
                        ms.setCategorieproduitMSList(categorieproduitMSFacade.findCatByidMS(ms.getIdMagasin()));
                        magasinSecondaireFacade.edit(ms);
                        break;
                    }
                }
                request.setAttribute("stockMS", stockproduitMSFacade.findStockMP(idMS));
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("AjoutArticleMP")) {
                int id_article = Integer.parseInt(request.getParameter("article"));
                int idMP = Integer.parseInt(request.getParameter("magasin"));
                int quantiter = Integer.parseInt(request.getParameter("quantite"));
                String date = request.getParameter("date");

                Article article = articleFacade.find(id_article);
                MagasinPrincipal ms = magasinPrincipalFacade.find(idMP);
                List<CategorieproduitMP> l = categorieproduitMPFacade.findCatByidMP(idMP);
                for (CategorieproduitMP cat : l) {
                    if (cat.getNomCategorie().equalsIgnoreCase(article.getCategorie().getTypeCategorie())) {
                        StockproduitMP s = new StockproduitMP();
                        s.setCategorie(new CategorieproduitMP(cat.getIdCategorie()));
                        s.setCodeProduit(article.getCode());
                        s.setDesignation(article.getDesignation());
                        s.setPrixUnitaire(article.getPrix());
                        s.setDateLivraison(date_du_jour.dateConvert(date));
                        s.setQuantite(quantiter);
                        s.setPrixTotal(s.getQuantite() * s.getPrixUnitaire());
                        stockproduitMPFacade.create(s);
                        cat.setStockproduitMPList(stockproduitMPFacade.findStockByIdCategorie(cat.getIdCategorie()));
                        categorieproduitMPFacade.edit(cat);
                        ms.setCategorieproduitMPList(categorieproduitMPFacade.findCatByidMP(ms.getIdMagasin()));
                        magasinPrincipalFacade.edit(ms);
                        break;
                    }
                }
                request.setAttribute("stockMP", stockproduitMPFacade.findByidMP(idMP));
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("editeMS")) {
                int idMS = Integer.parseInt(request.getParameter("idMagasin"));
                MagasinSecondaire ms = magasinSecondaireFacade.find(idMS);
                List<MagasinSecondaire> l = magasinSecondaireFacade.findAll();
                l.remove(ms);
                if (l.isEmpty()) {
                    l.add(ms);
                }
                request.setAttribute("updateMags", "oui");
                request.setAttribute("parametre", "OK");
                // request.setAttribute("form", "ONE");
                request.setAttribute("MagasinsS", l);
                request.setAttribute("magasin", ms);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("SaveUpdateMS")) {
                int idMS = Integer.parseInt(request.getParameter("magasin"));
                int idsite = Integer.parseInt(request.getParameter("site"));
                String magasin = request.getParameter("nom_magasin");
                String description = request.getParameter("description");
                MagasinSecondaire ms = magasinSecondaireFacade.find(idMS);
                ms.setSite(siteFacade.find(idsite));
                ms.setNomMagasin(magasin);
                ms.setDescription(description);
                magasinSecondaireFacade.edit(ms);
                request.setAttribute("form", "ONE");
                request.setAttribute("parametre", "OK");
                request.setAttribute("MagasinsS", magasinSecondaireFacade.findAll());
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("editeMP")) {
                int idMP = Integer.parseInt(request.getParameter("id_magasinP"));
                MagasinPrincipal mp = magasinPrincipalFacade.find(idMP);
                List<MagasinPrincipal> l = magasinPrincipalFacade.findAll();
                l.remove(mp);
                if (l.isEmpty()) {
                    l.add(mp);
                }
                request.setAttribute("MagasinsP", l);
                // request.setAttribute("form", "NON");
                request.setAttribute("parametre", "OK");
                request.setAttribute("magasin", mp);
                request.setAttribute("updateMagp", "oui");
                request.setAttribute("forme", "ONE");
                request.setAttribute("all", "yes");
                List<Region> regions = regionFacade.findAll();
                request.setAttribute("regions", regions);

                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("SaveUpdateMP")) {
                int idMP = Integer.parseInt(request.getParameter("magasin"));
                List<Region> regions = regionFacade.findAll();
                String magasin = request.getParameter("nom_magasin");
                int idsite = Integer.parseInt(request.getParameter("site"));
                String description = request.getParameter("description");
                MagasinPrincipal ms = magasinPrincipalFacade.find(idMP);
                ms.setNomMagasin(magasin);
                ms.setDescription(description);
                magasinPrincipalFacade.edit(ms);
                ms.setSite(siteFacade.find(idsite));
                //request.setAttribute("form", "NON");
                request.setAttribute("parametre", "OK");
                request.setAttribute("regions", regions);
                request.setAttribute("MagasinsP", magasinPrincipalFacade.findAll());
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("tranfertCategorieMS")) {

                if (Integer.parseInt(request.getParameter("magasin2")) != Integer.parseInt(request.getParameter("magasin1"))) {
                    String[] idcat = request.getParameterValues("categorie");

                    if (request.getParameter("magasin2") != null) {
                        int idM2 = Integer.parseInt(request.getParameter("magasin2"));
                        for (String cat : idcat) {
                            CategorieproduitMS s = categorieproduitMSFacade.find(Integer.parseInt(cat));
                            s.setMagasinSecondaire(new MagasinSecondaire(idM2));
                            categorieproduitMSFacade.edit(s);

                        }
                    } else {
                        for (String cat : idcat) {
                            CategorieproduitMS s = categorieproduitMSFacade.find(Integer.parseInt(cat));

                            categorieproduitMSFacade.remove(s);

                        }
                    }
                } else {
                    Message message = new Message("Veiller Selectionner Au Moins Deux Magasins Secondaires Differents");
                    request.setAttribute("message1", message);
                }
                List<MagasinSecondaire> l = magasinSecondaireFacade.findAll();
                List<Region> regions = regionFacade.findAll();
                request.setAttribute("regions", regions);
                request.setAttribute("MagasinsS", l);
                request.setAttribute("parametre", "OK");
                request.setAttribute("all", "yes");
                request.setAttribute("sorti", "OK");
                request.setAttribute("form", "ONE");
                request.setAttribute("forme", "ONE");
                request.setAttribute("transf", "OK");

                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("tranfertCategorieMP")) {
                //int idM1 = Integer.parseInt(request.getParameter("magasin1"));
                int idM2 = Integer.parseInt(request.getParameter("magasin2"));
                String[] idcat = request.getParameterValues("categorie");
                if (Integer.parseInt(request.getParameter("magasin2")) != Integer.parseInt(request.getParameter("magasin1"))) {
                    for (String cat : idcat) {
                        CategorieproduitMP s = categorieproduitMPFacade.find(Integer.parseInt(cat));
                        s.setMagasinPrincipal(new MagasinPrincipal(idM2));
                        categorieproduitMPFacade.edit(s);

                    }
                } else {
                    Message message = new Message("Veiller Selectionner Au Moins Deux Magasins Principaux Differents");
                    request.setAttribute("message1", message);
                }
                List<MagasinPrincipal> mps = magasinPrincipalFacade.findAll();
                //  List<AffectationmagasinP> MagasinsP = affectationmagasinPFacade.findAll();
                List<Region> regions = regionFacade.findAll();
                request.setAttribute("regions", regions);
                request.setAttribute("MagasinsP", mps);
                request.setAttribute("listMP", mps);
                request.setAttribute("form", "NON");
                request.setAttribute("forme", "ONE");
                request.setAttribute("all", "yes");
                request.setAttribute("parametre", "OK");
                request.setAttribute("transf", "OK");
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("getArticlesByCategorieMP")) {

                int idCategorie = Integer.parseInt(request.getParameter("idCategorie"));
                CategorieproduitMP CatP = categorieproduitMPFacade.find(idCategorie);
                CategorieProduit c = categorieProduitFacade.findByTypeCategorie(CatP.getNomCategorie());

                List<Article> permissions = articleFacade.findAllByCategorieProduit(c.getIdCategorieProduit());
                //System.out.println(permissions);
                JSONArray Allpages = new JSONArray();
                permissions.stream().map((permission) -> {
                    JSONArray perso = new JSONArray();
                    perso.put(permission.getIdArticle()).put(permission.getDesignation());
                    return perso;
                }).forEach((perso) -> {
                    Allpages.put(perso);
                });

                response.setContentType("application/json");
                response.getWriter().print(Allpages);

            } else if (action.equalsIgnoreCase("allservice")) {
                request.setAttribute("stat", "service");
                request.setAttribute("service", serviceFacade.findAll());
                request.setAttribute("region", regionFacade.findAll());
                request.setAttribute("site", siteFacade.findAll());
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("allsite")) {
                request.setAttribute("stat", "site");
                request.setAttribute("site", siteFacade.findAll());
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("allregion")) {
                request.setAttribute("stat", "region");
                request.setAttribute("region", regionFacade.findAll());
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("consommationUser")) {

                request.setAttribute("services", serviceFacade.findAll());
                request.setAttribute("regions", regionFacade.findAll());
                request.setAttribute("sites", siteFacade.findAll());
                request.setAttribute("consouser", "oui");

                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("consommationService")) {
                int idservice = Integer.parseInt(request.getParameter("service"));
                Service service = serviceFacade.find(idservice);
                List<OperationConsommateur> list = new ArrayList<>();
                service.getPersonnelList().stream().forEach((personnel) -> {
                    personnel.getOperationConsommateurList().stream().forEach((operation) -> {
                        list.add(operation);
                    });
                });
                List<OperationConsommateur> list1 = new ArrayList<>();
                List<OperationConsommateur> list2 = new ArrayList<>();
                //List<CategorieProduit> l = categorieProduitFacade.findAll();
                List<CategorieProduit> catProdu = categorieProduitFacade.findAll();
                    List<CategorieProduit> catProd = catProdu.stream()
                            .filter(s -> s.getStocker() == null)
                            .collect(Collectors.toList());
                catProd.stream().forEach((catego) -> {
                    double somme = 0;
                    int quantite = 0;
                    OperationConsommateur oc = new OperationConsommateur();
                    for (OperationConsommateur operation : list) {
                        if (catego.getTypeCategorie().equalsIgnoreCase(operation.getCategorie())) {
                            oc.setCategorie(operation.getCategorie());
                            somme += operation.getPrixTotal();
                            quantite += operation.getQuantite();
                            oc.setPrixTotal(somme);
                            oc.setQuantite(quantite);

                        }
                    }
                    if (somme > 0 && quantite > 0) {
                        list1.add(oc);
                    }
                });

                request.setAttribute("operation", list1);

                //  list1.clear();
                catProd.stream().forEach((catego) -> {
                    catego.getArticleList().stream().forEach((ar) -> {
                        double somme = 0;
                        int quantite = 0;
                        // OperationConsommateur occ = new OperationConsommateur();
                        OperationConsommateur oc = new OperationConsommateur();
                        for (OperationConsommateur operation : list) {
                            if (ar.getCode().equalsIgnoreCase(operation.getCodeProduit())) {
                                //  occ = operation;
                                oc.setCategorie(operation.getCategorie());
                                oc.setDesignation(operation.getDesignation());
                                oc.setCodeProduit(operation.getCodeProduit());
                                somme += operation.getPrixTotal();
                                quantite += operation.getQuantite();
                                oc.setPrixTotal(somme);
                                oc.setQuantite(quantite);
                                oc.setPrix(operation.getPrix());

                            }
                        }
                        if (somme > 0 && quantite > 0) {
                            list2.add(oc);
                        }
                    });
                });

                request.setAttribute("stat", "service");
                //request.setAttribute("vue", "consoService");
                request.setAttribute("statservice", "oui");
                request.setAttribute("services", serviceFacade.findAll());
                request.setAttribute("regions", regionFacade.findAll());
                request.setAttribute("sites", siteFacade.findAll());
                request.setAttribute("operationArticle", list2);
                request.setAttribute("conso", "le service " + service.getNomService());
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("consommationSite")) {
                int idsite = Integer.parseInt(request.getParameter("site"));
                Site site = siteFacade.find(idsite);
                List<OperationConsommateur> list = new ArrayList<>();
                site.getServiceList().stream().forEach((service) -> {
                    service.getPersonnelList().stream().forEach((personnel) -> {
                        personnel.getOperationConsommateurList().stream().forEach((operation) -> {
                            list.add(operation);
                        });
                    });
                });

                List<OperationConsommateur> list1 = new ArrayList<>();
                List<CategorieProduit> catProdu = categorieProduitFacade.findAll();
                    List<CategorieProduit> catProd = catProdu.stream()
                            .filter(s -> s.getStocker() == null)
                            .collect(Collectors.toList());
               // List<CategorieProduit> l = categorieProduitFacade.findAll();
                catProd.stream().forEach((catego) -> {
                    double somme = 0;
                    int quantite = 0;
                    OperationConsommateur oc = new OperationConsommateur();
                    for (OperationConsommateur operation : list) {
                        if (catego.getTypeCategorie().equalsIgnoreCase(operation.getCategorie())) {
                            oc.setCategorie(operation.getCategorie());
                            somme += operation.getPrixTotal();
                            quantite += operation.getQuantite();
                            oc.setPrixTotal(somme);
                            oc.setQuantite(quantite);

                        }
                    }
                    if (somme > 0 && quantite > 0) {
                        list1.add(oc);
                    }
                });
                request.setAttribute("operation", list1);

                list1.clear();

                catProd.stream().forEach((catego) -> {
                    catego.getArticleList().stream().forEach((ar) -> {
                        double somme = 0;
                        int quantite = 0;
                        //OperationConsommateur occ = new OperationConsommateur();
                        OperationConsommateur oc = new OperationConsommateur();
                        for (OperationConsommateur operation : list) {
                            if (ar.getCode().equalsIgnoreCase(operation.getCodeProduit())) {
                                //  occ = operation;
                                oc.setCategorie(operation.getCategorie());
                                oc.setDesignation(operation.getDesignation());
                                oc.setCodeProduit(operation.getCodeProduit());
                                somme += operation.getPrixTotal();
                                quantite += operation.getQuantite();
                                oc.setPrixTotal(somme);
                                oc.setQuantite(quantite);
                                oc.setPrix(operation.getPrix());

                            }
                        }
                        if (somme > 0 && quantite > 0) {
                            list1.add(oc);
                        }
                    });
                });
                request.setAttribute("site", site);
                request.setAttribute("stat", "site");
                request.setAttribute("statsite", "oui");
                request.setAttribute("services", serviceFacade.findAll());
                request.setAttribute("regions", regionFacade.findAll());
                request.setAttribute("sites", siteFacade.findAll());
                request.setAttribute("operationArticle", list1);
                request.setAttribute("conso", "le site " + site.getNomSite());
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("consommationRegion")) {
                int idregion = Integer.parseInt(request.getParameter("region"));
                Region region = regionFacade.find(idregion);
                List<OperationConsommateur> list = new ArrayList<>();
                region.getSiteList().stream().forEach((site) -> {
                    site.getServiceList().stream().forEach((service) -> {
                        service.getPersonnelList().stream().forEach((personnel) -> {
                            personnel.getOperationConsommateurList().stream().forEach((operation) -> {
                                list.add(operation);
                            });
                        });
                    });
                });
                List<OperationConsommateur> list1 = new ArrayList<>();
                List<CategorieProduit> catProdu = categorieProduitFacade.findAll();
                    List<CategorieProduit> catProd = catProdu.stream()
                            .filter(s -> s.getStocker() == null)
                            .collect(Collectors.toList());
                //List<CategorieProduit> l = categorieProduitFacade.findAll();
                catProd.stream().forEach((catego) -> {
                    double somme = 0;
                    int quantite = 0;
                    OperationConsommateur oc = new OperationConsommateur();
                    for (OperationConsommateur operation : list) {
                        if (catego.getTypeCategorie().equalsIgnoreCase(operation.getCategorie())) {
                            oc.setCategorie(operation.getCategorie());
                            somme += operation.getPrixTotal();
                            quantite += operation.getQuantite();
                            oc.setPrixTotal(somme);
                            oc.setQuantite(quantite);

                        }
                    }
                    if (somme > 0 && quantite > 0) {
                        list1.add(oc);
                    }
                });
                request.setAttribute("operation", list1);

                list1.clear();

                catProd.stream().forEach((catego) -> {
                    catego.getArticleList().stream().forEach((ar) -> {
                        double somme = 0;
                        int quantite = 0;
                        // OperationConsommateur occ = new OperationConsommateur();
                        OperationConsommateur oc = new OperationConsommateur();
                        for (OperationConsommateur operation : list) {
                            if (ar.getCode().equalsIgnoreCase(operation.getCodeProduit())) {
                                //  occ = operation;
                                oc.setCategorie(operation.getCategorie());
                                oc.setDesignation(operation.getDesignation());
                                oc.setCodeProduit(operation.getCodeProduit());
                                somme += operation.getPrixTotal();
                                quantite += operation.getQuantite();
                                oc.setPrixTotal(somme);
                                oc.setQuantite(quantite);
                                oc.setPrix(operation.getPrix());

                            }
                        }
                        if (somme > 0 && quantite > 0) {
                            list1.add(oc);
                        }
                    });
                });
                request.setAttribute("region", region);
                request.setAttribute("stat", "region");
                request.setAttribute("statregion", "oui");
                request.setAttribute("services", serviceFacade.findAll());
                request.setAttribute("regions", regionFacade.findAll());
                request.setAttribute("sites", siteFacade.findAll());
                request.setAttribute("operationArticle", list1);
                request.setAttribute("conso", "la region " + region.getNomRegion());
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("consommationSociete")) {

                List< Region> regions = regionFacade.findAll();
                List<OperationConsommateur> list = new ArrayList<>();
                regions.stream().forEach((region) -> {
                    region.getSiteList().stream().forEach((site) -> {
                        site.getServiceList().stream().forEach((service) -> {
                            service.getPersonnelList().stream().forEach((personnel) -> {
                                personnel.getOperationConsommateurList().stream().forEach((operation) -> {
                                    list.add(operation);
                                });
                            });
                        });
                    });
                });

                List< OperationConsommateur> list1 = new ArrayList<>();
                List<CategorieProduit> catProdu = categorieProduitFacade.findAll();
                    List<CategorieProduit> catProd = catProdu.stream()
                            .filter(s -> s.getStocker() == null)
                            .collect(Collectors.toList());
              //  List<CategorieProduit> l = categorieProduitFacade.findAll();
                catProd.stream().forEach((catego) -> {
                    double somme = 0;
                    int quantite = 0;
                    OperationConsommateur oc = new OperationConsommateur();
                    for (OperationConsommateur operation : list) {
                        if (catego.getTypeCategorie().equalsIgnoreCase(operation.getCategorie())) {
                            oc.setCategorie(operation.getCategorie());
                            somme += operation.getPrixTotal();
                            quantite += operation.getQuantite();
                            oc.setPrixTotal(somme);
                            oc.setQuantite(quantite);

                        }
                    }
                    if (somme > 0 && quantite > 0) {
                        list1.add(oc);
                    }
                });
                request.setAttribute("operation", list1);

                list1.clear();

                catProd.stream().forEach((catego) -> {
                    catego.getArticleList().stream().forEach((ar) -> {
                        double somme = 0;
                        int quantite = 0;
                        // OperationConsommateur occ = null;
                        OperationConsommateur oc = new OperationConsommateur();
                        for (OperationConsommateur operation : list) {
                            if (ar.getCode().equalsIgnoreCase(operation.getCodeProduit())) {
                                // occ = operation;
                                oc.setCategorie(operation.getCategorie());
                                oc.setDesignation(operation.getDesignation());
                                oc.setCodeProduit(operation.getCodeProduit());
                                somme += operation.getPrixTotal();
                                quantite += operation.getQuantite();
                                oc.setPrixTotal(somme);
                                oc.setQuantite(quantite);
                                oc.setPrix(operation.getPrix());

                            }
                        }
                        if (somme > 0 && quantite > 0) {
                            list1.add(oc);
                        }
                    });
                });
                request.setAttribute("stat", "societe");

                request.setAttribute("statsociete", "oui");
                request.setAttribute("services", serviceFacade.findAll());
                request.setAttribute("regions", regionFacade.findAll());
                request.setAttribute("sites", siteFacade.findAll());
                request.setAttribute("operationArticle", list1);
                request.setAttribute("conso", "la societe");
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("deletteArticleStockMP")) {

                int idarticle = Integer.parseInt(request.getParameter("idarticle"));
                int idmagasin = Integer.parseInt(request.getParameter("id_Magasin"));
                Article art = articleFacade.find(idarticle);
                StockproduitMP smp = stockproduitMPFacade.findByDesignationByidMP(idmagasin, art.getDesignation());

                stockproduitMPFacade.remove(smp);
               // List<StockproduitMP> liststockMP = stockproduitMPFacade.findByidMP(smp.getCategorie().getMagasinPrincipal().getIdMagasin());
                MagasinPrincipal mag = magasinPrincipalFacade.find(idmagasin);
                JSONArray Allpages = new JSONArray();
                mag.getCategorieproduitMPList().stream().map((permission) -> {
                    JSONArray perso = new JSONArray();
                    perso.put(permission.getIdCategorie()).put(permission.getNomCategorie());
                    return perso;
                }).forEach((perso) -> {
                    Allpages.put(perso);
                });

                response.setContentType("application/json");
                response.getWriter().print(Allpages);

            } else if (action.equalsIgnoreCase("deletteArticleStockMS")) {

                int idarticle = Integer.parseInt(request.getParameter("idarticle"));
                int idmagasin = Integer.parseInt(request.getParameter("id_Magasin"));
                Article art = articleFacade.find(idarticle);
                StockproduitMS smp = stockproduitMSFacade.findByDesignationByidMS(idmagasin, art.getDesignation());
                stockproduitMSFacade.remove(smp);
                MagasinSecondaire mag = magasinSecondaireFacade.find(idmagasin);

                List<StockproduitMS> liststockMP = stockproduitMSFacade.findStockMP(smp.getCategorie().getMagasinSecondaire().getIdMagasin());

                JSONArray Allpages = new JSONArray();
                mag.getCategorieproduitMSList().stream().map((permission) -> {
                    JSONArray perso = new JSONArray();
                    perso.put(permission.getIdCategorie()).put(permission.getNomCategorie());
                    return perso;
                }).forEach((perso) -> {
                    Allpages.put(perso);
                });

                response.setContentType("application/json");
                response.getWriter().print(Allpages);

            }
            if (request.getParameter("camabert") != null) {
                ReportingCamenbert(request, response);
            }

        } else {
            response.sendRedirect("login.jsp");
        }
    }

    void ReportingCamenbert(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("camabertAllPersonnelServiceByAnnee")) {

            int serv = Integer.parseInt(request.getParameter("service"));
            Service r1 = serviceFacade.find(serv);
            List<CategorieProduit> cps = new ArrayList<>();
            for (CentreCout centre : r1.getCentrecoutList()) {
                for (Butget but : centre.getButgetList()) {
                    CategorieProduit catprod = categorieProduitFacade.findByTypeCategorie(but.getTypeBudget());
                    cps.add(catprod);

                }
            }
            Integer annee = Integer.parseInt(request.getParameter("annee"));

            JSONArray object = new JSONArray();

            for (CategorieProduit cat : cps) {
                int tota = 0;
                JSONArray AllConsomma = new JSONArray();
                AllConsomma.put(cat.getTypeCategorie());
                for (Personnel p : r1.getPersonnelList()) {
                    int total = statistiqueCategoriePersonnelFacade.SUMConsoForPersonnel(p.getIdPersonnel(), cat.getTypeCategorie(), annee);
                    tota += total;
                }
                for (Personnel p : r1.getPersonnelList()) {
                    JSONArray AllConsommation = new JSONArray();
                    int total = statistiqueCategoriePersonnelFacade.SUMConsoForPersonnel(p.getIdPersonnel(), cat.getTypeCategorie(), annee);
                    double totas = arrondi(((double) total / (double) (tota)) * 100, 1);
                    AllConsommation.put(p.getNomPrenom());
                    try {
                        AllConsommation.put(totas);
                    } catch (JSONException ex) {
                        Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    AllConsomma.put(AllConsommation);
                }

                object.put(AllConsomma);

            }
            response.setContentType("application/json");
            try {
                response.getWriter().print(object);
            } catch (IOException ex) {
                Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (action.equalsIgnoreCase("camabertAllPersonnelServiceByPeriode")) {

            String[] categorie = request.getParameterValues("categorie");
            String[] serv = request.getParameterValues("personnel");
            List<CategorieProduit> cps = new ArrayList<>();
            for (String id : categorie) {
                CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                cps.add(catprod);

            }
            List<Personnel> allpersonnel = new ArrayList<>();
            for (String id : serv) {
                Personnel r1 = personnelFacade.find(Integer.parseInt(id));
                allpersonnel.add(r1);
            }

            String dates = request.getParameter("interval");
            String[] d = dates.split("-");
            String datedebut = d[0];
            String datefin = d[1];
            Date d1 = date_du_jour.dateConvert(datedebut);
            Date d2 = date_du_jour.dateConvert(datefin);

            JSONArray object = new JSONArray();

            for (CategorieProduit cat : cps) {
                int tota = 0;
                JSONArray AllConsomma = new JSONArray();
                AllConsomma.put(cat.getTypeCategorie());
                for (Personnel p : allpersonnel) {
                    int total = statistiqueCategoriePersonnelFacade.SUMConsoForPersonnel(p.getIdPersonnel(), cat.getTypeCategorie(), d1, d2);
                    tota += total;
                }
                for (Personnel p : allpersonnel) {
                    JSONArray AllConsommation = new JSONArray();
                    int total = statistiqueCategoriePersonnelFacade.SUMConsoForPersonnel(p.getIdPersonnel(), cat.getTypeCategorie(), d1, d2);
                    double totas = arrondi(((double) total / (double) (tota)) * 100, 1);
                    AllConsommation.put(p.getNomPrenom());
                    try {
                        AllConsommation.put(totas);
                    } catch (JSONException ex) {
                        Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    AllConsomma.put(AllConsommation);
                }

                object.put(AllConsomma);

            }
            response.setContentType("application/json");
            try {
                response.getWriter().print(object);
            } catch (IOException ex) {
                Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (action.equalsIgnoreCase("camabertAllservice")) {

            String[] categorie = request.getParameterValues("categorie");
            String[] serv = request.getParameterValues("service");
            List<CategorieProduit> cps = new ArrayList<>();
            for (String id : categorie) {
                CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                cps.add(catprod);

            }
            List<Service> allservice = new ArrayList<>();
            for (String id : serv) {
                Service r1 = serviceFacade.find(Integer.parseInt(id));
                allservice.add(r1);
            }

            String dates = request.getParameter("interval");
            String[] d = dates.split("-");
            String datedebut = d[0];
            String datefin = d[1];
            Date d1 = date_du_jour.dateConvert(datedebut);
            Date d2 = date_du_jour.dateConvert(datefin);

            JSONArray object = new JSONArray();

            for (CategorieProduit cat : cps) {
                int tota = 0;
                JSONArray AllConsomma = new JSONArray();
                AllConsomma.put(cat.getTypeCategorie());
                for (Service r1 : allservice) {
                    int total = statistiqueCategorieServiceFacade.SUMConsoForService(r1.getIdService(), cat.getTypeCategorie(), d1, d2);
                    tota += total;
                }
                for (Service r1 : allservice) {
                    JSONArray AllConsommation = new JSONArray();
                    int total = statistiqueCategorieServiceFacade.SUMConsoForService(r1.getIdService(), cat.getTypeCategorie(), d1, d2);
                    double totas = arrondi(((double) total / (double) (tota)) * 100, 1);
                    AllConsommation.put(r1.getNomService());
                    try {
                        AllConsommation.put(totas);
                    } catch (JSONException ex) {
                        Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    AllConsomma.put(AllConsommation);
                }

                object.put(AllConsomma);

            }
            response.setContentType("application/json");
            try {
                response.getWriter().print(object);
            } catch (IOException ex) {
                Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (action.equalsIgnoreCase("camabertAllCentreCout")) {

            String[] categorie = request.getParameterValues("categorie");
            String[] serv = request.getParameterValues("centre_cout");
            List<CategorieProduit> cps = new ArrayList<>();
            for (String id : categorie) {
                CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                cps.add(catprod);

            }
            List<CentreCout> allservice = new ArrayList<>();
            for (String id : serv) {
                CentreCout r1 = centreCoutFacade.find(Integer.parseInt(id));
                allservice.add(r1);
            }

            String dates = request.getParameter("interval");
            String[] d = dates.split("-");
            String datedebut = d[0];
            String datefin = d[1];
            Date d1 = date_du_jour.dateConvert(datedebut);
            Date d2 = date_du_jour.dateConvert(datefin);

            JSONArray object = new JSONArray();

            for (CategorieProduit cat : cps) {
                int tota = 0;
                JSONArray AllConsomma = new JSONArray();
                AllConsomma.put(cat.getTypeCategorie());
                for (CentreCout r1 : allservice) {

                    int total = statistiqueCategorieServiceFacade.SUMConsoForService(r1.getService().getIdService(), cat.getTypeCategorie(), d1, d2);
                    tota += total;

                }
                for (CentreCout r1 : allservice) {
                    JSONArray AllConsommation = new JSONArray();
                    AllConsommation.put(r1.getLibelle());
                    double totas = 0;

                    int total = statistiqueCategorieServiceFacade.SUMConsoForService(r1.getService().getIdService(), cat.getTypeCategorie(), d1, d2);
                    totas = arrondi(((double) total / (double) (tota)) * 100, 1);

                    try {
                        AllConsommation.put(totas);
                    } catch (JSONException ex) {
                        Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    AllConsomma.put(AllConsommation);
                }
                object.put(AllConsomma);

            }
            response.setContentType("application/json");
            try {
                response.getWriter().print(object);
            } catch (IOException ex) {
                Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (action.equalsIgnoreCase("camabertAllDirection")) {

            String[] categorie = request.getParameterValues("categorie");
            String[] direc = request.getParameterValues("direction");
            List<CategorieProduit> cps = new ArrayList<>();
            for (String id : categorie) {
                CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                cps.add(catprod);

            }

            List<Direction> alldirection = new ArrayList<>();
            for (String id : direc) {
                Direction r1 = directionFacade.find(Integer.parseInt(id));
                alldirection.add(r1);
            }

            String dates = request.getParameter("interval");
            String[] d = dates.split("-");
            String datedebut = d[0];
            String datefin = d[1];
            Date d1 = date_du_jour.dateConvert(datedebut);
            Date d2 = date_du_jour.dateConvert(datefin);

            JSONArray object = new JSONArray();

            for (CategorieProduit cat : cps) {
                int tota = 0;
                JSONArray AllConsomma = new JSONArray();
                AllConsomma.put(cat.getTypeCategorie());
                for (Direction r1 : alldirection) {
                    int total = statistiqueCategorieDirectionFacade.SUMConsoForDirection(r1.getIdDirection(), cat.getTypeCategorie(), d1, d2);
                    tota += total;
                }
                for (Direction r1 : alldirection) {
                    JSONArray AllConsommation = new JSONArray();
                    int total = statistiqueCategorieDirectionFacade.SUMConsoForDirection(r1.getIdDirection(), cat.getTypeCategorie(), d1, d2);
                    double totas = arrondi(((double) total / (double) (tota)) * 100, 1);

                    AllConsommation.put(r1.getNomDirection());
                    try {
                        AllConsommation.put(totas);
                    } catch (JSONException ex) {
                        Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    AllConsomma.put(AllConsommation);
                }

                System.out.println(AllConsomma);

                object.put(AllConsomma);

            }
            response.setContentType("application/json");
            try {
                response.getWriter().print(object);
            } catch (IOException ex) {
                Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (action.equalsIgnoreCase("camabertAllMS")) {

            String[] categorie = request.getParameterValues("categorie");
            String[] mag = request.getParameterValues("id_magasin");
            List<CategorieProduit> cps = new ArrayList<>();
            for (String id : categorie) {
                CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                cps.add(catprod);

            }

            List<MagasinSecondaire> allMagMS = new ArrayList<>();
            for (String id : mag) {
                MagasinSecondaire ms = magasinSecondaireFacade.find(Integer.parseInt(id));
                allMagMS.add(ms);
            }
            String dates = request.getParameter("interval");
            String[] d = dates.split("-");
            String datedebut = d[0];
            String datefin = d[1];
            Date d1 = date_du_jour.dateConvert(datedebut);
            Date d2 = date_du_jour.dateConvert(datefin);

            JSONArray object = new JSONArray();
            HashMap map = new HashMap();

            for (CategorieProduit cat : cps) {
                int tota = 0;
                JSONArray AllConsomma = new JSONArray();
                AllConsomma.put(cat.getTypeCategorie());
                for (MagasinSecondaire r1 : allMagMS) {
                    int total = statistiqueCategorieMagasinMsFacade.SUMConsoForMS(r1.getIdMagasin(), cat.getTypeCategorie(), d1, d2);
                    tota += total;
                }
                for (MagasinSecondaire r1 : allMagMS) {
                    JSONArray AllConsommation = new JSONArray();
                    int total = statistiqueCategorieMagasinMsFacade.SUMConsoForMS(r1.getIdMagasin(), cat.getTypeCategorie(), d1, d2);
                    double totas = arrondi(((double) total / (double) (tota)) * 100, 1);

                    AllConsommation.put(r1.getNomMagasin());
                    try {
                        AllConsommation.put(totas);
                    } catch (JSONException ex) {
                        Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    AllConsomma.put(AllConsommation);
                }

                System.out.println(AllConsomma);

                object.put(AllConsomma);

            }
            response.setContentType("application/json");
            try {
                response.getWriter().print(object);
            } catch (IOException ex) {
                Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equalsIgnoreCase("camabertAllMP")) {

            String[] categorie = request.getParameterValues("categorie");
            String[] mag = request.getParameterValues("id_magasinP");
            List<CategorieProduit> cps = new ArrayList<>();
            for (String id : categorie) {
                CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                cps.add(catprod);

            }

            List<MagasinPrincipal> allMagMP = new ArrayList<>();
            for (String id : mag) {
                MagasinPrincipal mp = magasinPrincipalFacade.find(Integer.parseInt(id));
                allMagMP.add(mp);
            }
            String dates = request.getParameter("interval");
            String[] d = dates.split("-");
            String datedebut = d[0];
            String datefin = d[1];
            Date d1 = date_du_jour.dateConvert(datedebut);
            Date d2 = date_du_jour.dateConvert(datefin);

            JSONArray object = new JSONArray();
            HashMap map = new HashMap();

            for (CategorieProduit cat : cps) {
                int tota = 0;
                JSONArray AllConsomma = new JSONArray();
                AllConsomma.put(cat.getTypeCategorie());
                for (MagasinPrincipal r1 : allMagMP) {
                    int total = statistiqueCategoriMagasinMpFacade.SUMConsoForMP(r1.getIdMagasin(), cat.getTypeCategorie(), d1, d2);
                    tota += total;
                }
                for (MagasinPrincipal r1 : allMagMP) {
                    JSONArray AllConsommation = new JSONArray();
                    int total = statistiqueCategoriMagasinMpFacade.SUMConsoForMP(r1.getIdMagasin(), cat.getTypeCategorie(), d1, d2);
                    double totas = arrondi(((double) total / (double) (tota)) * 100, 1);
                    AllConsommation.put(r1.getNomMagasin());
                    try {
                        AllConsommation.put(totas);
                    } catch (JSONException ex) {
                        Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    AllConsomma.put(AllConsommation);
                }

                System.out.println(map);

                object.put(AllConsomma);

            }
            response.setContentType("application/json");
            try {
                response.getWriter().print(object);
            } catch (IOException ex) {
                Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equalsIgnoreCase("camabertAllRegion")) {
            String[] regions = request.getParameterValues("region");

            String[] categorie = request.getParameterValues("categorie");
            List<CategorieProduit> cps = new ArrayList<>();
            for (String id : categorie) {
                CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                cps.add(catprod);

            }
            List<Region> regi = new ArrayList<>();
            for (String reg : regions) {
                regi.add(regionFacade.find(Integer.parseInt(reg)));
            }
            //  int region = Integer.parseInt(request.getParameter("region"));
            String dates = request.getParameter("interval");
            String[] d = dates.split("-");
            String datedebut = d[0];
            String datefin = d[1];
            Date d1 = date_du_jour.dateConvert(datedebut);
            Date d2 = date_du_jour.dateConvert(datefin);

            JSONArray object = new JSONArray();
            HashMap map = new HashMap();

            for (CategorieProduit cat : cps) {
                int tota = 0;
                JSONArray AllConsomma = new JSONArray();
                AllConsomma.put(cat.getTypeCategorie());
                for (Region r1 : regi) {
                    int total = statistiqueCategorieRegionFacade.SUMConsoForRegion(r1.getIdRegion(), cat.getTypeCategorie(), d1, d2);
                    tota += total;
                }

                for (Region r1 : regi) {
                    JSONArray AllConsommation = new JSONArray();
                    int total = statistiqueCategorieRegionFacade.SUMConsoForRegion(r1.getIdRegion(), cat.getTypeCategorie(), d1, d2);
                    double totas = arrondi(((double) total / (double) (tota)) * 100, 1);
                    AllConsommation.put(r1.getNomRegion());
                    try {
                        AllConsommation.put(totas);
                    } catch (JSONException ex) {
                        Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    AllConsomma.put(AllConsommation);
                }

                System.out.println(AllConsomma);

                object.put(AllConsomma);

            }
            response.setContentType("application/json");
            try {
                response.getWriter().print(object);
                System.out.println(object);
            } catch (IOException ex) {
                Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (action.equalsIgnoreCase("camabertAllsite")) {

            String[] categorie = request.getParameterValues("categorie");
            String[] sit = request.getParameterValues("site");
            List<CategorieProduit> cps = new ArrayList<>();
            for (String id : categorie) {
                CategorieProduit catprod = categorieProduitFacade.find(Integer.parseInt(id));
                cps.add(catprod);

            }
            List<Site> allsite = new ArrayList<>();
            for (String id : sit) {
                Site r1 = siteFacade.find(Integer.parseInt(id));
                allsite.add(r1);

            }

            String dates = request.getParameter("interval");
            String[] d = dates.split("-");
            String datedebut = d[0];
            String datefin = d[1];
            Date d1 = date_du_jour.dateConvert(datedebut);
            Date d2 = date_du_jour.dateConvert(datefin);

            JSONArray object = new JSONArray();
            HashMap map = new HashMap();

            for (CategorieProduit cat : cps) {
                int tota = 0;
                JSONArray AllConsomma = new JSONArray();
                AllConsomma.put(cat.getTypeCategorie());
                for (Site r1 : allsite) {
                    int total = statistiqueCategorieSiteFacade.SUMConsoForSite(r1.getIdSite(), cat.getTypeCategorie(), d1, d2);
                    tota += total;
                }
                for (Site r1 : allsite) {
                    JSONArray AllConsommation = new JSONArray();
                    int total = statistiqueCategorieSiteFacade.SUMConsoForSite(r1.getIdSite(), cat.getTypeCategorie(), d1, d2);
                    double totas = arrondi(((double) total / (double) (tota)) * 100, 1);
                    AllConsommation.put(r1.getNomSite());
                    try {
                        AllConsommation.put(totas);
                    } catch (JSONException ex) {
                        Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    AllConsomma.put(AllConsommation);

                }

                System.out.println(map);

                object.put(AllConsomma);

            }
            response.setContentType("application/json");
            try {
                response.getWriter().print(object);
            } catch (IOException ex) {
                Logger.getLogger(parametre.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    public static double arrondi(double A, int B) {
        return (double) ((int) (A * Math.pow(10, B) + .5)) / Math.pow(10, B);
    }

    public void persist(Object object) {
        try {
            utx.begin();
            em.persist(object);
            utx.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    }
}
