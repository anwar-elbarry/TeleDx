package com.teleDx.service.creneau;

import com.teleDx.entity.Creneau;
import com.teleDx.util.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;

public class CreneauServiceImpl implements CreneauService {
    @Override
    public List<Creneau> listForSpecialiste(String specialisteId) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return em.createQuery("SELECT c FROM Creneau c WHERE c.specialiste.id = :sid ORDER BY c.heure_debut", Creneau.class)
                    .setParameter("sid", specialisteId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Creneau> listDisponiblesForSpecialiste(String specialisteId) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return em.createQuery("SELECT c FROM Creneau c WHERE c.specialiste.id = :sid AND c.disponible = true ORDER BY c.heure_debut", Creneau.class)
                    .setParameter("sid", specialisteId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public void reserver(String creneauId) {
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Creneau c = em.find(Creneau.class, creneauId);
            if (c == null) throw new IllegalArgumentException("Creneau not found");
            c.setDisponible(false);
            em.merge(c);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }
}


