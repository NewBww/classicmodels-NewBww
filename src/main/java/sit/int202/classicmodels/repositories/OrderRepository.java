package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import sit.int202.classicmodels.entities.Office;
import sit.int202.classicmodels.entities.Order;
import sit.int202.classicmodels.entities.OrderItem;

import java.text.DecimalFormat;
import java.util.List;

public class OrderRepository {
    private EntityManager entityManager;

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


    public List<Order> findAll(int customerNumber) {
        EntityManager entityManager = getEntityManager();
        Query query = entityManager.createNamedQuery("Order.FIND_ORDER");
        query.setParameter("customerNumber", customerNumber);
        List order = query.getResultList();
        entityManager.close();
        return order;
    }
    public Order findOrder(Integer orderNumber) {
        return getEntityManager().find(Order.class, orderNumber);
    }
    public String getTotalPrice(Integer orderNumber) {
        DecimalFormat df = new DecimalFormat("#.00");
        return df.format(findOrder(orderNumber).getOrderItemList().stream().mapToDouble(OrderItem::getTotal).sum());
    }
}
