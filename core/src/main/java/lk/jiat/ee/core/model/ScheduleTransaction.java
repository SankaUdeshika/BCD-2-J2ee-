package lk.jiat.ee.core.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "scheduleTransaction")
@NamedQueries({
        @NamedQuery(name = "SheduleTransfer.findById" , query = "SELECT s FROM ScheduleTransaction s WHERE s.ScheduleId=:sid"),
})
@Cacheable(value = false)
public class ScheduleTransaction {
    @Id
    private String ScheduleId;
    @ManyToOne
    private Account fromAccont;
    @ManyToOne
    private Account toAccont;
    private double amount;
    private LocalDateTime transaction_date;
    private String scheduleType;


    public ScheduleTransaction() {

    }

    public ScheduleTransaction(String ScheduleId, Account fromAccount, Account toAccount, double amount, LocalDateTime transaction_date, String scheduleType) {
        this.ScheduleId = ScheduleId;
        this.fromAccont = fromAccount;
        this.toAccont = toAccount;
        this.amount = amount;
    }

    public String getScheduleId() {
        return ScheduleId;
    }

    public void setScheduleId(String scheduleId) {
        ScheduleId = scheduleId;
    }

    public Account getFromAccont() {
        return fromAccont;
    }

    public void setFromAccont(Account fromAccont) {
        this.fromAccont = fromAccont;
    }

    public Account getToAccont() {
        return toAccont;
    }

    public void setToAccont(Account toAccont) {
        this.toAccont = toAccont;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public LocalDateTime getTransaction_date() {
        return transaction_date;
    }

    public void setTransaction_date(LocalDateTime transaction_date) {
        this.transaction_date = transaction_date;
    }

    public String getScheduleType() {
        return scheduleType;
    }

    public void setScheduleType(String scheduleType) {
        this.scheduleType = scheduleType;
    }
}
