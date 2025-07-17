package lk.jiat.ee.core.model;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "loghistory")
@NamedQueries({
        @NamedQuery(name = "log.getAllHistory",query = "select c from Customer c "),
})
@Cacheable(false)
public class LogHistory implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Logid;
    private String Message;
    private Date Logdate;
    @Enumerated(EnumType.STRING)
    private LogType logType ;

    public LogHistory() {

    }

    public LogHistory(String message, Date logdate, LogType logType) {
        this.Message = message;
        this.Logdate = logdate;
        this.logType = logType;
    }

    public int getLogid() {
        return Logid;
    }

    public void setLogid(int logid) {
        Logid = logid;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String message) {
        Message = message;
    }

    public Date getLogdate() {
        return Logdate;
    }

    public void setLogdate(Date logdate) {
        Logdate = logdate;
    }

    public LogType getLogType() {
        return logType;
    }

    public void setLogType(LogType logType) {
        this.logType = logType;
    }
}
