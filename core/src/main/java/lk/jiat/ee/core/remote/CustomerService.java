package lk.jiat.ee.core.remote;

import jakarta.ejb.Remote;
import lk.jiat.ee.core.model.Customer;

@Remote
public interface CustomerService {

    public Customer getCustomerById(String customerId);
    public Customer getCustomerByEmail(String customerEmail);

    public boolean saveCustomer(Customer customer);
    public void updateCustomer(Customer customer);
    public void deleteCustomer(String customerId);

}
