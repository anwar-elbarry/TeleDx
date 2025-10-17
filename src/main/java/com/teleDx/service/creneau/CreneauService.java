package com.teleDx.service.creneau;

import com.teleDx.entity.Creneau;

import java.util.List;

public interface CreneauService {
    List<Creneau> listForSpecialiste(String specialisteId);
    List<Creneau> listDisponiblesForSpecialiste(String specialisteId);
    void reserver(String creneauId);
}


