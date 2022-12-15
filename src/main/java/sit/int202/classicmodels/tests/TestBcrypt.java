package sit.int202.classicmodels.tests;

import at.favre.lib.crypto.bcrypt.BCrypt;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.repositories.CustomerRepository;

public class TestBcrypt {
    public static void main(String[] args) {
        CustomerRepository repository = new CustomerRepository();
        Customer c = repository.findByName("New Bww");
        System.out.println(c.getContactFirstName() + " : " + c.getPassword());
        BCrypt.Result result = BCrypt.verifyer().verify("49903New".toCharArray(), c.getPassword());
        System.out.println("Is password correct? : " + result.verified);

        result = BCrypt.verifyer().verify("abc123".toCharArray(), c.getPassword());
        System.out.println("Is password correct? : " + result.verified);
    }
}
