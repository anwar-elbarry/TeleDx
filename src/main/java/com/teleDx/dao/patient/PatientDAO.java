package com.teleDx.dao.patient;

import com.teleDx.entity.Patient;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface PatientDAO {
    public List<Patient> findAll() throws SQLException;
    public Optional<Patient> findById(String id) throws SQLException;
    public Patient save(Patient patient) throws SQLException;
    public void delete(Patient patient) throws SQLException;
    public Patient update(Patient patient) throws SQLException;
}
