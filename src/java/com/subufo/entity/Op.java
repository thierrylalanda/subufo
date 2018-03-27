/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author messi
 */
@Entity
@Table(name = "OP")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Op.findAll", query = "SELECT o FROM Op o"),
    @NamedQuery(name = "Op.findByIdOP", query = "SELECT o FROM Op o WHERE o.idOP = :idOP"),
    @NamedQuery(name = "Op.findByPrix", query = "SELECT o FROM Op o WHERE o.prix = :prix"),
    @NamedQuery(name = "Op.findByDepense", query = "SELECT o FROM Op o WHERE o.engagement.idEng = :engagement"),
    @NamedQuery(name = "Op.findByDepenseAndStatut", query = "SELECT o FROM Op o WHERE o.engagement.idEng = :engagement AND o.engagement.statut = :status"),
    @NamedQuery(name = "Op.findByQuantite", query = "SELECT o FROM Op o WHERE o.quantite = :quantite"),
    @NamedQuery(name = "Op.findByMontant", query = "SELECT o FROM Op o WHERE o.montant = :montant"),
    @NamedQuery(name = "Op.findByImputation", query = "SELECT o FROM Op o WHERE o.imputation = :imputation"),
    @NamedQuery(name = "Op.findByEtablisseur", query = "SELECT o FROM Op o WHERE o.etablisseur = :etablisseur")})
public class Op implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_OP")
    private Integer idOP;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "prix")
    private Double prix;
    @Column(name = "quantite")
    private Integer quantite;
    @Column(name = "id_budget")
    private Integer idBudget;
    @Column(name = "montant")
    private Double montant;
    @Size(max = 255)
    @Column(name = "type_budget")
    private String typeBudget;
    @Size(max = 255)
    @Column(name = "centre_cout")
    private String centreCout;
    @Size(max = 50)
    @Column(name = "imputation")
    private String imputation;
    @Size(max = 100)
    @Column(name = "etablisseur")
    private String etablisseur;
    @JoinColumn(name = "engagement", referencedColumnName = "id_eng")
    @ManyToOne(optional = false)
    private EngagementDepense engagement;

    public Op() {
    }

    public Op(Integer idOP) {
        this.idOP = idOP;
    }

    public Integer getIdOP() {
        return idOP;
    }

    public Integer getIdBudget() {
        return idBudget;
    }

    public void setIdBudget(Integer idBudget) {
        this.idBudget = idBudget;
    }

    public void setIdOP(Integer idOP) {
        this.idOP = idOP;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public Integer getQuantite() {
        return quantite;
    }

    public void setQuantite(Integer quantite) {
        this.quantite = quantite;
    }

    public Double getMontant() {
        return montant;
    }

    public void setMontant(Double montant) {
        this.montant = montant;
    }

    public String getImputation() {
        return imputation;
    }

    public void setImputation(String imputation) {
        this.imputation = imputation;
    }

    public String getTypeBudget() {
        return typeBudget;
    }

    public void setTypeBudget(String typeBudget) {
        this.typeBudget = typeBudget;
    }

    public String getCentreCout() {
        return centreCout;
    }

    public void setCentreCout(String centreCout) {
        this.centreCout = centreCout;
    }

    public String getEtablisseur() {
        return etablisseur;
    }

    public void setEtablisseur(String etablisseur) {
        this.etablisseur = etablisseur;
    }

    public EngagementDepense getEngagement() {
        return engagement;
    }

    public void setEngagement(EngagementDepense engagement) {
        this.engagement = engagement;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idOP != null ? idOP.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Op)) {
            return false;
        }
        Op other = (Op) object;
        if ((this.idOP == null && other.idOP != null) || (this.idOP != null && !this.idOP.equals(other.idOP))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.subufo.entity.Op[ idOP=" + idOP + " ]";
    }

}
