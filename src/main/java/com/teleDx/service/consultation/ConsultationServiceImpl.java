package com.teleDx.service.consultation;

import com.teleDx.entity.Consultation;
import com.teleDx.util.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;
import java.util.Optional;

public class ConsultationServiceImpl implements ConsultationService {

    @Override
    public Consultation save(Consultation consultation) {
        if (consultation == null) throw new IllegalArgumentException("Consultation cannot be null");
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(consultation);
            tx.commit();
            return consultation;
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Consultation> findById(String id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return Optional.ofNullable(em.find(Consultation.class, id));
        } finally {
            em.close();
        }
    }

    @Override
    public List<Consultation> findByPatientId(String patientId) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return em.createQuery("SELECT c FROM Consultation c WHERE c.patient.id = :pid ORDER BY c.dateConsult DESC", Consultation.class)
                    .setParameter("pid", patientId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public Consultation update(Consultation consultation) {
        if (consultation == null) throw new IllegalArgumentException("Consultation cannot be null");
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Consultation merged = em.merge(consultation);
            tx.commit();
            return merged;
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }
}


