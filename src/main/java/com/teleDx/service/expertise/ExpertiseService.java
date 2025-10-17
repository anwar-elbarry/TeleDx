package com.teleDx.service.expertise;

import com.teleDx.entity.Expertise;

import java.util.Optional;

public interface ExpertiseService {
    Expertise save(Expertise expertise);
    Expertise update(Expertise expertise);
    Optional<Expertise> findById(String id);
}


