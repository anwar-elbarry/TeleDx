package com.teleDx.dao.role;

import com.teleDx.entity.Enums.RoleName;
import com.teleDx.entity.Role;
import com.teleDx.util.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.servlet.ServletException;

import java.io.IOException;

public class RoleDAOImpl implements RoleDAO{
    @Override
    public Role save(String name){
       EntityManager em =  JpaUtil.getEntityManager();
       EntityTransaction transaction = em.getTransaction();
       try {
           transaction.begin();
           Role role = new Role(RoleName.valueOf(name));
           em.persist(role);
           transaction.commit();
           return role;
       }catch (Exception e){
           if (transaction.isActive()) {
               transaction.rollback();
           }
           throw new RuntimeException("Error saving role: " + e.getMessage(), e);
       }finally {
           em.close();
       }
    }

    @Override
    public Role findByName(RoleName roleName) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            Role role = em.createQuery("SELECT r FROM Role r WHERE r.nom = :roleName", Role.class)
                    .setParameter("roleName", roleName)
                    .getSingleResult();
            return role;
        } catch (Exception e) {
            throw new RuntimeException("Error finding role: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }
}
