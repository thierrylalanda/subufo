/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.entity;

import com.gciapplication.entity.Personnel;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author messi
 */
@Entity
@Table(name = "engagement_depense")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EngagementDepense.findAll", query = "SELECT e FROM EngagementDepense e GROUP BY e.dateDemande"),
    @NamedQuery(name = "EngagementDepense.findByIdEng", query = "SELECT e FROM EngagementDepense e WHERE e.idEng = :idEng"),
    @NamedQuery(name = "EngagementDepense.findByDemandeur", query = "SELECT e FROM EngagementDepense e WHERE e.demandeur.idPersonnel = :demandeur"),
    @NamedQuery(name = "EngagementDepense.findByNatureDepense", query = "SELECT e FROM EngagementDepense e WHERE e.natureDepense = :natureDepense"),
    @NamedQuery(name = "EngagementDepense.findByMontantTtc", query = "SELECT e FROM EngagementDepense e WHERE e.montantTtc = :montantTtc"),
    @NamedQuery(name = "EngagementDepense.findByFournisseur", query = "SELECT e FROM EngagementDepense e WHERE e.fournisseur = :fournisseur"),
    @NamedQuery(name = "EngagementDepense.findByDateDemande", query = "SELECT e FROM EngagementDepense e WHERE e.dateDemande = :dateDemande"),
    @NamedQuery(name = "EngagementDepense.findByMonth", query = "SELECT e FROM EngagementDepense e WHERE e.dateDemande = :dateDemande AND e.statut = :statut"),
    @NamedQuery(name = "EngagementDepense.findByPeriodeDateDemande", query = "SELECT e FROM EngagementDepense e WHERE e.dateDemande BETWEEN :date1 AND :date2 AND e.statut = :statut"),
    @NamedQuery(name = "EngagementDepense.findByPeriodeDateDemandeTous", query = "SELECT e FROM EngagementDepense e WHERE e.dateDemande BETWEEN :date1 AND :date2"),
    @NamedQuery(name = "EngagementDepense.findReportinByRegion", query = "SELECT e FROM EngagementDepense e WHERE e.dateDemande BETWEEN :d1 AND :d2 AND e.natureDepense = :rubrique AND e.demandeur.service.site.region.idRegion = :region AND e.statut = :statut"),
    @NamedQuery(name = "EngagementDepense.findReportinByDirection", query = "SELECT e FROM EngagementDepense e WHERE e.dateDemande BETWEEN :d1 AND :d2 AND e.natureDepense = :rubrique AND e.demandeur.service.direction.idDirection = :direction AND e.statut = :statut"),
    @NamedQuery(name = "EngagementDepense.findReportingByService", query = "SELECT e FROM EngagementDepense e WHERE e.dateDemande BETWEEN :d1 AND :d2 AND e.natureDepense = :rubrique AND e.demandeur.service.idService = :service AND e.statut = :statut"),
    @NamedQuery(name = "EngagementDepense.findReportingByPersonnel", query = "SELECT e FROM EngagementDepense e WHERE e.dateDemande BETWEEN :d1 AND :d2 AND e.natureDepense = :rubrique AND e.demandeur.idPersonnel = :personnel AND e.statut = :statut"),
    @NamedQuery(name = "EngagementDepense.findByReportingByCentreCout", query = "SELECT e FROM EngagementDepense e WHERE e.dateDemande BETWEEN :d1 AND :d2 AND e.natureDepense = :rubrique AND e.centreCout = :centre AND e.statut = :statut"),
    @NamedQuery(name = "EngagementDepense.findReportinByAll", query = "SELECT e FROM EngagementDepense e WHERE e.demandeur.service.site.region.idRegion = :region AND e.statut = :statut"),
    @NamedQuery(name = "EngagementDepense.findByDateDepart", query = "SELECT e FROM EngagementDepense e WHERE e.dateDepart = :dateDepart"),
    @NamedQuery(name = "EngagementDepense.findByDateRetour", query = "SELECT e FROM EngagementDepense e WHERE e.dateRetour = :dateRetour"),
    @NamedQuery(name = "EngagementDepense.findByLieu", query = "SELECT e FROM EngagementDepense e WHERE e.lieu = :lieu"),
    @NamedQuery(name = "EngagementDepense.findByObjetMission", query = "SELECT e FROM EngagementDepense e WHERE e.objetMission = :objetMission"),
    @NamedQuery(name = "EngagementDepense.findByStatut", query = "SELECT e FROM EngagementDepense e WHERE e.statut = :statut"),
    @NamedQuery(name = "EngagementDepense.findByLastInsert", query = "SELECT e FROM EngagementDepense e WHERE e.idEng = SELECT MAX(e.idEng) FROM EngagementDepense e")})
public class EngagementDepense implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_eng")
    private Integer idEng;
    @Size(max = 50)
    @Column(name = "nature_depense")
    private String natureDepense;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "prix_unitaire")
    private Double prixUnitaire;
    @Column(name = "quantite")
    private Integer quantite;
    @Basic(optional = false)
    @NotNull
    @Column(name = "montant_ttc")
    private double montantTtc;
    @Size(max = 100)
    @Column(name = "fournisseur")
    private String fournisseur;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_demande")
    @Temporal(TemporalType.DATE)
    private Date dateDemande;
    @Column(name = "date_echeance")
    @Temporal(TemporalType.DATE)
    private Date dateEcheance;
    @Column(name = "date_depart")
    @Temporal(TemporalType.DATE)
    private Date dateDepart;
    @Column(name = "date_retour")
    @Temporal(TemporalType.DATE)
    private Date dateRetour;
    @Size(max = 100)
    @Column(name = "lieu")
    private String lieu;
    @Size(max = 50)
    @Column(name = "centre_cout")
    private String centreCout;
    @Column(name = "cond_paiement")
    private Integer condPaiement;
    @Size(max = 100)
    @Column(name = "cond_transport")
    private String condTransport;
    @Size(max = 100)
    @Column(name = "Mode_livraison")
    private String ModeLivraison;
    @Size(max = 100)
    @Column(name = "cond_livraison")
    private String condLivraison;
    @Size(max = 255)
    @Column(name = "objet_mission")
    private String objetMission;
    @Size(max = 255)
    @Column(name = "raison_rejet")
    private String raisonRejet;
    @Size(max = 50)
    @Column(name = "vehicule")
    private String vehicule;
    @Size(max = 5)
    @Column(name = "loger")
    private String loger;
    @Size(max = 200)
    @Column(name = "piece_joint")
    private String pieceJoint;
    @Size(max = 255)
    @Column(name = "libelle")
    private String libelle;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "statut")
    private String statut;
    @Column(name = "magasin")
    private Integer magasin;
    @Column(name = "etablisseur_OA")
    private Integer etablisseurOA;
    @JoinColumn(name = "demandeur", referencedColumnName = "id_personnel")
    @ManyToOne(optional = false)
    private Personnel demandeur;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEngagement")
    private List<DonneurOrdre> donneurOrdreList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "engagement")
    private List<Op> opList;

    public EngagementDepense() {
    }

    public EngagementDepense(Integer idEng) {
        this.idEng = idEng;
    }

    public EngagementDepense(Integer idEng, double montantTtc, Date dateDemande, String statut) {
        this.idEng = idEng;
        this.montantTtc = montantTtc;
        this.dateDemande = dateDemande;
        this.statut = statut;
    }

    public Integer getIdEng() {
        return idEng;
    }

    public void setIdEng(Integer idEng) {
        this.idEng = idEng;
    }

    public String getNatureDepense() {
        return natureDepense;
    }

    public void setNatureDepense(String natureDepense) {
        this.natureDepense = natureDepense;
    }

    public String getRaisonRejet() {
        return raisonRejet;
    }

    public String getVehicule() {
        return vehicule;
    }

    public void setVehicule(String vehicule) {
        this.vehicule = vehicule;
    }

    public String getLoger() {
        return loger;
    }

    public void setLoger(String loger) {
        this.loger = loger;
    }
    
    public String getCentreCout() {
        return centreCout;
    }

    public void setCentreCout(String centreCout) {
        this.centreCout = centreCout;
    }

    public Integer getEtablisseurOA() {
        return etablisseurOA;
    }

    public void setEtablisseurOA(Integer etablisseurOA) {
        this.etablisseurOA = etablisseurOA;
    }

    public void setRaisonRejet(String raisonRejet) {
        this.raisonRejet = raisonRejet;
    }

    public Double getPrixUnitaire() {
        return prixUnitaire;
    }

    public void setPrixUnitaire(Double prixUnitaire) {
        this.prixUnitaire = prixUnitaire;
    }

    public Integer getQuantite() {
        if (this.quantite == null) {
            this.quantite = 0;
        }
        return quantite;
    }

    public void setQuantite(Integer quantite) {
        this.quantite = quantite;
    }

    public double getMontantTtc() {
      
        return montantTtc;
    }

    public void setMontantTtc(double montantTtc) {
        this.montantTtc = montantTtc;
    }

    public String getFournisseur() {
        return fournisseur;
    }

    public void setFournisseur(String fournisseur) {
        this.fournisseur = fournisseur;
    }

    public Date getDateDemande() {
        return dateDemande;
    }

    public void setDateDemande(Date dateDemande) {
        this.dateDemande = dateDemande;
    }

    public Date getDateEcheance() {
        return dateEcheance;
    }

    public void setDateEcheance(Date dateEcheance) {
        this.dateEcheance = dateEcheance;
    }

    public Date getDateDepart() {
        return dateDepart;
    }

    public void setDateDepart(Date dateDepart) {
        this.dateDepart = dateDepart;
    }

    public Date getDateRetour() {
        return dateRetour;
    }

    public void setDateRetour(Date dateRetour) {
        this.dateRetour = dateRetour;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public Integer getCondPaiement() {
        return condPaiement;
    }

    public void setCondPaiement(Integer condPaiement) {
        this.condPaiement = condPaiement;
    }

    public String getCondTransport() {
        return condTransport;
    }

    public void setCondTransport(String condTransport) {
        this.condTransport = condTransport;
    }

    public String getModeLivraison() {
        return ModeLivraison;
    }

    public void setModeLivraison(String ModeLivraison) {
        this.ModeLivraison = ModeLivraison;
    }

    public String getCondLivraison() {
        return condLivraison;
    }

    public void setCondLivraison(String condLivraison) {
        this.condLivraison = condLivraison;
    }

    public String getObjetMission() {
        return objetMission;
    }

    public void setObjetMission(String objetMission) {
        this.objetMission = objetMission;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public int getMagasin() {
        if (magasin == null) {
            this.magasin = 0;
        }
        return magasin;
    }

    public void setMagasin(int id_magasin) {
        this.magasin = id_magasin;
    }

    public Personnel getDemandeur() {
        return demandeur;
    }

    public void setDemandeur(Personnel demandeur) {
        this.demandeur = demandeur;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getPieceJoint() {
        return pieceJoint;
    }

    public void setPieceJoint(String pieceJoint) {
        this.pieceJoint = pieceJoint;
    }

    @XmlTransient
    public List<DonneurOrdre> getDonneurOrdreList() {
        return donneurOrdreList;
    }

    public void setDonneurOrdreList(List<DonneurOrdre> donneurOrdreList) {
        this.donneurOrdreList = donneurOrdreList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEng != null ? idEng.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EngagementDepense)) {
            return false;
        }
        EngagementDepense other = (EngagementDepense) object;
        if ((this.idEng == null && other.idEng != null) || (this.idEng != null && !this.idEng.equals(other.idEng))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.subufo.entity.EngagementDepense[ idEng=" + idEng + " ]";
    }

    @XmlTransient
    public List<Op> getOpList() {
        return opList;
    }

    public void setOpList(List<Op> opList) {
        this.opList = opList;
    }

}
