package com.teleDx.service.consultation;

import com.teleDx.entity.Consultation;

import java.util.List;
import java.util.Optional;

public interface ConsultationService {
    Consultation save(Consultation consultation);
    Optional<Consultation> findById(String id);
    List<Consultation> findByPatientId(String patientId);
    Consultation update(Consultation consultation);
}


