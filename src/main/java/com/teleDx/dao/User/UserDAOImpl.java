package com.teleDx.dao.User;

import com.teleDx.entity.Enums.RoleName;
import com.teleDx.entity.User;
import com.teleDx.util.JpaUtil;
import jakarta.persistence.*;

import java.util.List;
import java.util.Optional;

public class UserDAOImpl implements UserDAO{

    @Override
    public User save(User user){
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try{
            transaction.begin();
            if (user.getId() == null){
                em.persist(user);
            }else {
                user = em.merge(user);
            }
            transaction.commit();
            return user;
        }catch (Exception e){
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Error saving user: " + e.getMessage(), e);
        }
        finally {
            em.close();
        }
    }

    @Override
    public Optional<User> findById(String id) {
        EntityManager em = JpaUtil.getEntityManager();
        try{
            User user = em.find(User.class,id);
            return Optional.ofNullable(user);
        }finally {
            em.close();
        }
    }

    @Override
    public List<User> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        try{
            TypedQuery<User> query = em.createQuery("SELECT u FROM user u",User.class);
            return query.getResultList();
        }finally {
            em.close();
        }
    }

    @Override
    public void deletById(String id) {
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            User user = em.find(User.class, id);
            if (user != null) {
                em.remove(user);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Error deleting user: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public boolean existsById(String id) {
        return findById(id).isPresent();
    }

    @Override
    public Optional<User> findByUsername(String username) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.username = :username", User.class);
            query.setParameter("username", username);
            try {
                User user = query.getSingleResult();
                return Optional.of(user);
            } catch (NoResultException e) {
                return Optional.empty();
            }
        } finally {
            em.close();
        }    }

    @Override
    public List<User> findByRole(RoleName roleName) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.nom = :roleName", User.class);
            query.setParameter("roleName", roleName);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}
