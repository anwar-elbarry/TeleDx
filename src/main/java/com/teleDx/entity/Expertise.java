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
    @Enumerated(EnumType.STRING)
    private ExperPriorite priorite; // URGENTE / NORMALE / NON_URGENTE
    @Enumerated(EnumType.STRING)
    private ExperStatut statut; // EN_ATTENTE / TERMINEE

    @ManyToOne
    @JoinColumn(name = "consultation_id")
    private Consultation consultation;

    @ManyToOne
    @JoinColumn(name = "specialiste_id ")
    private Medecin specialiste;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAvis() {
        return avis;
    }

    public void setAvis(String avis) {
        this.avis = avis;
    }

    public ExperPriorite getPriorite() {
        return priorite;
    }

    public void setPriorite(ExperPriorite priorite) {
        this.priorite = priorite;
    }

    public ExperStatut getStatut() {
        return statut;
    }

    public void setStatut(ExperStatut statut) {
        this.statut = statut;
    }

    public Consultation getConsultation() {
        return consultation;
    }

    public void setConsultation(Consultation consultation) {
        this.consultation = consultation;
    }

    public Medecin getSpecialiste() {
        return specialiste;
    }

    public void setSpecialiste(Medecin specialiste) {
        this.specialiste = specialiste;
    }
}
