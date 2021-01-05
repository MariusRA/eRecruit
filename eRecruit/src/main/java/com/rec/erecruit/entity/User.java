/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author popa_
 */
@Entity
@Table(name="USERS")
@XmlRootElement
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    
    private String nume;
    private String prenume;
    private String nrTel;
    private String nrMobil;
    private String mail;
    private String functie;
    private String descriere;
    private String username;
    private String password;
    

   
    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public void setNrTel(String nrTel) {
        this.nrTel = nrTel;
    }

    public void setNrMobil(String nrMobil) {
        this.nrMobil = nrMobil;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setFunctie(String functie) {
        this.functie = functie;
    }

    public void setDescriere(String descriere) {
        this.descriere = descriere;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getNume() {
        return nume;
    }

    public String getPrenume() {
        return prenume;
    }

    public String getNrTel() {
        return nrTel;
    }

    public String getNrMobil() {
        return nrMobil;
    }

    public String getMail() {
        return mail;
    }

    public String getFunctie() {
        return functie;
    }

    public String getDescriere() {
        return descriere;
    }

    public String getUsername() {
        return username;
    }
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.rec.erecruit.entity.User[ id=" + id + " ]";
    }
    
}
