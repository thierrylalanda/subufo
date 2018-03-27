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
@Table(name = "readdata")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Readdata.findAll", query = "SELECT r FROM Readdata r"),
    @NamedQuery(name = "Readdata.findById", query = "SELECT r FROM Readdata r WHERE r.id = :id"),
    @NamedQuery(name = "Readdata.findByIsfirsttime", query = "SELECT r FROM Readdata r WHERE r.isfirsttime = :isfirsttime"),
    @NamedQuery(name = "Readdata.findByIscompletversion", query = "SELECT r FROM Readdata r WHERE r.iscompletversion = :iscompletversion"),
    @NamedQuery(name = "Readdata.findByIsdemoversion", query = "SELECT r FROM Readdata r WHERE r.isdemoversion = :isdemoversion"),
    @NamedQuery(name = "Readdata.findByInstallationDate", query = "SELECT r FROM Readdata r WHERE r.installationDate = :installationDate"),
    @NamedQuery(name = "Readdata.findByDemoperiode", query = "SELECT r FROM Readdata r WHERE r.demoperiode = :demoperiode"),
    @NamedQuery(name = "Readdata.findByDemoperiodeisfirst", query = "SELECT r FROM Readdata r WHERE r.demoperiodeisfirst = :demoperiodeisfirst"),
    @NamedQuery(name = "Readdata.findByMonthdemo", query = "SELECT r FROM Readdata r WHERE r.monthdemo = :monthdemo")})
public class Readdata implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "isfirsttime")
    private int isfirsttime;
    @Basic(optional = false)
    @Column(name = "iscompletversion")
    private int iscompletversion;
    @Basic(optional = false)
    @Column(name = "isdemoversion")
    private int isdemoversion;
    @Basic(optional = false)
    @Column(name = "installationDate")
    @Temporal(TemporalType.DATE)
    private Date installationDate;
    @Basic(optional = false)
    @Column(name = "demoperiode")
    @Temporal(TemporalType.DATE)
    private Date demoperiode;
    @Basic(optional = false)
    @Column(name = "demoperiodeisfirst")
    private int demoperiodeisfirst;
    @Basic(optional = false)
    @Column(name = "monthdemo")
    private int monthdemo;

    public Readdata() {
    }

    public Readdata(Integer id) {
        this.id = id;
    }

    public Readdata(Integer id, int isfirsttime, int iscompletversion, int isdemoversion, Date installationDate, Date demoperiode, int demoperiodeisfirst, int monthdemo) {
        this.id = id;
        this.isfirsttime = isfirsttime;
        this.iscompletversion = iscompletversion;
        this.isdemoversion = isdemoversion;
        this.installationDate = installationDate;
        this.demoperiode = demoperiode;
        this.demoperiodeisfirst = demoperiodeisfirst;
        this.monthdemo = monthdemo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getIsfirsttime() {
        return isfirsttime;
    }

    public void setIsfirsttime(int isfirsttime) {
        this.isfirsttime = isfirsttime;
    }

    public int getIscompletversion() {
        return iscompletversion;
    }

    public void setIscompletversion(int iscompletversion) {
        this.iscompletversion = iscompletversion;
    }

    public int getIsdemoversion() {
        return isdemoversion;
    }

    public void setIsdemoversion(int isdemoversion) {
        this.isdemoversion = isdemoversion;
    }

    public Date getInstallationDate() {
        return installationDate;
    }

    public void setInstallationDate(Date installationDate) {
        this.installationDate = installationDate;
    }

    public Date getDemoperiode() {
        return demoperiode;
    }

    public void setDemoperiode(Date demoperiode) {
        this.demoperiode = demoperiode;
    }

    public int getDemoperiodeisfirst() {
        return demoperiodeisfirst;
    }

    public void setDemoperiodeisfirst(int demoperiodeisfirst) {
        this.demoperiodeisfirst = demoperiodeisfirst;
    }

    public int getMonthdemo() {
        return monthdemo;
    }

    public void setMonthdemo(int monthdemo) {
        this.monthdemo = monthdemo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Readdata)) {
            return false;
        }
        Readdata other = (Readdata) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gciapplication.entity.Readdata[ id=" + id + " ]";
    }
    
}
