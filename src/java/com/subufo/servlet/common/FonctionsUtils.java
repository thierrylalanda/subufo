/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.servlet.common;

import com.gestion.DataSource.mysql.DataSource;
import com.gestion.DataSource.mysql.date_du_jour;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author messi
 */
public class FonctionsUtils {

    public FonctionsUtils() {
    }

    public static Object findByCriteres(int id, Date d1, int mois, String nature, String qui) {
        Map<String, Double> map = new HashMap<>();
        double somme1 = 0;
        double somme2 = 0;
        String sql;
        String sql1;
        String sql2;
        String sql3;
        try {
            DataSource ds = DataSource.getInstace();
            Connection c = DataSource.getConnection();
            Statement s = c.createStatement();
            sql2 = "SELECT SUM(butget.montant) AS montant FROM butget WHERE YEAR(butget.date_datribution) = YEAR('" + d1 + "')";
            switch (qui) {
                case "societe":
                    String statut = "valider";
                    if (mois != 0) {
                        sql = "SELECT SUM(bordereau.prix_total) AS montant FROM bordereau WHERE YEAR(bordereau.`date`) = YEAR('" + d1 + "') AND MONTH(bordereau.`date`) = '" + mois + "'";
                        sql1 = "SELECT SUM(engagement_depense.montant_ttc) AS montant FROM engagement_depense WHERE engagement_depense.statut = '" + statut + "' AND \n"
                                + "YEAR(engagement_depense.date_demande) = YEAR('" + d1 + "') AND MONTH(engagement_depense.date_demande) = '" + mois + "'";
                    } else {

                        sql = "SELECT SUM(bordereau.prix_total) AS montant FROM bordereau WHERE YEAR(bordereau.`date`) = YEAR('" + d1 + "')";
                        sql1 = "SELECT SUM(engagement_depense.montant_ttc) AS montant FROM engagement_depense WHERE engagement_depense.statut = '" + statut + "' AND \n"
                                + "YEAR(engagement_depense.date_demande) = YEAR('" + d1 + "')";

                    }
                    ResultSet rs = s.executeQuery(sql);
                    if (rs.next()) {
                        somme1 = rs.getDouble("montant");
                    }
                    ResultSet rss = s.executeQuery(sql1);
                    if (rs.next()) {
                        somme1 += rss.getDouble("montant");
                    }
                    ResultSet r = s.executeQuery(sql2);
                    if (r.next()) {
                        somme2 = r.getDouble("montant");
                    }
                    map.put("Budget", somme2);
                    map.put("consommation", somme1);
                    break;
                case "region":

                    break;
            }

        } catch (SQLException ex) {
            Logger.getLogger(date_du_jour.class.getName()).log(Level.SEVERE, null, ex);
        }
        return somme1;
    }
}
