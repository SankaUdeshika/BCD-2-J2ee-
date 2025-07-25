package lk.jiat.ee.core.remote;

import jakarta.ejb.Remote;
import lk.jiat.ee.core.model.User;

@Remote
public interface UserService {

    public User getUserById(int id);
    public User getUserByEmail(String email);

    public void addUser(User user);
    public void updateUser(User user);
    public void deleteUser(int id);
    boolean validate(String email, String password);

}
