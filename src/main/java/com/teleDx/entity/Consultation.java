package com.teleDx.entity;

import com.teleDx.entity.Enums.ConsulStatut;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import com.teleDx.entity.Medecin;
import com.teleDx.entity.Expertise;

@Entity
@Table(name = "consultation")
public class Consultation {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    private String motif;
    private String observations;
    @Enumerated(EnumType.STRING)
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMotif() {
        return motif;
    }

    public void setMotif(String motif) {
        this.motif = motif;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public ConsulStatut getStatut() {
        return statut;
    }

    public void setStatut(ConsulStatut statut) {
        this.statut = statut;
    }

    public LocalDateTime getDateConsult() {
        return dateConsult;
    }

    public void setDateConsult(LocalDateTime dateConsult) {
        this.dateConsult = dateConsult;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Medecin getMedecin() {
        return medecin;
    }

    public void setMedecin(Medecin medecin) {
        this.medecin = medecin;
    }

    public Expertise getExpertise() {
        return expertise;
    }

    public void setExpertise(Expertise expertise) {
        this.expertise = expertise;
    }
}
