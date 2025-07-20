package lk.jiat.ee.ejb.bean;

import jakarta.annotation.Resource;
import jakarta.ejb.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import lk.jiat.ee.core.model.*;
import lk.jiat.ee.core.remote.AccountService;
import lk.jiat.ee.core.remote.LogService;
import lk.jiat.ee.core.remote.SchduleTransactionService;
import lk.jiat.ee.core.remote.TransferService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Stateless
public class ScheduleTransferSessionBean implements SchduleTransactionService {
    @PersistenceContext
    private EntityManager em;

    @EJB
    private AccountService accountService;
    @EJB
    private TransferService transferService;
    @EJB
    private LogService logService;
    @Resource
    private TimerService timerService;
    @Override
    public void oneTimeAction(String fromAccount, String toAccount, String amount, String recurrence, String endOption, String startDate) {
        Account fromAccountObject = accountService.getAccountById(Integer.parseInt(fromAccount));
        Account toAccountObject = accountService.getAccountById(Integer.parseInt(toAccount));

        if (fromAccountObject != null && toAccountObject != null) {
            LocalDate date = LocalDate.parse(startDate);
            LocalDateTime dateTime = date.atStartOfDay();

            int Sid;
            Random random = new Random();
            do {
                Sid = 100000 + random.nextInt(90000000);
            } while (getScheduleTransactions(String.valueOf(Sid)) != null);

            ScheduleTransaction scheduleTransaction = new ScheduleTransaction(
                    String.valueOf(Sid), fromAccountObject, toAccountObject,
                    Double.parseDouble(amount), dateTime, recurrence
            );
            em.persist(scheduleTransaction);

            TimerConfig config = new TimerConfig();
            config.setPersistent(true);
            config.setInfo(Sid);

            ScheduleExpression schedule = new ScheduleExpression()
                    .hour(0).minute(0).second(0);

            switch (recurrence) {
                case "ONETIME":
                    schedule
                            .year(date.getYear())
                            .month(date.getMonthValue())
                            .dayOfMonth(date.getDayOfMonth());
                    break;

                case "WEEKLY":
                    schedule.dayOfWeek("Fri"); // Every Friday
                    break;

                case "MONTHLY":
                    schedule.dayOfMonth(1); // 1st of every month
                    break;

                case "YEARLY":
                    schedule
                            .month(1)
                            .dayOfMonth(1); // Jan 1st every year
                    break;

                default:
                    return; // Invalid recurrence
            }

            timerService.createCalendarTimer(schedule, config);
        }
    }

    @Timeout
    public void handleTimOut(Timer timer) {
        ScheduleTransaction transaction = getScheduleTransactions(String.valueOf(timer.getInfo()));

        if (transaction == null) return;

        Account from = transaction.getFromAccont();
        Account to = transaction.getToAccont();
        double amount = transaction.getAmount();

        double currentBalance = from.getBalance();

        if (currentBalance >= amount) {
            from.setBalance(currentBalance - amount);
            to.setBalance(to.getBalance() + amount);

            em.merge(from);
            em.merge(to);

            transferService.transfer(from, to, amount);

            LogHistory log = new LogHistory("Make Transactions", new Date(), LogType.TRANSACTION);
            logService.addLog(log);
        }
    }

    @Override
    public ScheduleTransaction getScheduleTransactions(String Sid) {
        try {
            return em.createNamedQuery("SheduleTransfer.findById", ScheduleTransaction.class)
                    .setParameter("sid", Sid)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
