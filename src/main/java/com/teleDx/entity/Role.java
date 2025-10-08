package com.teleDx.entity;

import com.teleDx.entity.Enums.RoleName;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "role")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;
    private RoleName nom; // INFIRMIER, GENERALISTE, SPECIALISTE

    @OneToMany(mappedBy = "role")
    private List<User> users;
}
