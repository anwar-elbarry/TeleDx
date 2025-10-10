package com.teleDx.service.user;

import com.teleDx.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    Optional<User> findById(String id);
    Optional<User> findByUsername(String username);
    List<User> findAll();
    User save(User user);
    boolean deleteById(String id);
    boolean authenticate(String username, String password);
}
