/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gciapplication.entity;

import com.subufo.entity.DonneurOrdre;
import com.subufo.entity.EngagementDepense;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author messi
 */
@Entity
@Table(name = "personnel")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Personnel.findAll", query = "SELECT p FROM Personnel p"),
    @NamedQuery(name = "Personnel.findByID", query = "SELECT p FROM Personnel p WHERE  p.idPersonnel = :idPersonnel"),
    @NamedQuery(name = "Personnel.findByIdService", query = "SELECT p FROM Personnel p WHERE  p.service.idService = :idService"),
    @NamedQuery(name = "Personnel.findMAXIdPersonnel", query = "SELECT p FROM Personnel p WHERE p.idPersonnel = SELECT MAX(p.idPersonnel) FROM Personnel p"),
    @NamedQuery(name = "Personnel.findByIdPersonnel", query = "SELECT p FROM Personnel p WHERE p.idPersonnel = :idPersonnel"),
    @NamedQuery(name = "Personnel.findByMatricule", query = "SELECT p FROM Personnel p WHERE p.matricule = :matricule"),
    @NamedQuery(name = "Personnel.findByMatriculeByMail", query = "SELECT p FROM Personnel p WHERE p.matricule = :matricule AND p.email = :email"),
    @NamedQuery(name = "Personnel.findByNomPrenom", query = "SELECT p FROM Personnel p WHERE p.nomPrenom = :nomPrenom"),
    @NamedQuery(name = "Personnel.findByRole", query = "SELECT p FROM Personnel p WHERE p.role = :role"),
    @NamedQuery(name = "Personnel.findBySite", query = "SELECT p FROM Personnel p WHERE p.service.site.idSite = :site"),
    @NamedQuery(name = "Personnel.findByRegion", query = "SELECT p FROM Personnel p WHERE p.service.site.region.idRegion = :region"),
    @NamedQuery(name = "Personnel.findByFonctionSubufo", query = "SELECT p FROM Personnel p WHERE p.service.site.region.nomRegion = :region AND p.fonctionSubufo = :subufo"),
    @NamedQuery(name = "Personnel.findByDirection", query = "SELECT p FROM Personnel p WHERE p.service.direction.idDirection = :direction"),
    @NamedQuery(name = "Personnel.findByRoleByRegion", query = "SELECT p FROM Personnel p WHERE p.role = :role AND p.service.site.region.nomRegion = :region"),
    @NamedQuery(name = "Personnel.findByFonction", query = "SELECT p FROM Personnel p WHERE p.fonction = :fonction"),
    @NamedQuery(name = "Personnel.findByTelephone", query = "SELECT p FROM Personnel p WHERE p.telephone = :telephone"),
    @NamedQuery(name = "Personnel.findByEmail", query = "SELECT p FROM Personnel p WHERE p.email = :email")})
public class Personnel implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_personnel")
    private Integer idPersonnel;
    @Size(max = 255)
    @Column(name = "matricule")
    private String matricule;
    @Size(max = 6)
    @Column(name = "chef_service")
    private String chefService;
    @Basic(optional = false)
    @Size(min = 1, max = 255)
    @Column(name = "nom_prenom")
    private String nomPrenom;
    @Basic(optional = false)
    @Size(min = 1, max = 255)
    @Column(name = "fonction")
    private String fonction;
    @Basic(optional = false)
    @Size(min = 1, max = 255)
    @Column(name = "telephone")
    private String telephone;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "signature")
    private String signature;
    @Basic(optional = false)
    @Size(min = 1, max = 50)
    @Column(name = "fonction_subufo")
    private String fonctionSubufo;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @Size(min = 1, max = 255)
    @Column(name = "Email")
    private String email;
    @Basic(optional = false)
    @Size(min = 1, max = 255)
    @Column(name = "role")
    private String role;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personnel")
    private List<AffectMsToPersonnel> affectMsToPersonnelList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personnel")
    private List<StatistiqueCategoriePersonnel> statistiqueCategoriePersonnelList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personnel")
    private List<StatistiqueArticlesPersonnel> statistiqueArticlesPersonnelList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "proprietaire", fetch = FetchType.LAZY)
    private List<Appariel> apparielList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "personnel", fetch = FetchType.LAZY)
    private Login loginList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personnel", fetch = FetchType.LAZY)
    private List<AffectationControleurs> affectationControleursList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personnel", fetch = FetchType.LAZY)
    private List<OperationConsommateur> operationConsommateurList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPersonnel")
    private List<CommandePersonnel> commandePersonnelList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personnel", fetch = FetchType.LAZY)
    private List<AffectationmagasinS> affectationmagasinSList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personnel", fetch = FetchType.LAZY)
    private List<AffectationmagasinP> affectationmagasinPList;
    @JoinColumn(name = "service", referencedColumnName = "id_service")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Service service;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "controleur", fetch = FetchType.LAZY)
    private List<VisaChef> visaChefList;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "valideur")
    private List<DonneurOrdre> donneurOrdreList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "demandeur", fetch = FetchType.LAZY)
    private List<EngagementDepense> engagementDepenseList;

    public Personnel() {
    }

    public Personnel(Integer idPersonnel) {
        this.idPersonnel = idPersonnel;
    }

    public Personnel(Integer idPersonnel, String nomPrenom, String fonction, String telephone, String email, String role) {
        this.idPersonnel = idPersonnel;
        this.nomPrenom = nomPrenom;
        this.fonction = fonction;
        this.telephone = telephone;
        this.email = email;
        this.role = role;
    }

    public Integer getIdPersonnel() {
        return idPersonnel;
    }

    public void setIdPersonnel(Integer idPersonnel) {
        this.idPersonnel = idPersonnel;
    }

    public String getMatricule() {
        return matricule;
    }

    public String getChefService() {
        if (chefService == null) {
            chefService = "rien";
        }
        System.out.println("valu " + chefService);
        return chefService;
    }

    public void setChefService(String chefService) {
        this.chefService = chefService;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getNomPrenom() {
        return nomPrenom;
    }

    public String getFonctionSubufo() {
        if (fonctionSubufo == null) {
            fonctionSubufo = "rien";
        }
        return fonctionSubufo;
    }

    public void setFonctionSubufo(String fonctionSubufo) {
        this.fonctionSubufo = fonctionSubufo;
    }

    public void setNomPrenom(String nomPrenom) {
        this.nomPrenom = nomPrenom;
    }

    public String getFonction() {
        return fonction;
    }

    public void setFonction(String fonction) {
        this.fonction = fonction;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @XmlTransient
    public List<Appariel> getApparielList() {
        return apparielList;
    }

    public void setApparielList(List<Appariel> apparielList) {
        this.apparielList = apparielList;
    }

    @XmlTransient
    public Login getLoginList() {
        return loginList;
    }

    public void setLoginList(Login loginList) {
        this.loginList = loginList;
    }

    @XmlTransient
    public List<AffectationControleurs> getAffectationControleursList() {
        return affectationControleursList;
    }

    public void setAffectationControleursList(List<AffectationControleurs> affectationControleursList) {
        this.affectationControleursList = affectationControleursList;
    }

    @XmlTransient
    public List<OperationConsommateur> getOperationConsommateurList() {
        return operationConsommateurList;
    }

    public void setOperationConsommateurList(List<OperationConsommateur> operationConsommateurList) {
        this.operationConsommateurList = operationConsommateurList;
    }

    @XmlTransient
    public List<CommandePersonnel> getCommandePersonnelList() {
        return commandePersonnelList;
    }

    public void setCommandePersonnelList(List<CommandePersonnel> commandePersonnelList) {
        this.commandePersonnelList = commandePersonnelList;
    }

    @XmlTransient
    public List<AffectationmagasinS> getAffectationmagasinSList() {
        return affectationmagasinSList;
    }

    public void setAffectationmagasinSList(List<AffectationmagasinS> affectationmagasinSList) {
        this.affectationmagasinSList = affectationmagasinSList;
    }

    @XmlTransient
    public List<AffectationmagasinP> getAffectationmagasinPList() {
        return affectationmagasinPList;
    }

    public void setAffectationmagasinPList(List<AffectationmagasinP> affectationmagasinPList) {
        this.affectationmagasinPList = affectationmagasinPList;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPersonnel != null ? idPersonnel.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Personnel)) {
            return false;
        }
        Personnel other = (Personnel) object;
        if ((this.idPersonnel == null && other.idPersonnel != null) || (this.idPersonnel != null && !this.idPersonnel.equals(other.idPersonnel))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entity.Personnel[ idPersonnel=" + idPersonnel + " ]";
    }

    @XmlTransient
    public List<VisaChef> getVisaChefList() {
        return visaChefList;
    }

    public void setVisaChefList(List<VisaChef> visaChefList) {
        this.visaChefList = visaChefList;
    }

    @XmlTransient
    public List<StatistiqueCategoriePersonnel> getStatistiqueCategoriePersonnelList() {
        return statistiqueCategoriePersonnelList;
    }

    public void setStatistiqueCategoriePersonnelList(List<StatistiqueCategoriePersonnel> statistiqueCategoriePersonnelList) {
        this.statistiqueCategoriePersonnelList = statistiqueCategoriePersonnelList;
    }

    @XmlTransient
    public List<StatistiqueArticlesPersonnel> getStatistiqueArticlesPersonnelList() {
        return statistiqueArticlesPersonnelList;
    }

    public void setStatistiqueArticlesPersonnelList(List<StatistiqueArticlesPersonnel> statistiqueArticlesPersonnelList) {
        this.statistiqueArticlesPersonnelList = statistiqueArticlesPersonnelList;
    }

    @XmlTransient
    public List<AffectMsToPersonnel> getAffectMsToPersonnelList() {
        return affectMsToPersonnelList;
    }

    public void setAffectMsToPersonnelList(List<AffectMsToPersonnel> affectMsToPersonnelList) {
        this.affectMsToPersonnelList = affectMsToPersonnelList;
    }

    @XmlTransient
    public List<DonneurOrdre> getDonneurOrdreList() {
        return donneurOrdreList;
    }

    public void setDonneurOrdreList(List<DonneurOrdre> donneurOrdreList) {
        this.donneurOrdreList = donneurOrdreList;
    }

    @XmlTransient
    public List<EngagementDepense> getEngagementDepenseList() {
        return engagementDepenseList;
    }

    public void setEngagementDepenseList(List<EngagementDepense> engagementDepenseList) {
        this.engagementDepenseList = engagementDepenseList;
    }

}
