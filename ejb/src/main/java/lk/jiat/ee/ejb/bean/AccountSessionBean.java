package lk.jiat.ee.ejb.bean;

import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.ee.core.dto.ResponseDto;
import lk.jiat.ee.core.model.Account;
import lk.jiat.ee.core.model.Customer;
import lk.jiat.ee.core.remote.AccountService;
import lk.jiat.ee.core.remote.CustomerService;

import java.util.List;
import java.util.Random;

@Stateless
public class AccountSessionBean implements AccountService {

    @PersistenceContext
    private EntityManager em;

    @EJB
    CustomerService customerService;

    @EJB
    AccountService accountService;

    @Override
    public Account getAccountById(int id) {
        try{
            return em.createNamedQuery("Account.findByAccountNo", Account.class).setParameter("accountNo", id).getSingleResult();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;

        }
    }

    @Override
    public List<Account> getAccountList() {
       return em.createNamedQuery("Account.findByAccount", Account.class).getResultList();
    }

    @Override
    public ResponseDto addAccount(String customerId,String customerName,double balance) {
        ResponseDto responseDto = new ResponseDto();
        responseDto.setSuccess(false);
        responseDto.setMessage("false");

        Customer customer = customerService.getCustomerById(customerId);
        if(customer == null){
            responseDto.setSuccess(false);
            responseDto.setMessage("No Such Customer");
        }else{
//
            if(customerName.equals(customer.getName())){
                int accountNumber ;
                Random random = new Random();
                do{
                    accountNumber =100000+ random.nextInt(90000000);
                    System.out.println(String.valueOf(accountNumber));

                }while (accountService.getAccountById(accountNumber) != null);

                Account account = new Account(accountNumber,balance,customer);
                account.setAccountNumber(accountNumber);
                em.persist(account);

                responseDto.setSuccess(true);
                responseDto.setMessage("Account Added");
            }else{
                responseDto.setSuccess(false);
                responseDto.setMessage("Wrong Customer Name");
            }
        }
        return  responseDto;
    }
}
