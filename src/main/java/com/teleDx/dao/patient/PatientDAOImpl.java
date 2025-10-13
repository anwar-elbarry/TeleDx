package com.teleDx.dao.patient;

import com.teleDx.entity.Patient;
import com.teleDx.util.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.transaction.Transaction;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class PatientDAOImpl implements PatientDAO {
    @Override
    public List<Patient> findAll() throws SQLException {
        EntityManager em = JpaUtil.getEntityManager();
        try (em) {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();
            String psql = "SELECT p FROM Patient p";
            List<Patient> patients = em.createQuery(psql, Patient.class)
                    .getResultList();
            transaction.commit();
            return patients;
        } catch (Exception e) {
            throw new SQLException("Error retrieving patients: " + e.getMessage(), e);
        }
    }

    @Override
    public Optional<Patient> findById(String id) throws SQLException {
        EntityManager em = JpaUtil.getEntityManager();
        try (em) {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();
            Patient patient = em.find(Patient.class, id);
            transaction.commit();
            return Optional.of(patient);
        } catch (Exception e) {
            throw new SQLException("Error retrieving patient: " + e.getMessage(), e);
        }
    }

    @Override
    public Patient save(Patient patient) throws SQLException {
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction transaction = null;
        try (em) {
            transaction = em.getTransaction();
            transaction.begin();
            em.persist(patient);
            transaction.commit();
            return patient;
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw new SQLException("Error saving patient: " + e.getMessage(), e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    @Override
    public void delete(Patient patient) throws SQLException {
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction();
            transaction.begin();
            Patient managedPatient = em.merge(patient);
            em.remove(managedPatient);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw new SQLException("Error deleting patient: " + e.getMessage(), e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    @Override
    public Patient update(Patient patient) throws SQLException {
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction();
            transaction.begin();
            Patient updatedPatient = em.merge(patient);
            transaction.commit();
            return updatedPatient;
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw new SQLException("Error updating patient: " + e.getMessage(), e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}
