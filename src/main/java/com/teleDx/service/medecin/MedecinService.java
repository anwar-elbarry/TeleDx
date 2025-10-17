package com.teleDx.service.medecin;

import com.teleDx.entity.Medecin;

import java.util.List;
import java.util.Optional;

public interface MedecinService {
    List<Medecin> findBySpecialiteSortedByTarif(String specialite);
    List<String> listSpecialites();
    Optional<Medecin> findById(String id);
}


