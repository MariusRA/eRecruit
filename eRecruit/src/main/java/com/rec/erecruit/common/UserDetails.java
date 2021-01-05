/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.common;

/**
 *
 * @author popa_
 */
public class UserDetails implements java.io.Serializable {
    
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

    public UserDetails(Integer id, String nume, String prenume, String nrTel, String nrMobil, String mail, String functie, String descriere, String username, String password) {
        this.id = id;
        this.nume = nume;
        this.prenume = prenume;
        this.nrTel = nrTel;
        this.nrMobil = nrMobil;
        this.mail = mail;
        this.functie = functie;
        this.descriere = descriere;
        this.username = username;
        this.password = password;
    }

    public Integer getId() {
        return id;
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

    public String getPassword() {
        return password;
    }
    
}
