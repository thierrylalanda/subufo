/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.entity;

import java.io.Serializable;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author messi
 */
@Entity
@Table(name = "service")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Service.findAll", query = "SELECT s FROM Service s"),
    @NamedQuery(name = "Service.findAllByIdSite", query = "SELECT s FROM Service s WHERE s.site.idSite = :idSite"),
    @NamedQuery(name = "Service.findAllByIdDirection", query = "SELECT s FROM Service s WHERE s.direction.idDirection = :idDirection"),
    @NamedQuery(name = "Service.findAllServiceByRegion", query = "SELECT s FROM Service s WHERE s.site.region.nomRegion = :nom_Region "),
    @NamedQuery(name = "Service.findAllServiceByIDRegion", query = "SELECT s FROM Service s WHERE s.site.region.idRegion = :nom_Region "),
    @NamedQuery(name = "Service.findLastInsert", query = "SELECT s FROM Service s WHERE s.idService = SELECT MAX(s.idService) FROM Service s "),
    @NamedQuery(name = "Service.findByNomService", query = "SELECT s FROM Service s WHERE s.nomService = :nomService")})
public class Service implements Serializable {

    @Column(name = "centreCout")
    private Integer centreCout;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_service")
    private Integer idService;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "nom_service")
    private String nomService;
    @JoinColumn(name = "direction", referencedColumnName = "id_direction")
    @ManyToOne(optional = false)
    private Direction direction;
    @JoinColumn(name = "site", referencedColumnName = "id_site")
    @ManyToOne(optional = false)
    private Site site;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "service")
    private List<Personnel> personnelList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "service")
    private List<StatistiqueArticlesService> statistiqueArticlesServiceList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "service")
    private List<StatistiqueCategorieService> statistiqueCategorieServiceList;
    @OneToMany(mappedBy = "service")
    private List<CentreCout> centrecoutList;

    public Service() {
    }

    public Service(Integer idService) {
        this.idService = idService;
    }

    public Service(Integer idService, String nomService) {
        this.idService = idService;
        this.nomService = nomService;
    }

    public Integer getIdService() {
        return idService;
    }

    public void setIdService(Integer idService) {
        this.idService = idService;
    }

    public String getNomService() {
        return nomService;
    }

    public void setNomService(String nomService) {
        this.nomService = nomService;
    }

    public Direction getDirection() {
        return direction;
    }

    public void setDirection(Direction direction) {
        this.direction = direction;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    @XmlTransient
    public List<Personnel> getPersonnelList() {
        return personnelList;
    }

    public void setPersonnelList(List<Personnel> personnelList) {
        this.personnelList = personnelList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idService != null ? idService.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Service)) {
            return false;
        }
        Service other = (Service) object;
        if ((this.idService == null && other.idService != null) || (this.idService != null && !this.idService.equals(other.idService))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entity.Service[ idService=" + idService + " ]";
    }

   

    @XmlTransient
    public List<StatistiqueArticlesService> getStatistiqueArticlesServiceList() {
        return statistiqueArticlesServiceList;
    }

    public void setStatistiqueArticlesServiceList(List<StatistiqueArticlesService> statistiqueArticlesServiceList) {
        this.statistiqueArticlesServiceList = statistiqueArticlesServiceList;
    }

    @XmlTransient
    public List<StatistiqueCategorieService> getStatistiqueCategorieServiceList() {
        return statistiqueCategorieServiceList;
    }

    public void setStatistiqueCategorieServiceList(List<StatistiqueCategorieService> statistiqueCategorieServiceList) {
        this.statistiqueCategorieServiceList = statistiqueCategorieServiceList;
    }

    @XmlTransient
    public List<CentreCout> getCentrecoutList() {
        return centrecoutList;
    }

    public void setCentrecoutList(List<CentreCout> centrecoutList) {
        this.centrecoutList = centrecoutList;
    }

    public Integer getCentreCout() {
        return centreCout;
    }

    public void setCentreCout(Integer centreCout) {
        this.centreCout = centreCout;
    }
    

}
