package com.teleDx.dao.User;

import com.teleDx.entity.Enums.RoleName;
import com.teleDx.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserDAO {
    User save(User user);
    Optional<User> findById(String id);
    List<User> findAll();
    void deletById(String id);
    boolean existsById(String id);

    Optional<User> findByUsername(String username);

    List<User> findByRole(RoleName roleName);

}
