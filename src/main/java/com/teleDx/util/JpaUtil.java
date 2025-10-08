package com.teleDx.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.hibernate.collection.spi.PersistentIdentifierBag;

public class JpaUtil {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("teledxPU");

    public static EntityManager getEntityManagerFactory() {
        return emf.createEntityManager();
    }

    public static void closeEntityManagerFactory() {
        emf.close();
    }
}
