/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.entity;

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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author messi
 */
@Entity
@Table(name = "statistique_categori_magasin_mp")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StatistiqueCategoriMagasinMp.findAll", query = "SELECT s FROM StatistiqueCategoriMagasinMp s"),
    @NamedQuery(name = "StatistiqueCategoriMagasinMp.findByService", query = "SELECT s FROM StatistiqueCategoriMagasinMp s WHERE s.magasin.idMagasin = :region"),
    @NamedQuery(name = "StatistiqueCategoriMagasinMp.findAllByServiceAndCategorie", query = "SELECT s FROM StatistiqueCategoriMagasinMp s WHERE s.magasin.idMagasin = :region AND s.categorie = :categorie"),
    @NamedQuery(name = "StatistiqueCategoriMagasinMp.findAllByServiseAndCategorieAndPeriode", query = "SELECT s FROM StatistiqueCategoriMagasinMp s WHERE s.magasin.idMagasin = :region AND s.categorie = :categorie AND s.dateSorti BETWEEN :d1 AND :d2"),
    @NamedQuery(name = "StatistiqueCategoriMagasinMp.findByCategorie", query = "SELECT s FROM StatistiqueCategoriMagasinMp s WHERE s.categorie = :region"),
    @NamedQuery(name = "StatistiqueCategoriMagasinMp.findAllByCategorieAndPeriode", query = "SELECT s FROM StatistiqueCategoriMagasinMp s WHERE s.categorie = :categorie AND s.dateSorti BETWEEN :d1 AND :d2"),
    @NamedQuery(name = "StatistiqueCategoriMagasinMp.findAllByCategorieAndServiceAndOneDate", query = "SELECT s FROM StatistiqueCategoriMagasinMp s WHERE s.categorie = :categorie AND s.magasin.idMagasin = :service AND s.dateSorti = :d1"),       
    @NamedQuery(name = "StatistiqueCategoriMagasinMp.findByIdstatCat", query = "SELECT s FROM StatistiqueCategoriMagasinMp s WHERE s.idstatCat = :idstatCat"),
    @NamedQuery(name = "StatistiqueCategoriMagasinMp.findByDateSorti", query = "SELECT s FROM StatistiqueCategoriMagasinMp s WHERE s.dateSorti = :dateSorti"),
    @NamedQuery(name = "StatistiqueCategoriMagasinMp.findByQuantite", query = "SELECT s FROM StatistiqueCategoriMagasinMp s WHERE s.quantite = :quantite"),
    @NamedQuery(name = "StatistiqueCategoriMagasinMp.findByPrixtotal", query = "SELECT s FROM StatistiqueCategoriMagasinMp s WHERE s.prixtotal = :prixtotal")})
public class StatistiqueCategoriMagasinMp implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_statCat")
    private Integer idstatCat;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "categorie")
    private String categorie;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_sorti")
    @Temporal(TemporalType.DATE)
    private Date dateSorti;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantite")
    private int quantite;
    @Basic(optional = false)
    @NotNull
    @Column(name = "prixtotal")
    private double prixtotal;
    @JoinColumn(name = "magasin", referencedColumnName = "id_magasin")
    @ManyToOne(optional = false)
    private MagasinPrincipal magasin;

    public StatistiqueCategoriMagasinMp() {
    }

    public StatistiqueCategoriMagasinMp(Integer idstatCat) {
        this.idstatCat = idstatCat;
    }

    public StatistiqueCategoriMagasinMp(Integer idstatCat, String categorie, Date dateSorti, int quantite, double prixtotal) {
        this.idstatCat = idstatCat;
        this.categorie = categorie;
        this.dateSorti = dateSorti;
        this.quantite = quantite;
        this.prixtotal = prixtotal;
    }

    public Integer getIdstatCat() {
        return idstatCat;
    }

    public void setIdstatCat(Integer idstatCat) {
        this.idstatCat = idstatCat;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public Date getDateSorti() {
        return dateSorti;
    }

    public void setDateSorti(Date dateSorti) {
        this.dateSorti = dateSorti;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public double getPrixtotal() {
        return prixtotal;
    }

    public void setPrixtotal(double prixtotal) {
        this.prixtotal = prixtotal;
    }

    public MagasinPrincipal getMagasin() {
        return magasin;
    }

    public void setMagasin(MagasinPrincipal magasin) {
        this.magasin = magasin;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idstatCat != null ? idstatCat.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StatistiqueCategoriMagasinMp)) {
            return false;
        }
        StatistiqueCategoriMagasinMp other = (StatistiqueCategoriMagasinMp) object;
        if ((this.idstatCat == null && other.idstatCat != null) || (this.idstatCat != null && !this.idstatCat.equals(other.idstatCat))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gciapplication.entity.StatistiqueCategoriMagasinMp[ idstatCat=" + idstatCat + " ]";
    }
    
}
