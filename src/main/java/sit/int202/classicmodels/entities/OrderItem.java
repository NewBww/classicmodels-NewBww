package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.text.DecimalFormat;

@Entity
@Table(name = "orderdetails")
@Getter
@Setter
@ToString(of = {"orderLineNumber", "productCode", "quantityOrdered", "priceEach"})

public class OrderItem {
    @Id
    private String productCode;
    @Id
    private Integer orderNumber;
    private Integer orderLineNumber;
    @Column(name = "quantityOrdered")
    private Integer quantity;
    private BigDecimal priceEach;
    @Transient
    private Double total;

    @PostLoad
    private void onLoad() {
        DecimalFormat df = new DecimalFormat("#.00");
        this.total = Double.valueOf(df.format(priceEach.doubleValue() * Double.valueOf(quantity)));
    }
}
