package lk.jiat.ee.ejb.bean;

import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.ee.core.model.LogHistory;
import lk.jiat.ee.core.model.LogType;
import lk.jiat.ee.core.model.User;
import lk.jiat.ee.core.remote.UserService;

import java.util.Date;

@Stateless
public class UserSessionBean implements UserService {

    @PersistenceContext(name = "APPPU")
    private EntityManager em;


    @Override
    public void getUserById(int id) {

    }

    @Override
    public User getUserByEmail(String email) {
        User user =em.createNamedQuery("User.findByEmail", User.class).setParameter("email", email).getSingleResult();
        return user;
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

    @Override
    public boolean validate(String email, String password) {
        User user = em.createNamedQuery("User.findByEmail", User.class).setParameter("email", email).getSingleResult();
        System.out.println("UserPassword : " + user.getPassword());
        return user != null && user.getPassword().equals(password);
    }
}
