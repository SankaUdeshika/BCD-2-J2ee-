package lk.jiat.ee.ejb.bean;

import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.ee.core.dto.ResponseDto;
import lk.jiat.ee.core.model.Account;
import lk.jiat.ee.core.model.LogHistory;
import lk.jiat.ee.core.model.LogType;
import lk.jiat.ee.core.model.Transaction;
import lk.jiat.ee.core.remote.LogService;
import lk.jiat.ee.core.remote.TransferService;

import java.time.LocalDateTime;
import java.util.Date;

@Stateless
public class TransferSessionBean implements TransferService {


    @PersistenceContext
    private EntityManager em;


    @EJB
    private LogService logService;

    @Override
    public ResponseDto transfer(Account from, Account to, double amount) {
        ResponseDto responseDto = new ResponseDto();
        responseDto.setSuccess(false);
        responseDto.setMessage("Transfer UnSuccessful");

        //        get from account validatation
        double curruntFromAccountBallance = from.getBalance();

        if(curruntFromAccountBallance < amount) {
            responseDto.setSuccess(false);
            responseDto.setMessage("Not enough ballance in your account");
        }else{
            from.setBalance(curruntFromAccountBallance - amount);
            to.setBalance(to.getBalance() + amount);

            Transaction transaction = new Transaction(LocalDateTime.now(), from, to, amount);

            em.merge(from);
            em.merge(to);
            em.persist(transaction);

            Date now = new Date(); // current timestamp
            LogType type = LogType.TRANSACTION;
            LogHistory log = new LogHistory("Make Transactions", now, type);
            logService.addLog(log);


            responseDto.setSuccess(true);
            responseDto.setMessage("Transfer Successful");
        }
        return responseDto;
    }
}
