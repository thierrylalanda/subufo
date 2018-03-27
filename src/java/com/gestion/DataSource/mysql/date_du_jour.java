package com.gestion.DataSource.mysql;

import com.gciapplication.entity.CategorieproduitMS;
import com.gciapplication.entity.MagasinPrincipal;
import com.gciapplication.entity.MagasinSecondaire;
import com.gciapplication.entity.Responsablevalidation;
import com.gciapplication.entity.StockproduitMS;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class date_du_jour {

    public date_du_jour() {
    }

    public static Timestamp dateJour() {
        Timestamp d = null;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "select now() as dateJ";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                d = rs.getTimestamp("dateJ");
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }

    public static Timestamp caseDateToTimestamp(Date d) {
        Timestamp d1 = new Timestamp(d.getTime());
        return d1;
    }

    public static Date dateJourUniqueDate() {
        Date d = null;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "select DATE(now()) as dateJ";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                d = rs.getDate("dateJ");
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }

    public static int getyear(Date d) {
        int annee = 0;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT YEAR('" + d + "') AS annee";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                annee = rs.getInt("annee");
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return annee;
    }

    public static Date periodeEssai(int mois) {
        Date d = null;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT ADDDATE(DATE(now()), INTERVAL '" + mois + "' MONTH) AS date_interval";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                d = rs.getDate("date_interval");
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }

    public static Timestamp dateConverToStamp(Long date) {
        Timestamp d = null;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT STR_TO_DATE('" + date + "', '%d/%m/%Y') AS date";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                d = rs.getTimestamp("date");
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }

    public static Date dateConverToDateSql(String date) {
        Date d = null;
        Timestamp d1 = null;
        System.out.println(date);
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "STR_TO_DATE('" + date + "', GET_FORMAT(TIMESTAMP,'INTERNAL'))";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                d1 = rs.getTimestamp("datee");
            }
            System.out.println(d1);
            String sqls = "SELECT DATE('" + d1 + "') AS dates";
            ResultSet rss = s.executeQuery(sqls);
            if (rss.next()) {
                d = rss.getDate("dates");
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(d);
        return d;
    }

    public static int ServiceByName(String service) {
        int services = 0;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT Service.id_service as service FROM Service where nom_service = '" + service + "'";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                services = rs.getInt("service");
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return services;
    }

    public static String Time(java.util.Date dd) {
        String d = null;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "select TIME('" + dd + "') as time";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                d = rs.getTime("time").toString();
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }

    public static Date dateConvert(String date) {
        Date d = null;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT STR_TO_DATE('" + date + "', '%d/%m/%Y') AS date";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                d = rs.getDate("date");
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }

    public static String dateConverterToString(String date) {
        String d = null;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT STR_TO_DATE('" + date + "', '%d/%m/%Y') AS date";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                d = rs.getString("date");
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }

    public static void DeleteOrdre(int id) {

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "DELETE FROM ordre_controleur where controleur='" + id + "'";
            s.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public static void DeleteOP(int id) {

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "DELETE FROM OP where engagement='" + id + "'";
            s.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public static void DeleteDonneurOrdre(int idengagement, int idvalideur) {

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "DELETE FROM donneur_ordre WHERE id_engagement = '"+idengagement+"' AND valideur = '"+idvalideur+"'";
            s.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void DeletePermissiond(int idGroupe) {

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "DELETE FROM permissions WHERE groupe ='" + idGroupe + "'";
            s.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static List<MagasinSecondaire> findMSByRegion(String region) {
        List<MagasinSecondaire> list = new ArrayList<>();

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT DISTINCT nom_magasin ,id_magasin,description FROM magasin_secondaire, Region ,affectation_magasinS , personnel ,Service,Site WHERE magasin_secondaire.id_magasin=affectation_magasinS.magasinS\n"
                    + "AND affectation_magasinS.personnel=personnel.id_personnel AND personnel.service=Service.id_service AND Service.site=Site.id_site AND Site.region=Region.id_region \n"
                    + "AND Region.nom_region='" + region + "'";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                MagasinSecondaire ms = new MagasinSecondaire();
                ms.setNomMagasin(rs.getString("nom_magasin"));
                ms.setIdMagasin(rs.getInt("id_magasin"));
                ms.setDescription(rs.getString("description"));
                list.add(ms);
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static List<MagasinPrincipal> findMPByRegion(String region) {
        List<MagasinPrincipal> list = new ArrayList<>();

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT DISTINCT nom_magasin ,id_magasin,description FROM magasin_principal, Region ,affectation_magasinP , personnel ,Service,Site WHERE magasin_principal.id_magasin=affectation_magasinP.magasinP\n"
                    + "AND affectation_magasinP.personnel=personnel.id_personnel AND personnel.service=Service.id_service AND Service.site=Site.id_site AND Site.region=Region.id_region \n"
                    + "AND Region.nom_region='" + region + "'";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                MagasinPrincipal ms = new MagasinPrincipal();
                ms.setNomMagasin(rs.getString("nom_magasin"));
                ms.setIdMagasin(rs.getInt("id_magasin"));
                ms.setDescription(rs.getString("description"));
                list.add(ms);
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static String findRegionByidMS(int idMS) {
        String region = "";

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT DISTINCT nom_region FROM Region, Service,Site,magasin_secondaire,affectation_magasinS,personnel WHERE Region.id_region=Site.region AND Site.id_site=\n"
                    + "Service.site AND Service.id_service=personnel.service AND personnel.id_personnel=affectation_magasinS.personnel AND affectation_magasinS.magasinS='" + idMS + "'";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                region = rs.getString("nom_region");
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return region;
    }

    public static Responsablevalidation getIdResponsableValidation(int id_personnel) {
        Responsablevalidation r = new Responsablevalidation();

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT DISTINCT id_responsable_validation,Niveau FROM personnel,affectation_controleurs,Responsable_validation WHERE Responsable_validation.id_responsable_validation= affectation_controleurs.responsable_validation\n"
                    + "AND affectation_controleurs.personnel=personnel.id_personnel AND personnel.id_personnel='" + id_personnel + "'";
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                r.setIdResponsableValidation(rs.getInt("id_responsable_validation"));
                r.setNiveau(rs.getInt("Niveau"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }

    public static List<StockproduitMS> findStockByidMS(int idMS) {
        List<StockproduitMS> list = new ArrayList<>();

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT  nom_categorie,code_produit,designation,quantite,prix_total,date_livraison,prix_unitaire ,id_stock,id_categorie\n"
                    + " FROM stock_produit_MS,magasin_secondaire,categorie_produit_MS WHERE magasin_secondaire.id_magasin=categorie_produit_MS.magasin_secondaire\n"
                    + "AND categorie_produit_MS.id_categorie= stock_produit_MS.categorie AND magasin_secondaire.id_magasin='" + idMS + "'";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                StockproduitMS ms = new StockproduitMS();
                ms.setCategorie(new CategorieproduitMS(rs.getInt("id_categorie"), rs.getString("nom_categorie")));
                ms.setCodeProduit(rs.getString("code_produit"));
                ms.setDateLivraison(rs.getDate("date_livraison"));
                ms.setDesignation(rs.getString("designation"));
                ms.setIdStock(rs.getInt("id_stock"));
                ms.setPrixTotal(rs.getInt("prix_total"));
                ms.setPrixUnitaire(rs.getInt("prix_unitaire"));
                ms.setQuantite(rs.getInt("quantite"));
                list.add(ms);
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static List<String> findNatureEngagement(String statut) {
        List<String> list = new ArrayList<>();

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT DISTINCT engagement_depense.nature_depense AS nature FROM engagement_depense WHERE engagement_depense.statut = '" + statut + "'";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {

                list.add(rs.getString("nature"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static List<String> findNatureDepense() {
        List<String> list = new ArrayList<>();

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            String sql = "SELECT DISTINCT butget.type_budget AS nature FROM butget";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {

                list.add(rs.getString("nature"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static List<Double> findAllConsommation(Date d1, String statut, String nature) {
        // List<String> nature = date_du_jour.findNatureEngagement();
        double m = 0;
        List<Double> montant = new ArrayList<>();
        for (int i = 1; i < 12; i++) {
            String sql;
            try {
                DataSource ds = DataSource.getInstace();
                Connection c = DataSource.getConnection();
                Statement s = c.createStatement();
                if (statut.equalsIgnoreCase("Achat")) {
                    sql = "SELECT SUM(bordereau.prix_total) AS montant FROM bordereau WHERE YEAR(bordereau.`date`) = YEAR('" + d1 + "') AND MONTH(bordereau.`date`) = '" + i + "'";
                } else {
                    sql = "SELECT SUM(engagement_depense.montant_ttc) AS montant FROM engagement_depense WHERE engagement_depense.statut = '" + statut + "' AND \n"
                            + "YEAR(engagement_depense.date_demande) = YEAR('" + d1 + "') AND MONTH(engagement_depense.date_demande) = '" + i + "' AND engagement_depense.nature_depense = '" + nature + "'";
                }

                ResultSet rs = s.executeQuery(sql);
                if (rs.next()) {

                    montant.add(rs.getDouble("montant"));

                }
            } catch (SQLException ex) {
                Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return montant;
    }

    public static Double findAllConsommationRubrique(Date d1, String statut, String nature, int mois) {
        double m = 0;
        String sql;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            if (mois == 0) {
                if (statut.equalsIgnoreCase("Achat")) {
                    sql = "SELECT SUM(bordereau.prix_total) AS montant FROM bordereau WHERE YEAR(bordereau.`date`) = YEAR('" + d1 + "')";
                } else {
                    sql = "SELECT SUM(engagement_depense.montant_ttc) AS montant FROM engagement_depense WHERE engagement_depense.statut = '" + statut + "' AND \n"
                            + "YEAR(engagement_depense.date_demande) = YEAR('" + d1 + "') AND engagement_depense.nature_depense = '" + nature + "'";
                }
            } else {
                if (statut.equalsIgnoreCase("Achat")) {
                sql = "SELECT SUM(bordereau.prix_total) AS montant FROM bordereau WHERE YEAR(bordereau.`date`) = YEAR('" + d1 + "') AND MONTH(bordereau.`date`) = '" + mois + "'";
            } else {
                sql = "SELECT SUM(engagement_depense.montant_ttc) AS montant FROM engagement_depense WHERE engagement_depense.statut = '" + statut + "' AND \n"
                        + "YEAR(engagement_depense.date_demande) = YEAR('" + d1 + "') AND MONTH(engagement_depense.date_demande) = '" + mois + "' AND engagement_depense.nature_depense = '" + nature + "'";
            }
            }
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {

                m = rs.getDouble("montant");

            }
        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }

        return m;
    }

    public static Double findAllReportingGeneral(Date d1, int mois, String statut) {
        double m = 0;
        double mm = 0;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            if (statut.equalsIgnoreCase("Tous")) {
                statut = "valider";
                String sql1 = "SELECT SUM(bordereau.prix_total) AS montant FROM bordereau WHERE YEAR(bordereau.`date`) = YEAR('" + d1 + "')";
                ResultSet rs = s.executeQuery(sql1);
                if (rs.next()) {
                    mm = rs.getDouble("montant");
                }

                String sql = "SELECT SUM(engagement_depense.montant_ttc) AS montant FROM engagement_depense WHERE engagement_depense.statut = '" + statut + "' AND \n"
                        + "YEAR(engagement_depense.date_demande) = YEAR('" + d1 + "')";
                ResultSet rss = s.executeQuery(sql);
                if (rss.next()) {
                    m = mm + rss.getDouble("montant");
                    System.out.println("somme" + m);
                }

            } else if (statut.equalsIgnoreCase("AllBudget")) {
                String sql1 = "SELECT SUM(butget.montant) AS montant FROM butget WHERE YEAR(butget.date_datribution) = YEAR('" + d1 + "')";
                ResultSet rs = s.executeQuery(sql1);
                if (rs.next()) {
                    m = rs.getDouble("montant");
                }
            } else {

                String sql = "SELECT SUM(bordereau.prix_total) AS montant FROM bordereau WHERE YEAR(bordereau.`date`) = YEAR('" + d1 + "') AND MONTH(bordereau.`date`) = '" + mois + "'";
                ResultSet rs = s.executeQuery(sql);
                if (rs.next()) {
                    mm = rs.getDouble("montant");
                }

                String sql1 = "SELECT SUM(engagement_depense.montant_ttc) AS montant FROM engagement_depense WHERE engagement_depense.statut = '" + statut + "' AND \n"
                        + "YEAR(engagement_depense.date_demande) = YEAR('" + d1 + "') AND MONTH(engagement_depense.date_demande) = '" + mois + "'";
                ResultSet rss = s.executeQuery(sql1);
                if (rss.next()) {
                    m = mm + rss.getDouble("montant");
                    System.out.println("somme2" + m);
                }

            }

        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }

    public static Map<String, Double> findAllDesignationBordereau(Date d1, Date d2) {
        // List<String> nature = date_du_jour.findNatureEngagement();
        double m = 0;
        Map<String, Double> montant = new HashMap<>();
        List<String> list = new ArrayList<>();
        String sql;
        String sql1;

        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            sql1 = "SELECT distinct bordereau.designation AS designation FROM bordereau";
            ResultSet rss = s.executeQuery(sql1);
            while (rss.next()) {

                list.add(rss.getString("designation"));
            }
            for (String string : list) {
                sql = "SELECT SUM(bordereau.prix_total) AS montant FROM bordereau WHERE bordereau.designation = '" + string + "' AND\n"
                        + "bordereau.`date` BETWEEN '" + d1 + "' AND '" + d2 + "'";

                ResultSet rs = s.executeQuery(sql);
                if (rs.next()) {

                    montant.put(string, rs.getDouble("montant"));

                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }

        return montant;
    }
}
