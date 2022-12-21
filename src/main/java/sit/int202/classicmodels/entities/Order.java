package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "orders")
@Getter
@Setter
@ToString(of = {"orderNumber", "orderDate", "requiredDate", "shippedDate", "status", "comments", "customerNumber"})

@NamedQueries({
        @NamedQuery(name = "Order.FIND_ORDER",
                query = "select o from Order o where o.customerNumber = :customerNumber")
})

public class Order {
    @Id
    private Integer orderNumber;
    private Date orderDate;
    private Date requiredDate;
    private Date shippedDate;
    private String status;
    private String comments;
    private Integer customerNumber;
    @OneToMany(mappedBy = "orderNumber")
    private List<OrderItem> orderItemList;
}