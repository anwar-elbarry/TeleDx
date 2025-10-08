package com.teleDx.entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

@Entity
@Table (name = "users")
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    protected String id;
    @Column(unique = true)
    protected String username;
    protected String password;
    @ManyToOne
    @JoinColumn(name = "role_id")
    protected Role role;

    public Users() {
    }

    public Users(String username, String password, Role role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }
}
