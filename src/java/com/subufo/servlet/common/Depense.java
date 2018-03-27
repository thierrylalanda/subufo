/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.servlet.common;

import com.gciapplication.entity.Butget;
import com.gciapplication.entity.CategorieProduit;
import com.gciapplication.entity.CommandeMP;
import com.gciapplication.entity.Founisseur;
import com.gciapplication.entity.Personnel;
import com.gciapplication.session.entity.ButgetFacadeLocal;
import com.gciapplication.session.entity.CategorieProduitFacadeLocal;
import com.gciapplication.session.entity.CentreCoutFacadeLocal;
import com.gciapplication.session.entity.CommandeMPFacadeLocal;
import com.gciapplication.session.entity.FounisseurFacadeLocal;
import com.gciapplication.session.entity.PersonnelFacadeLocal;
import com.gciapplication.session.entity.RegionFacadeLocal;
import com.gestion.DataSource.mysql.date_du_jour;
import com.subufo.entity.DonneurOrdre;
import com.subufo.entity.EngagementDepense;
import com.subufo.entity.Op;
import com.subufo.session.entity.DonneurOrdreFacadeLocal;
import com.subufo.session.entity.EngagementDepenseFacadeLocal;
import com.subufo.session.entity.OpFacadeLocal;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "Depense", urlPatterns = {"/depense"})
public class Depense extends HttpServlet {

    @EJB
    private CommandeMPFacadeLocal commandeMPFacade;
    
    @EJB
    private CentreCoutFacadeLocal centrecoutFacade;

    @EJB
    private CategorieProduitFacadeLocal categorieProduitFacade;

    @EJB
    private FounisseurFacadeLocal founisseurFacade;

    @EJB
    private RegionFacadeLocal regionFacade;

    @EJB
    private ButgetFacadeLocal butgetFacade;

    @EJB
    private DonneurOrdreFacadeLocal donneurOrdreFacade;

    @EJB
    private EngagementDepenseFacadeLocal engagementDepenseFacade;

    @EJB
    private PersonnelFacadeLocal personnelFacade;

    @EJB
    private OpFacadeLocal opFacade;

    Personnel personnel;
    List<OA> l = new ArrayList<>();
    List<Op> opp = new ArrayList<>();
    HttpSession session;
    private final String EtatCommande = "Encour de Traitement";
    
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
        session = request.getSession();
        if (session.getAttribute("id") != null) {
            personnel = (Personnel) session.getAttribute("personnel");
            String action = request.getParameter("action");
            String vue = request.getParameter("vue");

            if (personnel.getService() == null) {
                request.setAttribute("regions", regionFacade.findAll());
            } else {
                request.setAttribute("region", personnel.getService().getSite().getRegion());
            }
            List<Butget> budget = butgetFacade.findAll();
            request.setAttribute("centre_cout", budget);
            int idperso = (int) session.getAttribute("id");
            String redirect = "";
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

            if (action.equalsIgnoreCase("addDepense")) {
                boolean error = creer_demande_engagement(request, true);
                if (!error) {
                    List<Founisseur> fournisseurs = founisseurFacade.findAll();
                    List<EngagementDepense> depense = null;
                    List<Personnel> personnels = null;
                    if (personnel.getChefService().equalsIgnoreCase("oui")) {
                        personnels = personnelFacade.findAllByIdService(personnel.getService().getIdService());
                        depense = engagementDepenseFacade.findAll().stream().
                                filter(e -> e.getDemandeur().getService().getIdService().compareTo(personnel.getService().getIdService()) == 0).
                                collect(Collectors.toList());
                    } else if (personnel.getFonctionSubufo().equalsIgnoreCase("oui") || personnel.getFonctionSubufo().equalsIgnoreCase("admin")) {
                        personnels = personnelFacade.findAllByIdRegion(personnel.getService().getSite().getRegion().getIdRegion());
                        depense = engagementDepenseFacade.findAll().stream().
                                filter(e -> e.getDemandeur().getService().getSite().getRegion().getIdRegion().compareTo(personnel.getService().getSite().getRegion().getIdRegion()) == 0).
                                collect(Collectors.toList());
                    } else if (personnel.getMatricule().equalsIgnoreCase("000000")) {
                        personnels = personnelFacade.findAll();
                        depense = engagementDepenseFacade.findAll();
                    } else if (personnel.getChefService().equals("non") || personnel.getChefService().equalsIgnoreCase("rien")) {
                        personnels = new ArrayList<>();
                        personnels.add(personnel);
                        depense = engagementDepenseFacade.findAllByPersonnelStatut(personnel.getIdPersonnel());

                    }

                    List<Personnel> personnelC = personnelFacade.findRoleByRegion("controleur", personnel.getService().getSite().getRegion().getNomRegion());
                    List<CategorieProduit> natures = categorieProduitFacade.findAll();
                    String isnew = request.getParameter("isnew");
                    request.setAttribute("vue", vue);
                    request.setAttribute("fournisseurs", fournisseurs);
                    request.setAttribute("depenses", depense);
                    request.setAttribute("personnels", personnels);
                    request.setAttribute("natures", natures);
                    request.setAttribute("personnelC", personnelC);
                    request.setAttribute("message", "demande soumise avec success");
                    request.setAttribute("isnew", isnew);
                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                } else {
                    request.setAttribute("message", "demande non enregistrer");
                    request.setAttribute("vue", vue);
                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                }

            } else if (action.equalsIgnoreCase("depenses")) {
                List<Founisseur> fournisseurs = founisseurFacade.findAll();
                List<Personnel> personnels = null;
                //  Login lk = loginFacade.findBypersonnelID(personnel.getIdPersonnel());
                if (personnel.getFonctionSubufo().equalsIgnoreCase("admin") || personnel.getFonctionSubufo().equalsIgnoreCase("oui")) {
                    personnels = personnelFacade.findAllByIdRegion(personnel.getService().getSite().getRegion().getIdRegion());
                    List<EngagementDepense> depense = engagementDepenseFacade.findAll();
                    List<EngagementDepense> depensee = depense.stream()
                            .filter(d -> d.getDemandeur().getService().getSite().getRegion().getIdRegion().compareTo(personnel.getService().getSite().getRegion().getIdRegion()) == 0)
                            .collect(Collectors.toList());
                    request.setAttribute("depenses", depensee);
                } else if (personnel.getChefService().equalsIgnoreCase("oui")) {
                    personnels = personnelFacade.findAllByIdService(personnel.getService().getIdService());
                    List<EngagementDepense> depensee = engagementDepenseFacade.findAll().stream()
                            .filter(d -> d.getDemandeur().getService().getIdService().compareTo(personnel.getService().getIdService()) == 0)
                            .collect(Collectors.toList());
                    request.setAttribute("depenses", depensee);

                } else if (personnel.getMatricule().equals("000000")) {
                    personnels = personnelFacade.findAll();
                    List<EngagementDepense> depense = engagementDepenseFacade.findAll();
                    request.setAttribute("depenses", depense);
                } else if (personnel.getChefService().equals("non") || personnel.getChefService().equalsIgnoreCase("rien")) {
                    personnels = new ArrayList<>();
                    personnels.add(personnel);
                    request.setAttribute("depenses", engagementDepenseFacade.findAllByPersonnelStatut(personnel.getIdPersonnel()));
                }
                try {

                    List<Personnel> personnelC;
                    if (personnel.getService() != null) {
                        personnelC = personnelFacade.findRoleByRegion("controleur", personnel.getService().getSite().getRegion().getNomRegion());
                    } else {
                        personnelC = personnelFacade.findAll().stream().filter(p -> p.getRole().equalsIgnoreCase("controleur"))
                                .collect(Collectors.toList());
                    }
                    request.setAttribute("engagements", donneurOrdreFacade.findAllByValideur(personnel.getIdPersonnel()));
                    request.setAttribute("personnelC", personnelC);
                } catch (Exception e) {
                }

                List<CategorieProduit> natures = categorieProduitFacade.findAll();
                String isnew = request.getParameter("isnew");
                request.setAttribute("natures", natures);
                request.setAttribute("vue", vue);
                request.setAttribute("fournisseurs", fournisseurs);
                request.setAttribute("natures", natures);

                request.setAttribute("personnels", personnels);

                request.setAttribute("isnew", isnew);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("editedepense")) {

                boolean error = creer_demande_engagement(request, false);

                if (!error) {

                    JSONArray object = new JSONArray();
                    object.put("enregistrer avec success");
                    response.setContentType("application/json");
                    response.getWriter().print(object);

                } else {
                    JSONArray object = new JSONArray();
                    object.put("enregistrer non effectué");
                    response.setContentType("application/json");
                    response.getWriter().print(object);
                }

            } else if (action.equalsIgnoreCase("voirdepense")) {
                EngagementDepense depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));
                sendjsondepense(response, depense);

            } else if (action.equalsIgnoreCase("deletedepense")) {
                EngagementDepense depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));
                engagementDepenseFacade.remove(depense);
                if (depense.getMagasin() != 0) {
                    List< CommandeMP> listNonOk = commandeMPFacade.findByIdMPAndEtatIndice(depense.getMagasin(), EtatCommande, 0);
                    listNonOk.stream().forEach((cm) -> {
                        commandeMPFacade.remove(cm);
                    });
                }
                JSONArray object = new JSONArray();
                object.put("demande supprimer avec success");
                response.setContentType("application/json");
                response.getWriter().print(object);

            } else if (action.equalsIgnoreCase("getDemande")) {
                EngagementDepense depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));

                try {
                    sendjsondepense(response, depense);
                } catch (IOException e) {
                    System.err.println("erreur ICI");
                }

            } else if (action.equalsIgnoreCase("impression")) {
                EngagementDepense depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));

                sendjsondepense(response, depense);

            } else if (action.equalsIgnoreCase("etablirOP")) {

                if (request.getParameter("actionOA").equalsIgnoreCase("new")) {
                    OA op = new OA();
                    JSONArray ja = new JSONArray();
                    Map m = new HashMap();
                    op.setIdOA(Integer.parseInt(request.getParameter("idOA")));
                    l.add(remplireOA(request, op));
                    response.setContentType("application/json");
                    m.put("succes", "Operation reusir");
                    ja.put(m);
                    response.getWriter().print(ja);
                } else if (request.getParameter("actionOA").equalsIgnoreCase("editeOA")) {
                    JSONArray ja = new JSONArray();
                    Map m = new HashMap();
                    int id = Integer.parseInt(request.getParameter("idOA"));
                    OA op = new OA();
                    for (OA oa : l) {
                        if (oa.getIdOA() == id) {
                            op = oa;
                            m.put("succes", "Operation reusir");
                            ja.put(m);
                            break;
                        }

                    }
                    l.remove(op);
                    l.add(remplireOA(request, op));
                    response.setContentType("application/json");
                    response.getWriter().print(ja);
                } else if (request.getParameter("actionOA").equalsIgnoreCase("saveOA")) {
                    JSONArray ja = new JSONArray();
                    Map m = new HashMap();
                    boolean CG = false;
                    if (request.getParameter("Controlegestion") != null) {
                        CG = true;
                    }
                    boolean error = false;
                    for (OA op : l) {
                        error = EtablirOA(request, response, op, opp, CG);
                        if (error) {
                            break;
                        }
                    }
                    if (error) {
                        opp.clear();
                        m.put("error", "Operation Avortée");
                        ja.put(m);
                    } else {
                        EngagementDepense depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));
                        depense.setOpList(opp);
                        depense.setRaisonRejet(null);
                        engagementDepenseFacade.edit(depense);
                        opp.clear();
                        if (!CG) {
                            DonneurOrdre donn = donneurOrdreFacade.findByEngagement(depense.getIdEng(), idperso);
                            donn.setJourValidation(date_du_jour.dateJourUniqueDate());
                            donn.setEtat(1);
                            donneurOrdreFacade.edit(donn);

                            DonneurOrdre don = new DonneurOrdre();
                            don.setIdEngagement(depense);
                            don.setJourValidation(date_du_jour.dateJourUniqueDate());
                            don.setValideur(personnelFacade.find(Integer.parseInt(request.getParameter("controleur"))));
                            donneurOrdreFacade.create(don);
                        }

                        m.put("succes", "Operation reusir");
                        ja.put(m);
                    }
                    response.setContentType("application/json");
                    response.getWriter().print(ja);

                } else if (request.getParameter("actionOA").equalsIgnoreCase("annulerOA")) {
                    JSONArray ja = new JSONArray();
                    Map m = new HashMap();
                    l.clear();
                    m.put("succes", "Operation reusir");
                    ja.put(m);

                    response.setContentType("application/json");
                    response.getWriter().print(ja);

                } else {
                    JSONArray ja = new JSONArray();
                    Map m = new HashMap();
                    int id = Integer.parseInt(request.getParameter("idOA"));
                    for (OA oa : l) {
                        if (oa.getIdOA() == id) {
                            l.remove(oa);

                            m.put("succes", "Operation reusir");
                            ja.put(m);

                            break;
                        }

                    }
                    response.setContentType("application/json");
                    response.getWriter().print(ja);
                }

            } else if (action.equalsIgnoreCase("showCentreCout")) {
                List<Butget> bs = butgetFacade.findAllBudgetByCentreCout(Integer.parseInt(request.getParameter("centrecout")));
                JSONArray object = new JSONArray();
                //  JSONArray opj = new JSONArray();

                for (Butget b : bs) {
                    HashMap dat1 = new HashMap();
                    dat1.put("dateAtribution", b.getDateDatribution().getTime());
                    dat1.put("dateExpiration", b.getDateExpiration().getTime());
                    dat1.put("centrecout", b.getMagasin().getLibelle());
                    dat1.put("montant", b.getMontant());
                    dat1.put("montantRestant", b.getMontantRestant());
                    dat1.put("typeBudget", b.getTypeBudget());
                    //dat1.put("rubrique", b.getRubriques());
                    object.put(dat1);
                }

                response.setContentType("application/json");
                response.getWriter().print(object);

            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    //fonction utiles
    OA remplireOA(HttpServletRequest request, OA op) {
        if (request.getParameter("prix_unitaire") != null) {
            op.setPrix(Double.parseDouble(request.getParameter("prix_unitaire")));
        }
        if (request.getParameter("quantite") != null) {
            op.setQuantite(Integer.parseInt(request.getParameter("quantite")));
            op.setMontant(op.getPrix() * op.getQuantite());
        }

        if (request.getParameter("centrecout") != null) {
            op.setCentrecout(request.getParameter("centrecout"));
            op.setLibelle(centrecoutFacade.find(Integer.parseInt(request.getParameter("centrecout"))).getLibelle());
        }
        if (request.getParameter("budget") != null) {
            op.setIdBudget(Integer.parseInt(request.getParameter("budget")));
            op.setTypeBudget(butgetFacade.find(Integer.parseInt(request.getParameter("budget"))).getTypeBudget());
        }
        return op;
    }

    boolean creer_demande_engagement(HttpServletRequest request, boolean is_new) {
        boolean iserror = false;
        EngagementDepense depense;
        if (is_new) {
            depense = new EngagementDepense();
        } else {

            depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));
        }
        Personnel p = personnelFacade.find(Integer.parseInt(request.getParameter("id_demandeur")));

        depense.setDateDemande(date_du_jour.dateJourUniqueDate());
        // depense.setNatureDepense(request.getParameter("nature"));

        if (request.getParameter("date_echeance") != null) {
            depense.setDateEcheance(date_du_jour.dateConvert(request.getParameter("date_echeance")));
        }

        depense.setDemandeur(p);
        depense.setStatut("encour...");

        if (request.getParameter("date_depart") != null) {
            depense.setDateDepart(date_du_jour.dateConvert(request.getParameter("date_depart")));
        }
        if (request.getParameter("date_retour") != null) {
            depense.setDateRetour(date_du_jour.dateConvert(request.getParameter("date_retour")));
        }
        if (request.getParameter("transport") != null) {
            depense.setVehicule(request.getParameter("transport"));
        }
        if (request.getParameter("loger") != null) {
            depense.setLoger(request.getParameter("loger"));
        }

        if (session.getAttribute("lien_telechargement_piece_joint") != null) {
            String name = (String) session.getAttribute("lien_telechargement_piece_joint");
            depense.setPieceJoint(name);
            session.removeAttribute("lien_telechargement_piece_joint");
        }

        if (request.getParameter("fournisseur") != null) {
            // System.out.println("yes" + request.getParameter("fournisseur"));
            depense.setFournisseur(request.getParameter("fournisseur"));
        }
        if (request.getParameter("lieu") != null) {
            depense.setLieu(request.getParameter("lieu"));
        }
        if (request.getParameter("cond_paiment") != null) {
            depense.setCondPaiement(Integer.parseInt(request.getParameter("cond_paiment")));
        }
        if (request.getParameter("cond_transport") != null) {
            depense.setCondTransport(request.getParameter("cond_transport"));
        }
        if (request.getParameter("mode_livraison") != null) {
            depense.setModeLivraison(request.getParameter("mode_livraison"));
        }
        if (request.getParameter("cond_livraison") != null) {
            depense.setCondLivraison(request.getParameter("cond_livraison"));
        }

        if (request.getParameter("nature_demande") != null) {
            depense.setNatureDepense(request.getParameter("nature_demande"));

        }
        if (request.getParameter("prix_unitaire") != null) {
            depense.setPrixUnitaire(Double.parseDouble(request.getParameter("prix_unitaire")));
        }

        if (request.getParameter("quantite") != null) {
            depense.setQuantite(Integer.parseInt(request.getParameter("quantite")));
            depense.setMontantTtc(depense.getPrixUnitaire() * depense.getQuantite());
        } else {
            depense.setQuantite(0);
            depense.setMontantTtc(0);
            depense.setPrixUnitaire(0.0);
        }
        if (request.getParameter("libelle") != null) {
            depense.setLibelle(request.getParameter("libelle"));

        }
        if (request.getParameter("description") != null) {
            depense.setObjetMission(request.getParameter("description"));
        }
        depense.setMagasin(0);
        //depense.setEtablisseurOA(personnelFacade.findRoleByFonctionSubufo("oui", p.getService().getSite().getRegion().getNomRegion()).getIdPersonnel());

        if (!iserror) {
            if (is_new) {

                engagementDepenseFacade.create(depense);
                EngagementDepense ed = engagementDepenseFacade.findLastInsert();
                DonneurOrdre ordre = new DonneurOrdre();
                ordre.setIdEngagement(ed);
                if (p.getChefService().equalsIgnoreCase("oui")) {
                    ordre.setValideur(p);
                } else {
                    List<Personnel> ps = personnelFacade.findAllByIdService(p.getService().getIdService());
                    List<Personnel> pt = ps.stream().filter(pb -> pb.getChefService().equalsIgnoreCase("oui")).collect(Collectors.toList());
                    //Personnel controle = personnelFacade.find(Integer.parseInt(request.getParameter("id_controleur")));
                    ordre.setValideur(pt.get(0));
                }

                ordre.setJourValidation(date_du_jour.dateJourUniqueDate());
                List<DonneurOrdre> l = new ArrayList<>();
                l.add(ordre);
                ed.setDonneurOrdreList(l);
                engagementDepenseFacade.edit(ed);
                //donneurOrdreFacade.create(ordre);

            } else {
                engagementDepenseFacade.edit(depense);

            }

        }
        return iserror;
    }

    boolean EtablirOA(HttpServletRequest request, HttpServletResponse response, OA oa, List<Op> opp, boolean cg) throws IOException {
        boolean iserror = false;
        Op op = new Op();
        EngagementDepense depense = null;
        try {

            depense = engagementDepenseFacade.find(Integer.parseInt(request.getParameter("id_depense")));

            op.setPrix(oa.getPrix());
            op.setQuantite(oa.getQuantite());
            op.setMontant(oa.getMontant());
            op.setImputation(oa.getCentrecout());
            op.setEtablisseur(personnel.getNomPrenom());
            op.setEngagement(depense);
            op.setIdBudget(oa.getIdBudget());
            op.setCentreCout(oa.getLibelle());
            op.setTypeBudget(oa.getTypeBudget());
            /*
        if (depense.getCentreCout() != null) {
            depense.setCentreCout(op.getCentreCout() + "\n" + depense.getCentreCout());
        } else {
            depense.setCentreCout(op.getCentreCout());
        }*/
            depense.setStatut("receptionner");
            opp.add(op);
            if (cg) {
                date_du_jour.DeleteOP(depense.getIdEng());
            }
        } catch (Exception e) {
            iserror = true;
        }
        if (!iserror) {
            opFacade.create(op);
            engagementDepenseFacade.edit(depense);
        }
        return iserror;
    }

    void sendjsondepense(HttpServletResponse response, EngagementDepense depense) throws IOException {
        JSONArray object = new JSONArray();

        HashMap dat = new HashMap();
        JSONArray sign = new JSONArray();
        JSONArray opj = new JSONArray();
        dat.put("id_demande", depense.getIdEng());
        if (depense.getNatureDepense() != null) {
            dat.put("nature_demande", depense.getNatureDepense());
        }

        dat.put("demandeur", depense.getDemandeur().getNomPrenom());
        dat.put("id_demandeur", depense.getDemandeur().getIdPersonnel());
        if (depense.getDateDepart() != null) {

            dat.put("date_depart", new Timestamp(depense.getDateDepart().getTime()).getTime());
        }
        if (depense.getDateDemande() != null) {
            dat.put("date_demande", new Timestamp(depense.getDateDemande().getTime()).getTime());
        }
        if (depense.getDateEcheance() != null) {
            dat.put("date_echeance", new Timestamp(depense.getDateEcheance().getTime()).getTime());
        }
        if (depense.getDateRetour() != null) {
            dat.put("date_retour", new Timestamp(depense.getDateRetour().getTime()).getTime());
        }

        dat.put("fournisseur", depense.getFournisseur());
        dat.put("lieu", depense.getLieu());
        dat.put("code_imputation", depense.getCentreCout());
        dat.put("quantite", depense.getQuantite());
        dat.put("prix_unitaire", depense.getPrixUnitaire());
        dat.put("libelle", depense.getLibelle());
        dat.put("montant", depense.getMontantTtc());
        dat.put("description", depense.getObjetMission());
        dat.put("piece_joint", depense.getPieceJoint());
        dat.put("statut", depense.getStatut());
        dat.put("raison_rejet", depense.getRaisonRejet());
        dat.put("cond_paiment", depense.getCondPaiement());
        dat.put("cond_transport", depense.getCondTransport());
        dat.put("cond_livraison", depense.getCondLivraison());
        dat.put("mode_livraison", depense.getModeLivraison());
        dat.put("vehicule", depense.getVehicule());
        dat.put("loger", depense.getLoger());

        try {
            String valideur = "";
            valideur = donneurOrdreFacade.findByEngagements(depense.getIdEng()).stream().filter(o -> !o.getValideur().getFonctionSubufo().equals("oui")).map((oa) -> oa.getValideur().getNomPrenom() + " , ").reduce(valideur, String::concat);
            dat.put("valideur", valideur);
            donneurOrdreFacade.findByEngagements(depense.getIdEng()).stream().filter(o -> !o.getValideur().getFonctionSubufo().equals("oui") && o.getEtat() == 1)
                    .forEach((oa) -> {
                        HashMap dat1 = new HashMap();
                        dat1.put("nom", oa.getValideur().getNomPrenom());
                        dat1.put("signature", oa.getValideur().getSignature());
                        sign.put(dat1);
                        // dat.put(oa.getValideur().getNomPrenom(), oa.getValideur().getSignature());
                    });
            List<Op> ops = opFacade.findAllByEngagement(depense.getIdEng());
            System.out.println("ICI " + ops);
            if (!ops.isEmpty()) {
                ops.stream().map((op) -> {
                    HashMap dat1 = new HashMap();
                    dat1.put("quantite", op.getQuantite());
                    dat1.put("prix_unitaire", op.getPrix());
                    dat1.put("montant", op.getMontant());
                    dat1.put("centrecout", op.getCentreCout());
                    dat1.put("typebudget", op.getTypeBudget());
                    dat1.put("etablisseur", op.getEtablisseur());
                    return dat1;
                }).forEach((dat1) -> {
                    opj.put(dat1);

                });
                dat.put("op", opj);
            }
        } catch (Exception e) {
            e.getCause();
        }

        dat.put("signature", sign);
        object.put(dat);
        System.out.println(object);
        response.setContentType("application/json");
        response.getWriter().print(object);
    }

    class OA {

        private int idOA;
        private double montant;
        private int quantite;
        private double prix;
        private int idBudget;
        private String centrecout;
        private String typeBudget;
        private String libelle;

        public OA() {

        }

        public int getIdOA() {
            return idOA;
        }

        public void setIdOA(int idOA) {
            this.idOA = idOA;
        }

        public double getMontant() {
            return montant;
        }

        public void setMontant(double montant) {
            this.montant = montant;
        }

        public int getQuantite() {
            return quantite;
        }

        public void setQuantite(int quantite) {
            this.quantite = quantite;
        }

        public double getPrix() {
            return prix;
        }

        public void setPrix(double prix) {
            this.prix = prix;
        }

        public int getIdBudget() {
            return idBudget;
        }

        public void setIdBudget(int idBudget) {
            this.idBudget = idBudget;
        }

        public String getTypeBudget() {
            return typeBudget;
        }

        public void setTypeBudget(String typeBudget) {
            this.typeBudget = typeBudget;
        }

        public String getCentrecout() {
            return centrecout;
        }

        public void setCentrecout(String centrecout) {
            this.centrecout = centrecout;
        }

        public String getLibelle() {
            return libelle;
        }

        public void setLibelle(String libelle) {
            this.libelle = libelle;
        }

    }
}
