package lk.jiat.ee.ejb.bean;

import jakarta.ejb.Singleton;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.ee.core.model.LogHistory;
import lk.jiat.ee.core.remote.LogService;

import java.util.List;

@Stateless
public class LogSessionBean implements LogService {

    @PersistenceContext(name = "APPPU")
    private EntityManager em;

    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void addLog(LogHistory log) {
        em.persist(log);
        System.out.println("Log Added: ");
    }

    @Override
    public List<LogHistory> getLogs() {
        return List.of();
    }

    @Override
    public List<LogHistory> getLogByType() {
        return List.of();
    }
}
