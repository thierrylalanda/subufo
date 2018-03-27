package com.gciapplication.servlet.controleurs.magasinP;

import com.gciapplication.SendMessage.EnvoiEmail;
import com.gciapplication.entity.Article;
import com.gciapplication.entity.CategorieproduitMP;
import com.gciapplication.entity.CommandeMP;
import com.gciapplication.entity.Founisseur;
import com.gciapplication.entity.MagasinPrincipal;
import com.gciapplication.entity.MagasinSecondaire;
import com.gciapplication.entity.Notification;
import com.gciapplication.entity.Personnel;
import com.gciapplication.entity.StockproduitMP;
import com.gciapplication.entity.TransfertStock;
import com.gciapplication.entity.VisaChef;
import com.gciapplication.session.entity.ArticleFacadeLocal;
import com.gciapplication.session.entity.CategorieproduitMPFacadeLocal;
import com.gciapplication.session.entity.CommandeMPFacadeLocal;
import com.gciapplication.session.entity.FounisseurFacadeLocal;
import com.gciapplication.session.entity.MagasinPrincipalFacadeLocal;
import com.gciapplication.session.entity.MagasinSecondaireFacadeLocal;
import com.gciapplication.session.entity.NotificationFacadeLocal;
import com.gciapplication.session.entity.OrdreControleurFacadeLocal;
import com.gciapplication.session.entity.PersonnelFacadeLocal;
import com.gciapplication.session.entity.StockproduitMPFacadeLocal;
import com.gciapplication.session.entity.TransfertStockFacadeLocal;
import com.gciapplication.session.entity.VisaChefFacadeLocal;
import com.gestion.DataSource.mysql.Message;
import com.gestion.DataSource.mysql.date_du_jour;
import com.subufo.entity.DonneurOrdre;
import com.subufo.entity.EngagementDepense;
import com.subufo.session.entity.DonneurOrdreFacadeLocal;
import com.subufo.session.entity.EngagementDepenseFacadeLocal;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author messi
 */
@WebServlet(name = "passerCommande", urlPatterns = {"/passerCommande"})
public class passerCommande extends HttpServlet {

    @EJB
    private CategorieproduitMPFacadeLocal categorieproduitMPFacade;

    @EJB
    private ArticleFacadeLocal articleFacade;

    @EJB
    private MagasinSecondaireFacadeLocal magasinSecondaireFacade;

    @EJB
    private VisaChefFacadeLocal visaChefFacade;

    @EJB
    private EnvoiEmail envoiEmail;

    @EJB
    private TransfertStockFacadeLocal transfertStockFacade;

    @EJB
    private NotificationFacadeLocal notificationFacade;

    @EJB
    private PersonnelFacadeLocal personnelFacade;

    @EJB
    private MagasinPrincipalFacadeLocal magasinPrincipalFacade;

    @EJB
    private CommandeMPFacadeLocal commandeMPFacade;

    @EJB
    private FounisseurFacadeLocal founisseurFacade;

    @EJB
    private StockproduitMPFacadeLocal stockproduitMPFacade;

    @EJB
    private DonneurOrdreFacadeLocal donneurOrdreFacade;

    @EJB
    private EngagementDepenseFacadeLocal engagementDepenseFacade;

    List< CommandeMP> list = new ArrayList<>();
    List< CommandeMP> liste = new ArrayList<>();

    private final String EtatCommande = "Encour de Traitement";
    private final String role = "controleur";

    List<CategorieproduitMP> categorie;
    List<Founisseur> founisseur;
    List<Personnel> valideur = new ArrayList<>();

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

            int idMP;
            String redirect;
            if (session.getAttribute("id_magasinP") == null) {
                idMP = Integer.parseInt(request.getParameter("id_magasinP"));
                session.setAttribute("id_magasinP", idMP);

            } else {
                idMP = (int) session.getAttribute("id_magasinP");
            }

            int niveau = 0;

            if (request.getParameter("niveau") != null) {
                niveau = Integer.parseInt(request.getParameter("niveau"));
                session.setAttribute("niveau", niveau);
            }
            if (niveau == 5 || (int) session.getAttribute("niveau") == 5) {
                founisseur = founisseurFacade.findAll();
                session.setAttribute("founisseurs", founisseur);

                MagasinPrincipal principal = magasinPrincipalFacade.find(idMP);
                request.setAttribute("magasin", principal);
                session.setAttribute("categorieMP", principal.getCategorieproduitMPList());

                valideur = personnelFacade.findRoleByRegion(role, magasinPrincipalFacade.find(idMP).getSite().getRegion().getNomRegion());
                request.setAttribute("valideur", valideur);

                redirect = "/WEB-INF/administrateur/main1.jsp";

                request.setAttribute("vues", "Commande");

            } else {
                Personnel p = (Personnel) session.getAttribute("personnel");
                valideur = personnelFacade.findRoleByRegion(role, p.getService().getSite().getRegion().getNomRegion());
                request.setAttribute("valideur", valideur);
                request.setAttribute("edit", "ok");
                redirect = "/WEB-INF/magasignierP/main.jsp";

            }

            Personnel p = (Personnel) session.getAttribute("personnel");
            request.setAttribute("nom_client", p.getNomPrenom());
            String action = request.getParameter("action");
            String vue = request.getParameter("vue");

            //pour creer une commande du MP
            if (action.equalsIgnoreCase("init")) {
                founisseur = founisseurFacade.findAll();
                MagasinPrincipal mp = magasinPrincipalFacade.find(idMP);
                categorie = mp.getCategorieproduitMPList();
                if (p.getService() != null) {
                    List<MagasinSecondaire> mses = magasinSecondaireFacade.findByRegion(p.getService().getSite().getRegion().getNomRegion());
                    request.setAttribute("magasinRegion", mses);
                }
                AllCommande(request, idMP);
                request.setAttribute("active", "OK");
                request.setAttribute("commander", "OK");
                request.setAttribute("vue", vue);
                session.setAttribute("categorie", categorie);

                request.setAttribute("founisseurs", founisseur);

                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("codeAutomatique")) {
                String designation = request.getParameter("designation");

                StockproduitMP mS = stockproduitMPFacade.findByDesignationByidMP(idMP, designation);
                String code = mS.getCodeProduit();

                response.setContentType("application/text");
                response.getWriter().print(code);

            } else if (action.equalsIgnoreCase("ImprimerCommandeMP")) {

                JSONArray ar = new JSONArray();
                JSONArray arr = new JSONArray();
                JSONObject object = new JSONObject();

                if (!commandeMPFacade.findByRecenDate(idMP).isEmpty()) {
                    List<CommandeMP> l = commandeMPFacade.findByRecenDate(idMP);
                    CommandeMP cm = l.get(0);
                    for (VisaChef oc : visaChefFacade.findVisaByIdCommande(cm.getIdCommande())) {
                        ar.add(oc.getControleur().getNomPrenom());
                    }
                    arr.add(cm.getIdSA().getNomFounisseur());
                    arr.add(cm.getIdMP().getNomMagasin());
                }

                object.put("operateur", arr);
                object.put("control", ar);
                //String nsg = "Bon De Commande " + ocs.get(0).getIdMP().getNomMagasin();
                //ar.add(nsg);
                String per = object.toJSONString();
                System.out.println(per);
                response.setContentType("application/json");
                try {
                    response.getWriter().print(per);
                } catch (IOException ex) {
                    System.out.println(ex.getMessage());
                }

            } else if (action.equalsIgnoreCase("create")) {

                int idcategorie = Integer.parseInt(request.getParameter("categorie"));
                // String code = request.getParameter("code");
                int idarticle = Integer.parseInt(request.getParameter("designation"));
                int quantite = Integer.parseInt(request.getParameter("quantite"));
                // int prix = Integer.parseInt(request.getParameter("pu"));

                Article a = articleFacade.find(idarticle);
                CategorieproduitMP catms = categorieproduitMPFacade.find(idcategorie);

                boolean repete = false, errorCode = false, existe = false;
                boolean get = false;
                StockproduitMP stock = new StockproduitMP();
                try {
                    stock = stockproduitMPFacade.findByDesignationByidMP(idMP, a.getDesignation());
                } catch (Exception e) {
                    get = true;
                }

                if (!get) {
                    String name = "";
                    if (!list.isEmpty()) {
                        for (CommandeMP commandeMP : list) {
                            if (commandeMP.getCodeProduit().equalsIgnoreCase(stock.getCodeProduit())) {
                                repete = true;
                                name = stock.getDesignation();
                                break;
                            }
                        }
                    }
                    if (!repete) {

                        String fournisseur = request.getParameter("fournisseur");

                        //je recherche le Fournisseur 
                        Founisseur founisseurs = founisseurFacade.findByNAME(fournisseur);
                        CommandeMP cms = new CommandeMP();

                        //cms.setIdCommande((int) (Math.random() * (10000000)));
                        cms.setIdMP(new MagasinPrincipal(idMP));
                        cms.setIdSA(founisseurs);
                        cms.setDate(date_du_jour.dateJour());
                        cms.setQuantiteCommande(quantite);
                        cms.setTypeProduit(stock.getCategorie().getNomCategorie());
                        cms.setDesignation(stock.getDesignation());
                        cms.setCodeProduit(stock.getCodeProduit());
                        cms.setQuantiteEnStock(stock.getQuantite());
                        cms.setPrixUnitaire(stock.getPrixUnitaire());
                        cms.setPrixTotal(cms.getQuantiteCommande() * cms.getPrixUnitaire());
                        cms.setDerniereLivraison(stock.getDateLivraison());
                        cms.setEtat(EtatCommande);

                        list.add(cms);

                        request.setAttribute("commander", "OK");
                        request.setAttribute("founis", fournisseur);
                        request.setAttribute("valideur", valideur);
                        request.setAttribute("founisseurs", founisseur);
                        request.setAttribute("categories", categorie);
                        request.setAttribute("vue", vue);
                        request.setAttribute("list", list);
                        request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                    } else {

                        Message message = new Message("Une Erreur est survenue Vous essayez de commander deux fois un même Article : " + name);
                        request.setAttribute("message", message);
                        request.setAttribute("commander", "OK");
                        request.setAttribute("founisseurs", founisseur);
                        request.setAttribute("valideur", valideur);
                        request.setAttribute("list", list);
                        request.setAttribute("vue", vue);
                        request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                    }
                } else {
                    Message message = new Message("Une Erreur est survenue le Magasin: " + magasinPrincipalFacade.find(idMP).getNomMagasin() + " ne Possède pas cet Article");
                    request.setAttribute("message", message);
                    request.setAttribute("commander", "OK");
                    request.setAttribute("founisseurs", founisseur);
                    request.setAttribute("valideur", valideur);
                    request.setAttribute("categories", categorie);
                    request.setAttribute("vue", vue);

                    request.setAttribute("list", list);
                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                }
            } else if (action.equalsIgnoreCase("save")) {
                if (!list.isEmpty()) {

                    //String[] responsable = request.getParameterValues("responsable");
                    int ins = 0;
                    double montant = 0;
                    // String libelle = "";
                    List< CommandeMP> listCMP = commandeMPFacade.findByIdMPAndEtat(idMP, EtatCommande);

                    List< CommandeMP> listCMSR = new ArrayList<>();

                    listCMSR.removeAll(listCMSR);
                    for (int i = 0; i < listCMP.size(); i++) {
                        CommandeMP gett = listCMP.get(i);
                        for (int j = 0; j < list.size(); j++) {
                            if (gett.getCodeProduit().equalsIgnoreCase(list.get(j).getCodeProduit())) {
                                listCMSR.add(list.get(j));
                                ins = 1;
                                break;
                            }
                        }

                    }
                    if (!listCMSR.isEmpty()) {
                        listCMSR.stream().forEach((integer) -> {
                            list.remove(integer);
                        });

                    }
                    //enregistrement de la commande dans la BD
                    if (!list.isEmpty()) {
                        for (int i = 0; i < list.size(); i++) {
                            CommandeMP get = list.get(i);
                            get.setIndice(0);
                            get.setLivraison("encour");
                            montant += get.getPrixTotal();
                            commandeMPFacade.create(get);
                        }

                        // Personnel p1 = personnelFacade.findRoleByFonctionSubufo("oui", p.getService().getSite().getRegion().getNomRegion());
                        CommandeMP cmp = commandeMPFacade.find(list.get(0).getIdCommande());
                        EngagementDepense depense = new EngagementDepense();
                        depense.setDateDemande(cmp.getDate());
                        depense.setDemandeur(cmp.getIdMP().getAffectationmagasinPList().get(0).getPersonnel());
                        depense.setFournisseur(cmp.getIdSA().getNomFounisseur());
                        depense.setLibelle("Demande pour ordre d'achat des produits stockés");
                        depense.setMagasin(cmp.getIdMP().getIdMagasin());
                        depense.setQuantite(1);
                        depense.setMontantTtc(montant);
                        depense.setPrixUnitaire(montant);
                        depense.setStatut("encour...");
                        //depense.setEtablisseurOA(p1.getIdPersonnel());
                        depense.setMagasin(cmp.getIdMP().getIdMagasin());
                        depense.setObjetMission("le " + cmp.getIdMP().getNomMagasin() + " est en rupture de certains produits et demande un Ordre d'achat pour ces produits\n ci-joint la commande");
                        depense.setCondPaiement(30);
                        depense.setModeLivraison("Transport routier");
                        depense.setCondTransport("XXXXXX");
                        depense.setCondLivraison("Rendu Droits acquittés");
                        engagementDepenseFacade.create(depense);

                        EngagementDepense ed = engagementDepenseFacade.findLastInsert();

                        DonneurOrdre ordre = new DonneurOrdre();
                        ordre.setIdEngagement(ed);
                        if (p.getChefService().equalsIgnoreCase("oui")) {
                            ordre.setValideur(p);
                        } else {
                            List<Personnel> ps = personnelFacade.findAllByIdService(p.getService().getIdService());
                            List<Personnel> pt = ps.stream().filter(pb -> pb.getChefService().equalsIgnoreCase("oui")).collect(Collectors.toList());
                            ordre.setValideur(pt.get(0));

                            Notification n = new Notification();
                            n.setMessage("Vous Avez Reçus Des Commandes A Validés de la part du Magasin : " + magasinPrincipalFacade.find(idMP).getNomMagasin() + " \nle " + new Date().toLocaleString() + " \nMerci de bien Vouloir les Traités");
                            n.setRecepteur(pt.get(0).getIdPersonnel());
                            n.setVue(0);
                            n.setDate(date_du_jour.dateJour());
                            notificationFacade.create(n);
                        }

                        ordre.setJourValidation(date_du_jour.dateJourUniqueDate());
                        List<DonneurOrdre> l = new ArrayList<>();
                        l.add(ordre);
                        ed.setDonneurOrdreList(l);
                        engagementDepenseFacade.edit(ed);

                        /*
                                try {
                                    envoiEmail.EnvoiEmail(controleur.getEmail(), "Commandes à Traités", n.getMessage());
                                } catch (MessagingException ex) {
                                    Logger.getLogger(ValiderCommande.class.getName()).log(Level.SEVERE, null, ex);
                                }
                                  //J'envoi un SMS Au Magasin Secondaire pour le prevenir de la commande qui viens d'etre passer
                                try {
                                    SendSMS.SendSMS(n.getMessage(), controleur.getTelephone());
                                } catch (Exception e) {
                                    System.err.println("une Erreur est suvenue pour l'envoi du SMS " + e.getMessage());
                                }

                               
                                    String mail = controleur.getEmail();
                                    String message = "Vous avez reçus une commande de la part du Magasin : " + magasinPrincipalFacade.find(idMP).getNomMagasin() + " \n le " + new Date().toLocaleString() + " \n"
                                            + " Merci de bien Vouloir vous connecter a l'application GIC la Traiter";
                                try {
                                    EnvoiEmail.sendMail(mail, "GIC Alerte Commande", message);
                                } catch (MessagingException ex) {
                                    Logger.getLogger(passerCommande.class.getName()).log(Level.SEVERE, null, ex);
                                }
                         */

                        list.removeAll(list);
                    }

                    if (ins == 1) {
                        Message message = new Message("certains Articles n'ont pas été Enregistré car ils ont encore une instance de commande en cour... ");
                        request.setAttribute("message", message);
                        request.setAttribute("list", listCMSR);

                    } else {
                        Message message = new Message("Votre Commande à bien été Enregistrer");

                        request.setAttribute("message", message);
                    }
                    //AllCommande(request, idMP);
                    request.setAttribute("commander", "OK");
                    request.setAttribute("founisseurs", founisseur);
                    request.setAttribute("valideur", valideur);
                    request.setAttribute("categories", categorie);
                    request.setAttribute("vue", vue);
                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

                } else {
                    request.setAttribute("vue", vue);
                    request.setAttribute("commander", "OK");
                    Message message = new Message("Une Erreur est survenue vous n'avez passer Aucune Commande!!!!!!!!");
                    request.setAttribute("message", message);
                    // request.setAttribute("valideur", valideur);
                    request.setAttribute("founisseurs", founisseur);
                    request.setAttribute("categories", categorie);
                    request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
                }
            } else if (action.equalsIgnoreCase("delete")) {
                String cod = request.getParameter("code");
                for (int i = 0; i < list.size(); i++) {
                    CommandeMP s = list.get(i);
                    if (s.getCodeProduit().equalsIgnoreCase(cod)) {
                        list.remove(i);
                        break;
                    }
                }

                request.setAttribute("commander", "OK");
                request.setAttribute("refrech", "actualise");
                request.setAttribute("valideur", valideur);
                request.setAttribute("founisseurs", founisseur);
                request.setAttribute("categories", categorie);
                request.setAttribute("list", list);
                request.setAttribute("editt", "ok");
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("update")) {
                String codes = request.getParameter("code");
                int somm = Integer.parseInt(request.getParameter("qte"));

                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i).getCodeProduit().equalsIgnoreCase(codes)) {
                        list.get(i).setQuantiteCommande(somm);
                        list.get(i).setPrixTotal(list.get(i).getPrixUnitaire() * list.get(i).getQuantiteCommande());

                        break;

                    }

                }
                response.setContentType("application/text");
                response.getWriter().print(String.valueOf(somm));

            } else if (action.equalsIgnoreCase("consulterCommandeMP")) {

                AllCommande(request, idMP);

                request.setAttribute("AllcommandesMP", "OK");
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("consulterCommandeMP_OK")) {

                AllCommande(request, idMP);

                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);

            } else if (action.equalsIgnoreCase("deleteCommamdeNonOk")) {
                String code = request.getParameter("code");
                List<CommandeMP> listes = commandeMPFacade.findByRecenDate(idMP);
                for (CommandeMP liste1 : listes) {
                    if (liste1.getCodeProduit().equalsIgnoreCase(code)) {
                        commandeMPFacade.remove(liste1);
                        break;
                    }
                }
                request.setAttribute("commandeOK", "OK");
                request.setAttribute("vue", vue);
                request.getServletContext().getRequestDispatcher(redirect).forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    protected void AllCommande(HttpServletRequest request, int idMP) {
        List<TransfertStock> transferts = transfertStockFacade.findByEtatByidMP("rejeter", idMP);

        if (transferts.isEmpty()) {
            Message message4 = new Message("Aucun Transfert en Cour Pour le Moment");
            request.setAttribute("message", message4);

        } else {
            request.setAttribute("fournisseur", transferts.get(0).getMp().getNomMagasin());
            request.setAttribute("num", transferts.get(0).getIdTransfert());
            request.setAttribute("transfert", transferts);

        }

        List<CommandeMP> listesOK = commandeMPFacade.findByRecenDate(idMP);
        if (!listesOK.isEmpty()) {
            request.setAttribute("listesOK", listesOK);
            request.setAttribute("listes", listesOK);

        } else {
            Message message1 = new Message("Aucune Commande Pour l'instant");
            request.setAttribute("message", message1);
        }

        List< CommandeMP> listNonOk = commandeMPFacade.findByIdMPAndEtatIndice(idMP, EtatCommande, 0);

        if (!listNonOk.isEmpty()) {

            request.setAttribute("listNonOk", listNonOk);
           
        } else {
            Message message2 = new Message("Aucune commande pour le moment!!!");
            request.setAttribute("message", message2);
           
        }

        List<CommandeMP> listess = commandeMPFacade.findByRecenDate(idMP);

        if (listess.isEmpty()) {
            Message message = new Message("Aucune Commande Pour l'instant");
            request.setAttribute("message", message);
            listess.clear();
        }else{
             request.setAttribute("listes", listess);
        }

      //  request.setAttribute("commandeOK", "OK");
    }
}
