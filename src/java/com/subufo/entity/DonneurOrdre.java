/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.subufo.entity;

import com.gciapplication.entity.Personnel;
import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author messi
 */
@Entity
@Table(name = "donneur_ordre")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DonneurOrdre.findAll", query = "SELECT d FROM DonneurOrdre d"),
    @NamedQuery(name = "DonneurOrdre.Delete", query = "DELETE FROM DonneurOrdre d WHERE d.idEngagement.idEng = :engagement AND d.valideur.idPersonnel = :id"),
    @NamedQuery(name = "DonneurOrdre.findByDepense", query = "SELECT d FROM DonneurOrdre d WHERE d.idEngagement.idEng = :engagement AND d.valideur.idPersonnel = :id"),
    @NamedQuery(name = "DonneurOrdre.findAllDepenseByValideur", query = "SELECT d FROM DonneurOrdre d WHERE d.valideur.idPersonnel = :valideur"),
    @NamedQuery(name = "DonneurOrdre.finByControleurAndStatut", query = "SELECT d FROM DonneurOrdre d WHERE d.valideur = :controleur AND d.idEngagement.statut = :statut"),
    @NamedQuery(name = "DonneurOrdre.finAllByEngagement", query = "SELECT d FROM DonneurOrdre d WHERE d.idEngagement.idEng = :engagement"),
    @NamedQuery(name = "DonneurOrdre.findByIdDonneur", query = "SELECT d FROM DonneurOrdre d WHERE d.idDonneur = :idDonneur")})
public class DonneurOrdre implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_donneur")
    private Integer idDonneur;
    @JoinColumn(name = "valideur", referencedColumnName = "id_personnel")
    @ManyToOne(optional = false)
    private Personnel valideur;
    @Basic(optional = false)
    @Column(name = "jour_validation")
    @Temporal(TemporalType.DATE)
    private Date jourValidation;
    @Column(name = "etat")
    private Integer etat;
    @JoinColumn(name = "id_engagement", referencedColumnName = "id_eng")
    @ManyToOne(optional = false)
    private EngagementDepense idEngagement;

    public DonneurOrdre() {
    }

    public DonneurOrdre(Integer idDonneur) {
        this.idDonneur = idDonneur;
    }

    public Integer getIdDonneur() {
        return idDonneur;
    }

    public void setIdDonneur(Integer idDonneur) {
        this.idDonneur = idDonneur;
    }

    public Personnel getValideur() {
        return valideur;
    }

    public void setValideur(Personnel valideur) {
        this.valideur = valideur;
    }

    public EngagementDepense getIdEngagement() {
        return idEngagement;
    }

    public void setIdEngagement(EngagementDepense idEngagement) {
        this.idEngagement = idEngagement;
    }

    public Date getJourValidation() {
        return jourValidation;
    }

    public void setJourValidation(Date jourValidation) {
        this.jourValidation = jourValidation;
    }

    public Integer getEtat() {
        return etat;
    }

    public void setEtat(Integer etat) {
        this.etat = etat;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDonneur != null ? idDonneur.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DonneurOrdre)) {
            return false;
        }
        DonneurOrdre other = (DonneurOrdre) object;
        if ((this.idDonneur == null && other.idDonneur != null) || (this.idDonneur != null && !this.idDonneur.equals(other.idDonneur))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.subufo.entity.DonneurOrdre[ idDonneur=" + idDonneur + " ]";
    }

}
