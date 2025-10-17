package com.teleDx.service.expertise;

import com.teleDx.entity.Expertise;
import com.teleDx.util.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.Optional;

public class ExpertiseServiceImpl implements ExpertiseService {
    @Override
    public Expertise save(Expertise expertise) {
        if (expertise == null) throw new IllegalArgumentException("Expertise cannot be null");
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(expertise);
            tx.commit();
            return expertise;
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public Expertise update(Expertise expertise) {
        if (expertise == null) throw new IllegalArgumentException("Expertise cannot be null");
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Expertise merged = em.merge(expertise);
            tx.commit();
            return merged;
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Expertise> findById(String id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return Optional.ofNullable(em.find(Expertise.class, id));
        } finally {
            em.close();
        }
    }
}


