package lk.jiat.ee.ejb.bean;

import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
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
    @RolesAllowed({"ADMIN"})
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void deleteUser(int id) {
        User user =  getUserById(id);
        em.remove(user);
    }

    @Override
    public User getUserById(int id) {
           return em.find(User.class, id);
    }

    @Override
    public User getUserByEmail(String email) {
        User user =em.createNamedQuery("User.findByEmail", User.class).setParameter("email", email).getSingleResult();
        return user;
    }

    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
    public void addUser(User user) {
        em.persist(user);
        System.out.println(user.getName());
    }

    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
    public void updateUser(User user) {
        em.merge(user);
    }



    @Override
    public boolean validate(String email, String password) {
        User user = em.createNamedQuery("User.findByEmail", User.class).setParameter("email", email).getSingleResult();
        System.out.println("UserPassword : " + user.getPassword());
        return user != null && user.getPassword().equals(password);
    }
}
