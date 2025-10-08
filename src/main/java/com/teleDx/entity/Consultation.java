package com.teleDx.entity;

import com.teleDx.entity.Enums.ConsulStatut;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "consultation")
public class Consultation {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    private String motif;
    private String observations;
    private ConsulStatut statut; // TERMINEE, EN_ATTENTE_AVIS_SPECIALISTE
    private LocalDateTime dateConsult = LocalDateTime.now();

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "medecin_id")
    private Medecin medecin;

    @OneToOne(mappedBy = "consultation", cascade = CascadeType.ALL)
    private Expertise expertise;
}
