package lk.jiat.ee.core.remote;

import jakarta.ejb.Remote;
import lk.jiat.ee.core.model.Account;
import lk.jiat.ee.core.model.ScheduleTransaction;
import lk.jiat.ee.core.model.Transaction;

import java.util.List;

@Remote
public interface SchduleTransactionService {
    public void oneTimeAction(String fromAccount, String toAccount, String amount,String recurrence,String endOption,String startDate);
    public ScheduleTransaction getScheduleTransactions(String Sid);
}
