package sit.int202.classicmodels.tests;

import sit.int202.classicmodels.entities.Product;
import sit.int202.classicmodels.repositories.ProductRepository;

import java.util.List;

public class TestProduct {
    public static void main(String[] args) {
        ProductRepository repository = new ProductRepository();
        List<Product> productList = repository.findAll(1, 15);
        System.out.println("page 1 of " + repository.countAll()/15);
        for (Product product : productList) {
            System.out.println(product.getProductCode() +
                    ": " + product.getProductName() + " - " + product.getProductLine());
        }
    }
}
