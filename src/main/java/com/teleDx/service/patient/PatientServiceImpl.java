package com.teleDx.service.patient;

import com.teleDx.dao.patient.PatientDAO;
import com.teleDx.dao.patient.PatientDAOImpl;
import com.teleDx.entity.Patient;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class PatientServiceImpl implements PatientService{

    private final PatientDAO patientDAO;

    public PatientServiceImpl(){
        this.patientDAO = new PatientDAOImpl();
    }

    @Override
    public Patient save(Patient patient) {
        if (patient == null){
            throw new IllegalArgumentException("Patient cannot be null");
        }
      try {
         return patientDAO.save(patient);
         }catch (SQLException e){
          throw new RuntimeException("Failed to save patient: " + e.getMessage(), e);
         }
    }

    @Override
    public Optional<Patient> findById(String id) throws SQLException {
        if (id == null || id.trim().isEmpty()) {
            return Optional.empty();
        }
        try {
            return patientDAO.findById(id);
        } catch (SQLException e) {
            throw new RuntimeException("Failed to find patient with id: " + id, e);
        }
    }

    @Override
    public List<Patient> findAll() {
        try {
            return patientDAO.findAll();
        } catch (SQLException e) {
            throw new RuntimeException("Failed to retrieve patients", e);
        }
    }

    @Override
    public void delete(Patient patient) {
        if (patient == null) {
            throw new IllegalArgumentException("Patient cannot be null");
        }
        try {
            patientDAO.delete(patient);
        } catch (SQLException e) {
            throw new RuntimeException("Failed to delete patient: " + e.getMessage(), e);
        }
    }

    @Override
    public Patient update(Patient patient) {
        if (patient == null) {
            throw new IllegalArgumentException("Patient cannot be null");
        }
        try {
            return patientDAO.update(patient);
        } catch (SQLException e) {
            throw new RuntimeException("Failed to update patient: " + e.getMessage(), e);
        }
    }

}
