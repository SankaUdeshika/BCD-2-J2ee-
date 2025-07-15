package lk.jiat.ee.ejb.bean;

import jakarta.ejb.Stateless;
import lk.jiat.ee.core.remote.UserService;

@Stateless
public class UserSessionBean implements UserService {
    @Override
    public void test() {
        System.out.println("test");
    }
}
