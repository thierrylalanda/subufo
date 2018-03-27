/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.servlet.common;

import com.gciapplication.entity.Butget;
import com.gciapplication.entity.CategorieProduit;
import com.gciapplication.entity.CentreCout;
import com.gciapplication.entity.CommandeMP;
import com.gciapplication.entity.Direction;
import com.gciapplication.entity.Notification;
import com.gciapplication.entity.Personnel;
import com.gciapplication.entity.Region;
import com.gciapplication.entity.Service;
import com.gciapplication.entity.Site;
import com.gciapplication.session.entity.ButgetFacadeLocal;
import com.gciapplication.session.entity.CategorieProduitFacadeLocal;
import com.gciapplication.session.entity.CentreCoutFacadeLocal;
import com.gciapplication.session.entity.CommandeMPFacadeLocal;
import com.gciapplication.session.entity.DirectionFacadeLocal;
import com.gciapplication.session.entity.NotificationFacadeLocal;
import com.gciapplication.session.entity.PersonnelFacadeLocal;
import com.gciapplication.session.entity.RegionFacadeLocal;
import com.gciapplication.session.entity.ServiceFacadeLocal;
import com.gciapplication.session.entity.SiteFacadeLocal;
import com.gestion.DataSource.mysql.date_du_jour;
import com.subufo.entity.DonneurOrdre;
import com.subufo.entity.EngagementDepense;
import com.subufo.entity.Op;
import com.subufo.session.entity.DonneurOrdreFacadeLocal;
import com.subufo.session.entity.EngagementDepenseFacadeLocal;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
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
@WebServlet(name = "ValiderDepense", urlPatterns = {"/validerDepense"})
public class ValiderDepense extends HttpServlet {

    @EJB
    private NotificationFacadeLocal notificationFacade;

    @EJB
    private CategorieProduitFacadeLocal categorieProduitFacade;

    @EJB
    private CommandeMPFacadeLocal commandeMPFacade;

    @EJB
    private ServiceFacadeLocal serviceFacade;

    @EJB
    private SiteFacadeLocal siteFacade;

    @EJB
    private DirectionFacadeLocal directionFacade;

    @EJB
    private RegionFacadeLocal regionFacade;

    @EJB
    private ButgetFacadeLocal butgetFacade;

    @EJB
    private CentreCoutFacadeLocal centreCoutFacade;

    @EJB
    private DonneurOrdreFacadeLocal donneurOrdreFacade;

    @EJB
    private EngagementDepenseFacadeLocal engagementDepenseFacade;

    @EJB
    private PersonnelFacadeLocal personnelFacade;

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
            String redirect = "";

            String action = request.getParameter("action");
            String vue = request.getParameter("vue");
            int idperso = (int) session.getAttribute("id");
            Personnel personel = (Personnel) session.getAttribute("personnel");
            List<Personnel> personnels;
            if (personel.getService() != null) {
                personnels = personnelFacade.findAllByIdRegion(personel.getService().getSite().getRegion().getIdRegion());
                request.setAttribute("personnels", personnels);
            } else {
                personnels = personnelFacade.findAll();
            }
            List<Direction> directions = directionFacade.findAll();
            List<Site> sites = siteFacade.findAll();
            //List<Region> regions = regionFacade.findAll();
            List<String> natures = date_du_jour.findNatureDepense();
            request.setAttribute("natures", natures);

            if (personel.getService() == null) {
                request.setAttribute("regions", regionFacade.findAll());
            } else {
                request.setAttribute("region", personel.getService().getSite().getRegion());
            }
            request.setAttribute("sites", sites);
            request.setAttribute("directions", directions);
            //  request.setAttribute("regions", regions);
            int niveau = 0;
            Personnel per = personnelFacade.find(idperso);
            niveau = per.getLoginList().getNiveauAcces();
            switch (niveau) {
                case 1:
                    redirect = "/WEB-INF/controleurs/main.jsp";
                    break;
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

                    redirect = "/WEB-INF/administrateur/main1.jsp";
                    break;
            }
            if (action.equalsIgnoreCase("reporting")) {
                List<EngagementDepense> depenses;
                if (personel.getService() != null) {
                    depenses = engagementDepenseFacade.findReportinByAll(personel.getService().getSite().getRegion().getIdRegion());
                } else {
                    depenses = engagementDepenseFacade.findReportinByAll(regionFacade.findAll().get(0).getIdRegion());
                }
                List<CategorieProduit> nature = categorieProduitFacade.findAll();
                request.setAttribute("natures", nature);
                request.setAttribute("depenses", depenses);
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
            } else if (action.equalsIgnoreCase("reporting_recherche")) {

                Date d1 = date_du_jour.dateConvert(request.getParameter("date1"));
                Date d2 = date_du_jour.dateConvert(request.getParameter("date2"));
                String rubrique = request.getParameter("nature");
                int entite = 0;
                int indicateur = 5;
                boolean tous = false;
                List<EngagementDepense> depenses = null;
                String message = "";
                if (rubrique.equalsIgnoreCase("tous")) {
                    tous = true;
                }
                if (request.getParameter("region") != null) {
                    entite = Integer.parseInt(request.getParameter("region"));
                    Region reg = regionFacade.find(entite);
                    message = "consommations de la region de :" + reg.getNomRegion() + " consernant les :" + rubrique + " a la periode du " + request.getParameter("date1") + " au " + request.getParameter("date2");
                    indicateur = 0;

                }

                if (request.getParameter("service") != null) {
                    entite = Integer.parseInt(request.getParameter("service"));
                    Service ser = serviceFacade.find(entite);
                    message = "consommations du service :" + ser.getNomService() + " consernant les :" + rubrique + " a la periode du " + request.getParameter("date1") + " au " + request.getParameter("date2");

                    indicateur = 2;
                }
                if (request.getParameter("direction") != null) {
                    entite = Integer.parseInt(request.getParameter("direction"));
                    Direction dir = directionFacade.find(entite);
                    message = "consommations de la direction de :" + dir.getNomDirection() + " consernant les :" + rubrique + " a la periode du " + request.getParameter("date1") + " au " + request.getParameter("date2");

                    indicateur = 1;
                }
                if (request.getParameter("personnel") != null) {
                    entite = Integer.parseInt(request.getParameter("personnel"));
                    Personnel pers = personnelFacade.find(entite);
                    message = "consommations du personnel :" + pers.getNomPrenom() + " consernant les :" + rubrique + " a la periode du " + request.getParameter("date1") + " au " + request.getParameter("date2");

                    indicateur = 3;
                }
                if (request.getParameter("personnel") == null && request.getParameter("direction") == null && request.getParameter("service") == null && request.getParameter("region") == null) {
                    // entite = Integer.parseInt(request.getParameter("direction"));
                    message = "consommations de la societe  consernant les :" + rubrique + " a la periode du " + request.getParameter("date1") + " au " + request.getParameter("date2");

                    indicateur = 4;
                }
                switch (indicateur) {
                    case 0:
                        if (!tous) {
                            depenses = engagementDepenseFacade.findReportinByCriteria(d2, d1, rubrique, entite, 0);
                        } else {
                            depenses = new ArrayList<>();
                            List<String> listnatures = date_du_jour.findNatureEngagement("receptionner");
                            for (String nat : listnatures) {
                                List<EngagementDepense> depensess = engagementDepenseFacade.findReportinByCriteria(d2, d1, nat, entite, 0);
                                for (EngagementDepense r1 : depensess) {
                                    depenses.add(r1);
                                }
                            }
                        }

                        break;
                    case 1:
                        if (!tous) {
                            depenses = engagementDepenseFacade.findReportinByCriteria(d2, d1, rubrique, entite, 1);
                        } else {
                            depenses = new ArrayList<>();
                            List<String> listnatures = date_du_jour.findNatureEngagement("receptionner");
                            for (String nat : listnatures) {
                                List<EngagementDepense> depensess = engagementDepenseFacade.findReportinByCriteria(d2, d1, nat, entite, 1);
                                for (EngagementDepense r1 : depensess) {
                                    depenses.add(r1);
                                }
                            }
                        }

                        break;
                    case 2:
                        if (!tous) {
                            depenses = engagementDepenseFacade.findReportinByCriteria(d2, d1, rubrique, entite, 2);
                        } else {
                            depenses = new ArrayList<>();
                            List<String> listnatures = date_du_jour.findNatureEngagement("receptionner");
                            for (String nat : listnatures) {
                                List<EngagementDepense> depensess = engagementDepenseFacade.findReportinByCriteria(d2, d1, nat, entite, 2);
                                for (EngagementDepense r1 : depensess) {
                                    depenses.add(r1);
                                }
                            }
                        }

                        break;
                    case 3:
                        if (!tous) {
                            depenses = engagementDepenseFacade.findReportinByCriteria(d2, d1, rubrique, entite, 3);
                        } else {
                            depenses = new ArrayList<>();
                            List<String> listnatures = date_du_jour.findNatureEngagement("receptionner");
                            for (String nat : listnatures) {
                                List<EngagementDepense> depensess = engagementDepenseFacade.findReportinByCriteria(d2, d1, nat, entite, 3);
                                for (EngagementDepense r1 : depensess) {
                                    depenses.add(r1);
                                }
                            }
                        }

                        break;
                    case 4:
                        depenses = new ArrayList<>();
                        List<Region> rs = regionFacade.findAll();
                        for (Region r : rs) {
                            if (!tous) {
                                List<EngagementDepense> depensess = engagementDepenseFacade.findReportinByCriteria(d2, d1, rubrique, r.getIdRegion(), 0);
                                if (!depensess.isEmpty()) {
                                    for (EngagementDepense r1 : depensess) {
                                        depenses.add(r1);
                                    }
                                }
                            } else {
                                // depenses = new ArrayList<>();
                                List<String> listnatures = date_du_jour.findNatureEngagement("receptionner");
                                for (String nat : listnatures) {
                                    List<EngagementDepense> depensess = engagementDepenseFacade.findReportinByCriteria(d2, d1, nat, r.getIdRegion(), 0);
                                    for (EngagementDepense r1 : depensess) {
                                        depenses.add(r1);
                                    }
                                }
                            }

                        }
                        break;
                    default:
                        break;
                }

                // depenses = engagementDepenseFacade.findAllByPeriode(d1, d2, statut);
                request.setAttribute("depenses", depenses);
                List<CategorieProduit> nature = categorieProduitFacade.findAll();
                request.setAttribute("natures", nature);
                request.setAttribute("vue", vue);
                request.setAttribute("message", message);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
            } else if (action.equalsIgnoreCase("reporting_Statistique")) {
                Date d1;
                String statut;
                if (request.getParameter("statut") != null) {
                    statut = request.getParameter("statut");
                } else {
                    statut = "valider";
                }
                if (request.getParameter("annee") != null) {
                    String date1 = "1/1/" + request.getParameter("annee");
                    d1 = date_du_jour.dateConvert(date1);
                } else {
                    d1 = date_du_jour.dateJourUniqueDate();
                }
                List<String> nature = date_du_jour.findNatureEngagement(statut);
                if (request.getParameter("statut").equalsIgnoreCase("Achat")) {
                    nature.add("Achat");
                }

                JSONArray object = new JSONArray();

                for (String nat : nature) {
                    HashMap dat = new HashMap();
                    List<Double> ds = date_du_jour.findAllConsommation(d1, statut, nat);
                    dat.put("name", nat);
                    dat.put("data", ds);
                    object.put(dat);
                }

                response.setContentType("application/json");
                response.getWriter().print(object);
            } else if (action.equalsIgnoreCase("reporting_camanbert")) {
                Date d1;
                String statut = "valider";
                int mois = 0;

                if (request.getParameter("mois") != null) {
                    mois = Integer.parseInt(request.getParameter("mois"));
                }
                if (request.getParameter("annee") != null) {
                    String date1 = "1/1/" + request.getParameter("annee");
                    d1 = date_du_jour.dateConvert(date1);
                } else {
                    d1 = date_du_jour.dateJourUniqueDate();
                }
                List<String> nature = date_du_jour.findNatureEngagement(statut);
                nature.add("Achat");

                JSONArray object = new JSONArray();
                for (String nat : nature) {
                    JSONArray objectt = new JSONArray();

                    Double ds = date_du_jour.findAllConsommationRubrique(d1, statut, nat, mois);
                    objectt.put(nat + " : " + ds);
                    objectt.put(ds);

                    object.put(objectt);
                }

                response.setContentType("application/json");
                response.getWriter().print(object);
            } else if (action.equalsIgnoreCase("reporting_general")) {
                String statut;
                int mois = 1;
                double montant = 0;
                double budget = 0;
                Date d1;
                if (request.getParameter("annee") != null) {

                    String date1 = "1/1/" + request.getParameter("annee");
                    d1 = date_du_jour.dateConvert(date1);

                } else {
                    d1 = date_du_jour.dateJourUniqueDate();
                }
                if (request.getParameter("mois") != null) {
                    mois = Integer.parseInt(request.getParameter("mois"));
                    montant = date_du_jour.findAllReportingGeneral(d1, mois, "valider");
                    budget = date_du_jour.findAllReportingGeneral(d1, mois, "AllBudget");
                } else {
                    statut = "Tous";
                    montant = date_du_jour.findAllReportingGeneral(d1, mois, statut);
                    budget = date_du_jour.findAllReportingGeneral(d1, mois, "AllBudget");
                }
                JSONArray object = new JSONArray();
                HashMap dat = new HashMap();
                dat.put("consommer", montant);
                dat.put("budget", budget);
                object.put(dat);

                response.setContentType("application/json");
                response.getWriter().print(object);
            } else if (action.equalsIgnoreCase("validerDemande")) {
                // int idpersonnel = (int) session.getAttribute("id");
                List<EngagementDepense> depenses = new ArrayList<>();
                try {
                    List<DonneurOrdre> dos = donneurOrdreFacade.findAllByValideur(idperso);

                    dos.stream().forEach((ordre) -> {
                        depenses.add(ordre.getIdEngagement());
                    });
                } catch (Exception e) {
                    e.getCause();
                }
                request.setAttribute("engagements", donneurOrdreFacade.findAllByValideur(personel.getIdPersonnel()));
                request.setAttribute("depenses", depenses);
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("getDemande")) {

                int id_depense = Integer.parseInt(request.getParameter("id_depense"));
                EngagementDepense dep = engagementDepenseFacade.find(id_depense);

                if (dep != null) {
                    request.setAttribute("centre_cout", centreCoutFacade.findAllByService(dep.getDemandeur().getService().getIdService()));
                } else {
                    request.setAttribute("message", " demande numero " + id_depense + " non identifiée veuillez entrer une demande valide");
                }

                if (dep.getMagasin() != 0) {
                    List<CommandeMP> cmps = commandeMPFacade.findByIdMPAndEtat(dep.getMagasin(), "Encour de Traitement");
                    request.setAttribute("commandesMP", cmps);
                }
                List<EngagementDepense> depenses = new ArrayList<>();
                try {
                    List<DonneurOrdre> dos = donneurOrdreFacade.findAllByValideur(idperso);

                    dos.stream().forEach((ordre) -> {
                        depenses.add(ordre.getIdEngagement());
                    });
                } catch (Exception e) {
                    e.getCause();
                }
                List<Personnel> personnelss = personnels.stream().filter(p -> p.getFonctionSubufo().equals("oui")).
                        collect(Collectors.toList());

                if (personel.getFonctionSubufo().equals("oui")) {
                    List<Personnel> personnelsc = personnels.stream().filter(p -> p.getRole().equals("controleur")).
                            collect(Collectors.toList());
                    request.setAttribute("controleur", personnelsc);
                } else if (personel.getRole().equalsIgnoreCase("controleur")) {
                    List<Personnel> personnelscc = personnels.stream().filter(p -> p.getRole().equals("caissier")).
                            collect(Collectors.toList());
                    request.setAttribute("caissiers", personnelscc);
                } else {
                    List<Personnel> personnelsc = personnels.stream().filter(p -> p.getChefService().equals("oui")).
                            collect(Collectors.toList());

                    request.setAttribute("superieur", personnelsc);
                }

                request.setAttribute("engagements", donneurOrdreFacade.findAllByValideur(personel.getIdPersonnel()));
                request.setAttribute("depenses", depenses);

                request.setAttribute("secretaires", personnelss);

                request.setAttribute("vue", vue);

                request.setAttribute("demande", dep);

                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
            } else if (action.equalsIgnoreCase("showCommandeMP")) {
                int id = Integer.parseInt(request.getParameter("idMP"));

                List<CommandeMP> cmps = commandeMPFacade.findByRecenDateForShow(id);

                JSONArray object = new JSONArray();
                HashMap data = new HashMap();
                data.put("fournisseur", cmps.get(0).getIdSA().getNomFounisseur());
                data.put("magasin", cmps.get(0).getIdMP().getNomMagasin());
                int total = 0;
                JSONArray object1 = new JSONArray();
                for (CommandeMP cmp : cmps) {
                    HashMap dat = new HashMap();
                    dat.put("code", cmp.getCodeProduit());
                    dat.put("dateCommande", new Timestamp(cmp.getDate().getTime()).getTime());
                    dat.put("designation", cmp.getDesignation());
                    dat.put("type", cmp.getTypeProduit());
                    dat.put("quantite", cmp.getQuantiteCommande());
                    dat.put("prix", cmp.getPrixUnitaire());
                    dat.put("montant", cmp.getPrixTotal());

                    object1.put(dat);
                    total += cmp.getPrixTotal();
                }
                data.put("data", object1);
                data.put("total", total);
                object.put(data);
                response.setContentType("application/json");
                response.getWriter().print(object);

            } else if (action.equalsIgnoreCase("getDemandeForCaisse")) {
                int id = Integer.parseInt(request.getParameter("id_depense"));
                List<DonneurOrdre> dos = donneurOrdreFacade.findAllByValideur(idperso);

                List<DonneurOrdre> doss = dos.stream()
                        .filter(dp -> dp.getValideur().getIdPersonnel().compareTo(personel.getIdPersonnel()) == 0 && dp.getIdEngagement().getIdEng().compareTo(id) == 0)
                        .collect(Collectors.toList());

                if (!doss.isEmpty()) {
                    request.setAttribute("demande", doss.get(0).getIdEngagement());
                } else {
                    request.setAttribute("message", " aucun élement trouver");
                }
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
            } else if (action.equalsIgnoreCase("validation")) {

                EngagementDepense depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));
                depense.setStatut("traitement");

                engagementDepenseFacade.edit(depense);
                DonneurOrdre don = donneurOrdreFacade.findByEngagement(depense.getIdEng(), idperso);
                don.setJourValidation(date_du_jour.dateJourUniqueDate());
                don.setEtat(1);
                donneurOrdreFacade.edit(don);

                DonneurOrdre donn = new DonneurOrdre();
                donn.setIdEngagement(depense);
                donn.setJourValidation(date_du_jour.dateJourUniqueDate());
                donn.setValideur(personnelFacade.find(Integer.parseInt(request.getParameter("secretaire"))));
                donneurOrdreFacade.create(donn);

                List<EngagementDepense> depenses = new ArrayList<>();
                try {
                    List<DonneurOrdre> dos = donneurOrdreFacade.findAllByValideur(personel.getIdPersonnel());

                    dos.stream().forEach((ordre) -> {
                        depenses.add(ordre.getIdEngagement());
                    });
                } catch (Exception e) {
                    e.getCause();
                }

                session.setAttribute("personnel", personnelFacade.find(personel.getIdPersonnel()));
                request.setAttribute("engagements", donneurOrdreFacade.findAllByValideur(personel.getIdPersonnel()));
                request.setAttribute("depenses", depenses);
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("validation_CG")) {
                boolean iserro = false;
                // boolean iserror = false;
                EngagementDepense depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));

                for (Op oa : depense.getOpList()) {
                    Butget b = butgetFacade.find(oa.getIdBudget());
                    if (b.getMontantRestant() <= 0 || b.getMontantRestant() < oa.getMontant()) {
                        iserro = true;
                        break;
                    }
                }
                if (!iserro) {
                    for (Op oa : depense.getOpList()) {
                        Butget b = butgetFacade.find(oa.getIdBudget());
                        b.setMontantRestant(b.getMontantRestant() - oa.getMontant());
                        butgetFacade.edit(b);
                    }
                    depense.setStatut("valider");
                    engagementDepenseFacade.edit(depense);
                    DonneurOrdre don = donneurOrdreFacade.findByEngagement(depense.getIdEng(), idperso);
                    don.setJourValidation(date_du_jour.dateJourUniqueDate());
                    don.setEtat(1);
                    donneurOrdreFacade.edit(don);
                    List<EngagementDepense> depenses = new ArrayList<>();
                    try {
                        List<DonneurOrdre> dos = donneurOrdreFacade.findAllByValideur(idperso);

                        dos.stream().forEach((ordre) -> {
                            depenses.add(ordre.getIdEngagement());

                        });
                    } catch (Exception e) {
                        e.getCause();
                    }
                    //  boolean externe = false;
                    if (depense.getMagasin() != 0) {
                        List< CommandeMP> listCMP = commandeMPFacade.findByRecenDateForShow(depense.getMagasin());
                        for (CommandeMP cp : listCMP) {
                            cp.setEtat("OK");
                            cp.setIndice(1);
                            commandeMPFacade.edit(cp);
                        }
                        //  externe = true;
                    }
                    if (!personel.getRole().equals("caissier")) {
                        DonneurOrdre donn = new DonneurOrdre();
                        donn.setIdEngagement(depense);
                        donn.setJourValidation(date_du_jour.dateJourUniqueDate());
                        donn.setValideur(personnelFacade.find(Integer.parseInt(request.getParameter("caissier"))));
                        donneurOrdreFacade.create(donn);
                    }

                    request.setAttribute("depenses", depenses);
                } else {
                    request.setAttribute("message", "budget insuffisant");
                }

                request.setAttribute("engagements", donneurOrdreFacade.findAllByValideur(personel.getIdPersonnel()));
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("validation_Caisse")) {

                EngagementDepense depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));
                depense.setStatut("payer");
                engagementDepenseFacade.edit(depense);
                DonneurOrdre don = donneurOrdreFacade.findByEngagement(depense.getIdEng(), idperso);
                don.setJourValidation(date_du_jour.dateJourUniqueDate());
                don.setEtat(1);
                donneurOrdreFacade.edit(don);

                List<EngagementDepense> depenses = new ArrayList<>();
                try {
                    List<DonneurOrdre> dos = donneurOrdreFacade.findAllByValideur(idperso);

                    for (DonneurOrdre ordre : dos) {
                        depenses.add(ordre.getIdEngagement());
                    }
                } catch (Exception e) {
                    e.getCause();
                }

                session.setAttribute("personnel", personnelFacade.find(personel.getIdPersonnel()));
                request.setAttribute("depenses", depenses);
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("rejet_OA_CG")) {
                EngagementDepense depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));                
                depense.setStatut("traitement");
                depense.setRaisonRejet(request.getParameter("raison"));
                String name = request.getParameter("nom");

                engagementDepenseFacade.edit(depense);
                
                DonneurOrdre don = donneurOrdreFacade.findByEngagement(depense.getIdEng(), idperso);
                donneurOrdreFacade.remove(don);
                
                int id = 0;
                List<DonneurOrdre> donn = donneurOrdreFacade.findAllByEngagement(depense.getIdEng());
                for (DonneurOrdre dd : donn) {
                    if (dd.getValideur().getNomPrenom().equals(name)) {
                        id = dd.getValideur().getIdPersonnel();
                        dd.setEtat(null);
                        donneurOrdreFacade.edit(dd);
                        break;
                    }
                }
               
                List<EngagementDepense> depenses = new ArrayList<>();
                try {
                    List<DonneurOrdre> dos = donneurOrdreFacade.findAllByValideur(idperso);

                    dos.stream().forEach((ordre) -> {
                        depenses.add(ordre.getIdEngagement());
                    });
                } catch (Exception e) {
                    e.getCause();
                }
                Notification n = new Notification();
                n.setMessage("L'OA de : " + depense.getDemandeur().getNomPrenom() + " \n a été rejéter par: " + personel.getNomPrenom() + " \npour cette raison: " + depense.getRaisonRejet());
                n.setRecepteur(id);
                n.setVue(0);
                n.setDate(date_du_jour.dateJour());
                notificationFacade.create(n);
                
                date_du_jour.DeleteOP(depense.getIdEng());
                
                request.setAttribute("engagements", donneurOrdreFacade.findAllByValideur(personel.getIdPersonnel()));
                request.setAttribute("depenses", depenses);
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                
            } else if (action.equalsIgnoreCase("rejetDemande")) {
                EngagementDepense depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));

                depense.setStatut("rejeter");
                depense.setRaisonRejet(request.getParameter("raison"));
                // System.out.println(request.getParameter("raison"));
                engagementDepenseFacade.edit(depense);
                DonneurOrdre don = donneurOrdreFacade.findByEngagement(depense.getIdEng(), idperso);
                don.setJourValidation(date_du_jour.dateJourUniqueDate());
                don.setEtat(1);
                donneurOrdreFacade.edit(don);
                //date_du_jour.DeleteDonneurOrdre(depense.getIdEng(), idperso);
                List<EngagementDepense> depenses = new ArrayList<>();
                try {
                    List<DonneurOrdre> dos = donneurOrdreFacade.findAllByValideur(idperso);

                    for (DonneurOrdre ordre : dos) {
                        depenses.add(ordre.getIdEngagement());
                    }
                } catch (Exception e) {
                    e.getCause();
                }
                Notification n = new Notification();
                n.setMessage("Votre demande passer en date du : " + depense.getDateDemande() + " \n a été rejéter par: " + personel.getNomPrenom() + " \npour cette raison: " + depense.getRaisonRejet());
                n.setRecepteur(depense.getDemandeur().getIdPersonnel());
                n.setVue(0);
                n.setDate(date_du_jour.dateJour());
                notificationFacade.create(n);
                request.setAttribute("engagements", donneurOrdreFacade.findAllByValideur(personel.getIdPersonnel()));
                request.setAttribute("depenses", depenses);
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
            } else if (action.equalsIgnoreCase("suivreDepense")) {
                Personnel p = personnelFacade.find(Integer.parseInt(request.getParameter("controleur")));
                EngagementDepense depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));
                depense.setStatut("encour...");
                engagementDepenseFacade.edit(depense);
                DonneurOrdre ordre = donneurOrdreFacade.findByEngagement(depense.getIdEng(), idperso);
                ordre.setEtat(0);
                ordre.setJourValidation(date_du_jour.dateJourUniqueDate());
                donneurOrdreFacade.edit(ordre);

                DonneurOrdre ordr = new DonneurOrdre();
                ordr.setJourValidation(date_du_jour.dateJourUniqueDate());
                ordr.setIdEngagement(depense);
                ordr.setValideur(p);
                donneurOrdreFacade.create(ordr);

                List<EngagementDepense> depenses = new ArrayList<>();
                try {
                    List<DonneurOrdre> dos = donneurOrdreFacade.findAllByValideur(idperso);

                    for (DonneurOrdre ordree : dos) {
                        depenses.add(ordree.getIdEngagement());
                    }
                } catch (Exception e) {
                    e.getCause();
                }
                request.setAttribute("engagements", donneurOrdreFacade.findAllByValideur(personel.getIdPersonnel()));
                request.setAttribute("depenses", depenses);
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
            } else if (action.equalsIgnoreCase("getAllByRegion")) {
                int id_region = Integer.parseInt(request.getParameter("id_region"));
                List<Service> services = serviceFacade.findAllServiseByRegion(id_region);
                JSONArray object = new JSONArray();
                for (Service ser : services) {
                    HashMap dat = new HashMap();
                    dat.put("id", ser.getIdService());
                    dat.put("nom", ser.getNomService());
                    object.put(dat);
                }
                response.setContentType("application/json");
                response.getWriter().print(object);
            } else if (action.equalsIgnoreCase("getAllByService")) {
                int id_service = Integer.parseInt(request.getParameter("id_service"));
                List<CentreCout> centre = centreCoutFacade.findAllByService(id_service);
                JSONArray object = new JSONArray();
                for (CentreCout ser : centre) {
                    HashMap dat = new HashMap();
                    dat.put("id", ser.getIdCout());
                    dat.put("nom", ser.getLibelle());
                    object.put(dat);
                }
                response.setContentType("application/json");
                response.getWriter().print(object);
            } else if (action.equalsIgnoreCase("getAllByCentre")) {
                int id_centre = Integer.parseInt(request.getParameter("id_centre"));
                List<Butget> budgets = butgetFacade.findAllBudgetByCentreCout(id_centre);
                JSONArray object = new JSONArray();
                for (Butget ser : budgets) {
                    HashMap dat = new HashMap();
                    dat.put("id", ser.getIdBudget());
                    dat.put("nom", ser.getTypeBudget());
                    object.put(dat);
                }
                response.setContentType("application/json");
                response.getWriter().print(object);
            } else {
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

}
