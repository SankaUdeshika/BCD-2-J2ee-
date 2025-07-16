package lk.jiat.ee.core.remote;

import jakarta.ejb.Remote;
import lk.jiat.ee.core.model.User;

@Remote
public interface UserService {

    public void getUserById(int id);
    public void getUserByEmail(String email);

    public void addUser(User user);
    public void updateUser(User user);
    public void deleteUser(int id);


}
