package com.teleDx.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "medecin")
public class Medecin {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    private String nom;
    private String specialite; // NULL for generaliste
    private String email;
    private BigDecimal tarif;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;


    @OneToMany(mappedBy = "medecin")
    private List<Consultation> consultations;

    @OneToMany(mappedBy = "specialiste")
    private List<Expertise> expertises;

    @OneToMany(mappedBy = "specialiste")
    private List<Creneau> creneaux;

}
