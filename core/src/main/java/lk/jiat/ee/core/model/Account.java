package lk.jiat.ee.core.model;

import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "account")
@NamedQueries({
        @NamedQuery(name = "Account.findByAccountNo" , query = "SELECT a FROM Account a WHERE a.accountNumber=:accountNo"),
        @NamedQuery(name = "Account.findByAccount" , query = "SELECT a FROM Account a ")
})
@Cacheable(value = false)
public class Account implements Serializable {
    @Id
    private Integer accountNumber;
    private  double balance;
    @ManyToOne (cascade =  CascadeType.ALL)
    private Customer customer;

    public Account() {

    }

    public Account(Integer accountNumber,double balance, Customer customer) {
        this.balance = balance;
        this.customer = customer;
        accountNumber = accountNumber;
    }


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
