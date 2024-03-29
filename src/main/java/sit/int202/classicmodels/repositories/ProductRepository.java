package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import sit.int202.classicmodels.entities.Product;

import java.util.List;


public class ProductRepository {
    private EntityManager entityManager;
    private static int PAGE_SIZE = 10;

    public int getDefaultPageSize() {
        return PAGE_SIZE;
    }

    private EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        return entityManager;
    }
    //use for update
    public EntityTransaction getTransaction() {
        return getEntityManager().getTransaction();
    }

    public Product find(String productCode) {
        return getEntityManager().find(Product.class, productCode);
    }

    public List<Product> findAll(int page) {
        return findAll(page, PAGE_SIZE);
    }
    public List<Product> findAll(int page, int pageSize) {
        int startPosition = (page-1) * pageSize;
        EntityManager entityManager = getEntityManager();
        Query query = entityManager.createNamedQuery("Product.FindAll");
        query.setFirstResult(startPosition); query.setMaxResults(pageSize);
        List<Product> productList = query.getResultList();
        entityManager.close();
        return productList;
    }
    public int countAll() {
        EntityManager entityManager = getEntityManager();
        int number = ((Number)
                entityManager.createNamedQuery("Product.Count").getSingleResult()).intValue();
        entityManager.close();
        return number;
    }
}
