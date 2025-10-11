package com.teleDx.service.user;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.teleDx.dao.user.UserDAOImpl;
import com.teleDx.entity.User;

import java.util.List;
import java.util.Optional;

public class UserServiceImpl implements UserService{

    private final UserDAOImpl userDAOImpl;

    public UserServiceImpl(UserDAOImpl userDAOImpl) {
        this.userDAOImpl = userDAOImpl;
    }

    @Override
    public Optional<User> findById(String id) {
        return userDAOImpl.findById(id);
    }

    @Override
    public List<User> findAll() {
        return userDAOImpl.findAll();
    }

    @Override
    public User save(User user) {
        if (user.getPassword() != null){
            String hashedPassword = BCrypt.withDefaults().hashToString(12,user.getPassword().toCharArray());
            user.setPassword(hashedPassword);
        }
        return userDAOImpl.save(user);
    }

    @Override
    public boolean deleteById(String id) {
        return userDAOImpl.deletById(id);
    }

    @Override
    public boolean authenticate(String username, String password){
        Optional<User> userOpt = userDAOImpl.findByUsername(username);
        if(userOpt.isPresent()){
            User user = userOpt.get();
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(),user.getPassword());
            return result.verified;
        }
        return false;
    }

    @Override
    public Optional<User> findByUsername(String username){
       return userDAOImpl.findByUsername(username);
    }
}
