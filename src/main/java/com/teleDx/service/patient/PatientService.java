package com.teleDx.service.patient;

import com.teleDx.entity.Patient;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface PatientService {
    Patient save (Patient patient);
    Optional<Patient> findById(String id) throws SQLException;
    List<Patient> findAll() throws SQLException;
    void delete(Patient patient) throws SQLException;
    Patient update(Patient patient) throws SQLException;
}
