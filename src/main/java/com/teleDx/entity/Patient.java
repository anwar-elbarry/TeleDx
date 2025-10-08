package com.teleDx.entity;
import  jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "patient")
public class Patient {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private String nom;
    private String prenom;
    private LocalDate date_naissance;
    private String num_securite_soc;
    private String telephone;

    public Patient() {
    }

    public Patient(String nom, String prenom, LocalDate date_naissance, String num_securite_soc, String telephone) {
        this.nom = nom;
        this.prenom = prenom;
        this.date_naissance = date_naissance;
        this.num_securite_soc = num_securite_soc;
        this.telephone = telephone;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public LocalDate getdate_naissance() {
        return date_naissance;
    }

    public void setdate_naissance(LocalDate date_naissance) {
        this.date_naissance = date_naissance;
    }

    public String getnum_securite_soc() {
        return num_securite_soc;
    }

    public void setnum_securite_soc(String num_securite_soc) {
        this.num_securite_soc = num_securite_soc;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
}
