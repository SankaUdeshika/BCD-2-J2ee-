package lk.jiat.ee.ejb.bean;

import jakarta.ejb.EJB;
import jakarta.ejb.Schedule;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.ee.core.dto.InterestDto;
import lk.jiat.ee.core.model.Account;
import lk.jiat.ee.core.model.LogHistory;
import lk.jiat.ee.core.model.LogType;
import lk.jiat.ee.core.remote.AccountService;
import lk.jiat.ee.core.remote.LogService;

import java.util.Date;
import java.util.List;

@Stateless
public class TimerSessionBean {

    @PersistenceContext
    private EntityManager em;

    @EJB
    private AccountService accountService;

    @EJB
    private LogService logService;



    @Schedule(hour = "0", minute = "0",second = "0",persistent = false)
    public void applyDailyInterest() {
        System.out.println("Apply daily interest");

        double interest = new InterestDto().getIntrestRate();//5%

        List<Account> accountList = accountService.getAccountList();
        for (Account account : accountList) {
            double interestValue = account.getBalance() * interest / 365;
            account.setBalance(account.getBalance() + interest);
            em.merge(account);

        }
        Date now = new Date();
        LogType type = LogType.ADD_INTEREST;
        LogHistory log = new LogHistory(String.valueOf(now)+"Interest Adding Success", now, type);
        logService.addLog(log);
    }

}
