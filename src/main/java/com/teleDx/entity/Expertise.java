package com.teleDx.entity;

import com.teleDx.entity.Enums.ExperPriorite;
import com.teleDx.entity.Enums.ExperStatut;
import jakarta.persistence.*;

@Entity
@Table(name = "expertise")
public class Expertise {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    private String question;
    private String avis;
    private ExperPriorite priorite; // URGENTE / NORMALE / NON_URGENTE
    private ExperStatut statut; // EN_ATTENTE / TERMINEE

    @ManyToOne
    @JoinColumn(name = "consultation_id")
    private Consultation consultation;

    @ManyToOne
    @JoinColumn(name = "specialiste_id ")
    private Medecin medecin;
}
