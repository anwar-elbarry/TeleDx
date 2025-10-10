package com.teleDx.service.user;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.teleDx.dao.User.UserDAOImpl;
import com.teleDx.entity.User;
import jakarta.inject.Inject;

import java.util.List;
import java.util.Optional;

public class UserServiceImpl implements UserService{

    @Inject
    private UserDAOImpl userDAO ;

    @Override
    public Optional<User> findById(String id) {
        return userDAO.findById(id);
    }

    @Override
    public List<User> findAll() {
        return userDAO.findAll();
    }

    @Override
    public User save(User user) {
        if (user.getPassword() != null){
            String hashedPassword = BCrypt.withDefaults().hashToString(12,user.getPassword().toCharArray());
            user.setPassword(hashedPassword);
        }
        return userDAO.save(user);
    }

    @Override
    public boolean deleteById(String id) {
        return userDAO.deletById(id);
    }

    @Override
    public boolean authenticate(String username, String password){
        Optional<User> userOpt = userDAO.findByUsername(username);
        if(userOpt.isPresent()){
            User user = userOpt.get();
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(),user.getPassword());
            return result.verified;
        }
        return false;
    }

    @Override
    public Optional<User> findByUsername(String username){
       return userDAO.findByUsername(username);
    }
}
