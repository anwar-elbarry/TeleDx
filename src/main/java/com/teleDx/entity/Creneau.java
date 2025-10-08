package com.teleDx.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.*;
import jakarta.persistence.Table;

import java.time.LocalTime;

@Entity
@Table(name = "creneau")
public class Creneau {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;


    private LocalTime heure_debut;
    private LocalTime heure_fin;
    private Boolean disponible = true;

    @ManyToOne
    @JoinColumn(name = "specialiste_id ")
    private Medecin specialiste;

    public Creneau() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public LocalTime getHeure_debut() {
        return heure_debut;
    }

    public void setHeure_debut(LocalTime heure_debut) {
        this.heure_debut = heure_debut;
    }

    public LocalTime getHeure_fin() {
        return heure_fin;
    }

    public void setHeure_fin(LocalTime heure_fin) {
        this.heure_fin = heure_fin;
    }

    public Boolean getDisponible() {
        return disponible;
    }

    public void setDisponible(Boolean disponible) {
        this.disponible = disponible;
    }

    public Medecin getSpecialiste() {
        return specialiste;
    }

    public void setSpecialiste(Medecin specialiste) {
        this.specialiste = specialiste;
    }
}
