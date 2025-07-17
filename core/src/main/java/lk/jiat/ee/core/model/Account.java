package lk.jiat.ee.core.model;

import jakarta.persistence.*;

@Entity
@Table(name = "account")
@NamedQueries({
        @NamedQuery(name = "Account.findByAccountNo" , query = "SELECT a FROM Account a WHERE a.accountNumber=:accountNo")
})
@Cacheable(value = false)
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer accountNumber;
    private  double balance;
    @ManyToOne (cascade =  CascadeType.ALL)
    private Customer customer;

    public Integer getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(Integer accountNumber) {
        this.accountNumber = accountNumber;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
