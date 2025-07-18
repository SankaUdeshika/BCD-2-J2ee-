package lk.jiat.ee.core.remote;

import jakarta.ejb.EJB;
import jakarta.ejb.Remote;
import lk.jiat.ee.core.ResponseDto;
import lk.jiat.ee.core.model.Account;

import java.util.List;

@Remote
public interface AccountService {
    public Account getAccount(int id);
    public ResponseDto addAccount(String customerId, String customerName, double balance);
}
