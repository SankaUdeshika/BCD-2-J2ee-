package lk.jiat.ee.core.remote;

import jakarta.ejb.Remote;
import lk.jiat.ee.core.dto.ResponseDto;
import lk.jiat.ee.core.model.Account;

import java.util.List;

@Remote
public interface AccountService {
    public Account getAccountById(int id);
    public List<Account> getAccountList();
    public ResponseDto addAccount(String customerId, String customerName, double balance);
}
