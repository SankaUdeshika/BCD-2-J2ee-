package lk.jiat.ee.core.remote;

import jakarta.ejb.Remote;
import lk.jiat.ee.core.dto.ResponseDto;
import lk.jiat.ee.core.model.Account;

@Remote
public interface TransferService {

    public ResponseDto transfer(Account from, Account to, double amount);

}
