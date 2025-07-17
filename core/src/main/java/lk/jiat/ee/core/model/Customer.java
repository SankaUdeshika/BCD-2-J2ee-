package lk.jiat.ee.core.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "customers")
@NamedQueries({
        @NamedQuery(name = "Customer.findById",query = "select c from Customer c where c.cid =:cid"),
        @NamedQuery(name = "Customer.findByEmail",query = "select c from Customer c where c.email =:email"),
        @NamedQuery(name = "Customer.getAllCustomers",query = "select c from Customer c "),
})
@Cacheable(value = false)
public class Customer implements java.io.Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cid;
    private String name;
    private String email;
    private String password;
    private String phone;

    public Customer() {

    }

    public Customer(String name,String email,String password,String phone) {
        this.name=name;
        this.email=email;
        this.password=password;
        this.phone=phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @OneToMany(mappedBy = "customer")
    private List<Account> accounts =  new ArrayList<>();

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }
}
