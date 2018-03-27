/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package color;

import com.gciapplication.entity.Readdata;
import com.gciapplication.session.entity.ReaddataFacadeLocal;
import com.gestion.DataSource.mysql.date_du_jour;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.ejb.EJB;

/**
 *
 * @author Administrateur
 */
@WebServlet(name = "Security", urlPatterns = {"/security"})
public class Security extends HttpServlet {

    @EJB
    private ReaddataFacadeLocal readdataFacade;

    private final String activation = "12345";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "premierefois":
                if (isfirsttime()) {
                    response.setContentType("application/text");
                    response.getWriter().print("oui");
                } else {
                    response.setContentType("application/text");
                    response.getWriter().print("non");
                }
                break;
            case "have_complet_version":
                if (isVersionComplet()) {
                    response.setContentType("application/text");
                    response.getWriter().print("oui");
                } else {
                    response.setContentType("application/text");
                    response.getWriter().print("non");
                }
                break;
            case "verifie_essai":
                if (EssaiTerminer()) {
                    response.setContentType("application/text");
                    response.getWriter().print("oui");
                } else {
                    response.setContentType("application/text");
                    response.getWriter().print("non");
                }
                break;
            case "essai":
                String code_essai = request.getParameter("code");
                if (giveEssai(code_essai)) {
                    response.setContentType("application/text");
                    response.getWriter().print("ok");
                } else {
                    response.setContentType("application/text");
                    response.getWriter().print("erreur");
                }
                break;
            case "completVersion":
                String code1 = request.getParameter("code1");

                if (VersionComplet(code1)) {

                    response.setContentType("application/text");
                    response.getWriter().print("yes");
                } else {
                    response.setContentType("application/text");
                    response.getWriter().print("no");
                }
                break;
            default:
                break;
        }

    }

    boolean giveEssai(String code) {
        boolean content = false;
        Readdata r = readdataFacade.findOne();
        switch (code) {
            case "ess@ye00_mois":
                r.setDemoperiode(date_du_jour.periodeEssai(0));
                r.setInstallationDate(date_du_jour.dateJourUniqueDate());
                r.setMonthdemo(0);
                r.setIsfirsttime(0);
                r.setIsdemoversion(1);
                readdataFacade.edit(r);
                content = true;
                break;
            case "ess@ye01_mois":
                r.setDemoperiode(date_du_jour.periodeEssai(1));
                r.setInstallationDate(date_du_jour.dateJourUniqueDate());
                r.setMonthdemo(1);
                r.setIsfirsttime(0);
                r.setIsdemoversion(1);
                readdataFacade.edit(r);
                content = true;
                break;
            case "ess@ye0002@mois":
                r.setDemoperiode(date_du_jour.periodeEssai(2));
                r.setInstallationDate(date_du_jour.dateJourUniqueDate());
                r.setMonthdemo(2);
                r.setIsfirsttime(0);
                r.setIsdemoversion(1);
                readdataFacade.edit(r);
                content = true;
                break;
            case "ess@ye003@mois":
                r.setDemoperiode(date_du_jour.periodeEssai(3));
                r.setInstallationDate(date_du_jour.dateJourUniqueDate());
                r.setMonthdemo(3);
                r.setIsfirsttime(0);
                r.setIsdemoversion(1);
                readdataFacade.edit(r);
                content = true;
                break;
            case "ess@ye00@4!mois":
                r.setDemoperiode(date_du_jour.periodeEssai(4));
                r.setInstallationDate(date_du_jour.dateJourUniqueDate());
                r.setMonthdemo(4);
                r.setIsfirsttime(0);
                r.setIsdemoversion(1);
                readdataFacade.edit(r);
                content = true;
                break;
            case "ess@ye010@5!!mois":
                r.setDemoperiode(date_du_jour.periodeEssai(5));
                r.setInstallationDate(date_du_jour.dateJourUniqueDate());
                r.setMonthdemo(5);
                r.setIsfirsttime(0);
                r.setIsdemoversion(1);
                readdataFacade.edit(r);
                content = true;
                break;
            case "ess@ye0!60@6!!mois":
                r.setDemoperiode(date_du_jour.periodeEssai(6));
                r.setInstallationDate(date_du_jour.dateJourUniqueDate());
                r.setMonthdemo(6);
                r.setIsfirsttime(0);
                r.setIsdemoversion(1);
                readdataFacade.edit(r);
                content = true;
                break;
            default:
                break;

        }
        return content;
    }

    boolean isfirsttime() {
        return readdataFacade.Isfisthtime();
    }

    boolean EssaiTerminer() {
        boolean end = readdataFacade.demoperiodeisfinith();
        Readdata r = readdataFacade.findOne();
        if (end) {
            r.setDemoperiodeisfirst(0);
            r.setIsdemoversion(0);
            readdataFacade.edit(r);
        } else {
            r.setIsdemoversion(1);
            readdataFacade.edit(r);
        }
        return end;
    }

    boolean VersionComplet(String pas1) {
        boolean end = activation.equals(pas1);
        if (end) {
            Readdata r = readdataFacade.findOne();
            r.setIscompletversion(1);
            r.setIsdemoversion(0);
            r.setIsfirsttime(0);
            r.setInstallationDate(date_du_jour.dateJourUniqueDate());
            readdataFacade.edit(r);
        }
        return end;

    }

    boolean isVersionComplet() {
        return readdataFacade.IsCompletVersion();
    }
}
