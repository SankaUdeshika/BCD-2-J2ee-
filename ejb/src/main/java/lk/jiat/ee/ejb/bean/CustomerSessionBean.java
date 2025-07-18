package lk.jiat.ee.ejb.bean;

import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import lk.jiat.ee.core.model.Customer;
import lk.jiat.ee.core.model.User;
import lk.jiat.ee.core.remote.CustomerService;

import java.util.List;

@Stateless
public class CustomerSessionBean implements CustomerService {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Customer getCustomerById(String customerId) {
        try {
            return em.createNamedQuery("Customer.findById", Customer.class)
                    .setParameter("cid", Integer.parseInt(customerId))
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    public Customer getCustomerByEmail(String customerEmail) {
        try {
            return em.createNamedQuery("Customer.findByEmail", Customer.class)
                    .setParameter("email", customerEmail)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    @Override
    public List<Customer> getAllCustomers() {
        return  em.createNamedQuery("Customer.getAllCustomers", Customer.class).getResultList();
    }

    @Override
    public boolean saveCustomer(Customer customer) {
      Customer customer1 =   getCustomerByEmail(customer.getEmail());
      if(customer1 != null){
          System.out.println("Already Registerd Customer :- "+customer1.getName());
          return false;
      }else{
          System.out.println("Registered Customer :- "+customer.getName());
          em.persist(customer);
          return true;
      }
    }

    @Override
    public void updateCustomer(Customer customer) {

    }

    @Override
    public void deleteCustomer(String customerId) {

    }

    @Override
    public boolean deactivateCustomer(String customerId) {
       try{
           em.remove(em.createNamedQuery("Customer.findById", Customer.class).setParameter("cid", Integer.parseInt(customerId)).getSingleResult());
           System.out.println("Deactivated Customer :- "+customerId);
           return true;
       }catch (Exception e){
           e.printStackTrace();
           return false;
       }
    }
}
