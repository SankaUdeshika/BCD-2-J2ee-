package lk.jiat.ee.ejb.bean;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.ee.core.model.User;
import lk.jiat.ee.core.remote.UserService;

@Stateless
public class UserSessionBean implements UserService {

    @PersistenceContext
    private EntityManager em;


    @Override
    public void getUserById(int id) {

    }

    @Override
    public void getUserByEmail(String email) {

    }

    @Override
    public void addUser(User user) {
        em.persist(user);
        System.out.println(user.getName());
    }

    @Override
    public void updateUser(User user) {

    }

    @Override
    public void deleteUser(int id) {

    }
}
