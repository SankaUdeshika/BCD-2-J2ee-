package lk.jiat.ee.core.remote;

import jakarta.ejb.Remote;
import lk.jiat.ee.core.model.LogHistory;

import java.util.List;

@Remote
public interface LogService {
    public void addLog(LogHistory logHistory);
    public List<LogHistory> getLogs();
    public List<LogHistory> getLogByType();

}
