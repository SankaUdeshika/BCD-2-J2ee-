package lk.jiat.ee.core.model;


import jakarta.persistence.*;

import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "transactions")
@Cacheable(false)
public class Transaction implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int transaction_id;

    private LocalDateTime transaction_date;

    @ManyToOne
    @JoinColumn(name = "to_account")
    private Account toAccount;

    @ManyToOne
    @JoinColumn(name = "from_account")
    private Account fromAccount;

    private double amount;


    public Transaction() {

    }

    public Transaction(LocalDateTime date , Account toAccount, Account fromAccount, double amount) {
        this.transaction_date = date;
        this.toAccount = toAccount;
        this.fromAccount = fromAccount;
        this.amount = amount;
    }


    public int getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(int transaction_id) {
        this.transaction_id = transaction_id;
    }

    public LocalDateTime getTransaction_date() {
        return transaction_date;
    }

    public void setTransaction_date(LocalDateTime transaction_date) {
        this.transaction_date = transaction_date;
    }

    public Account getToAccount() {
        return toAccount;
    }

    public void setToAccount(Account toAccount) {
        this.toAccount = toAccount;
    }

    public Account getFromAccount() {
        return fromAccount;
    }

    public void setFromAccount(Account fromAccount) {
        this.fromAccount = fromAccount;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
}
