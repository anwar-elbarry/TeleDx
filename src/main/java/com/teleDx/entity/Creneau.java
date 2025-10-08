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
    private Medecin medecin;
}
