package com.teleDx.entity;

import com.teleDx.entity.Enums.RoleName;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "role")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Enumerated(EnumType.STRING)
    private RoleName nom; // INFIRMIER, GENERALISTE, SPECIALISTE

    @OneToMany(mappedBy = "role")
    private List<User> users;

    public Role() {
    }

    public Role(RoleName nom) {
        this.nom = nom;
    }

    public RoleName getNom() {
        return nom;
    }

    public Long getId() {
        return id;
    }
}
