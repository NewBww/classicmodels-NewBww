package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@NamedQueries({
        @NamedQuery(name = "Product.FindAll", query = "SELECT p FROM Product p"),
        @NamedQuery(name = "Product.Count", query = "SELECT count(p) as count FROM Product p")
})
@Entity
@Table(name = "products")
@Getter
@Setter

public class Product {
    @Id
    private String productCode;
    private String productName;
    private String productLine;
    private String productScale;
    private String productVendor;
    private String productDescription;
    @Column(name = "quantityInStock")
    private Integer quantity;
    private BigDecimal buyPrice;
    private BigDecimal msrp;
}
