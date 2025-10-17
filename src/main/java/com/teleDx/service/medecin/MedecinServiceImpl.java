package com.teleDx.service.medecin;

import com.teleDx.entity.Medecin;
import com.teleDx.util.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class MedecinServiceImpl implements MedecinService {
    @Override
    public List<Medecin> findBySpecialiteSortedByTarif(String specialite) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return em.createQuery("SELECT m FROM Medecin m WHERE m.specialite = :spec ORDER BY m.tarif ASC", Medecin.class)
                    .setParameter("spec", specialite)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<String> listSpecialites() {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return em.createQuery("SELECT DISTINCT m.specialite FROM Medecin m WHERE m.specialite IS NOT NULL ORDER BY m.specialite", String.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Medecin> findById(String id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return Optional.ofNullable(em.find(Medecin.class, id));
        } finally {
            em.close();
        }
    }
}


