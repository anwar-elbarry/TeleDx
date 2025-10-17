package com.teleDx.service.patient;

import com.teleDx.dao.patient.PatientDAO;
import com.teleDx.entity.Patient;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class PatientServiceImplTest {

    @Mock
    private PatientDAO patientDAO;

    private PatientServiceImpl patientService;
    private Patient testPatient;

    @BeforeEach
    void setUp() {
        patientService = new PatientServiceImpl(patientDAO);
        testPatient = new Patient();
        testPatient.setId("P001");
        testPatient.setNom("Doe");
        testPatient.setPrenom("John");
    }

    @Test
    void save_ValidPatient_ReturnsSavedPatient() throws SQLException {
        when(patientDAO.save(any(Patient.class))).thenReturn(testPatient);
        
        Patient savedPatient = patientService.save(testPatient);
        
        assertNotNull(savedPatient);
        assertEquals(testPatient.getId(), savedPatient.getId());
        verify(patientDAO, times(1)).save(testPatient);
    }

    @Test
    void save_NullPatient_ThrowsException() {
        assertThrows(IllegalArgumentException.class, () -> patientService.save(null));
    }

    @Test
    void findById_ExistingId_ReturnsPatient() throws SQLException {
        when(patientDAO.findById("P001")).thenReturn(Optional.of(testPatient));
        
        Optional<Patient> foundPatient = patientService.findById("P001");
        
        assertTrue(foundPatient.isPresent());
        assertEquals(testPatient.getId(), foundPatient.get().getId());
    }

    @Test
    void findById_NonExistingId_ReturnsEmpty() throws SQLException {
        when(patientDAO.findById("NON_EXISTENT")).thenReturn(Optional.empty());
        
        Optional<Patient> foundPatient = patientService.findById("NON_EXISTENT");
        
        assertTrue(foundPatient.isEmpty());
    }

    @Test
    void findAll_ReturnsAllPatients() throws SQLException {
        List<Patient> patients = Arrays.asList(testPatient, new Patient());
        when(patientDAO.findAll()).thenReturn(patients);
        
        List<Patient> result = patientService.findAll();
        
        assertEquals(2, result.size());
        verify(patientDAO, times(1)).findAll();
    }

    @Test
    void delete_ValidPatient_DeletesPatient() throws SQLException {
        assertDoesNotThrow(() -> patientService.delete(testPatient));
        verify(patientDAO, times(1)).delete(testPatient);
    }

    @Test
    void delete_NullPatient_ThrowsException() {
        assertThrows(IllegalArgumentException.class, () -> patientService.delete(null));
    }

    @Test
    void update_ValidPatient_ReturnsUpdatedPatient() throws SQLException {
        when(patientDAO.update(any(Patient.class))).thenReturn(testPatient);
        
        Patient updatedPatient = patientService.update(testPatient);
        
        assertNotNull(updatedPatient);
        verify(patientDAO, times(1)).update(testPatient);
    }

    @Test
    void update_NullPatient_ThrowsException() {
        assertThrows(IllegalArgumentException.class, () -> patientService.update(null));
    }
}
