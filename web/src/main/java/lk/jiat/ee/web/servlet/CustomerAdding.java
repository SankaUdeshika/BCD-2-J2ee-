package lk.jiat.ee.web.servlet;

import jakarta.ejb.EJB;
import jakarta.inject.Inject;
import jakarta.security.enterprise.SecurityContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.ee.core.model.Customer;
import lk.jiat.ee.core.model.LogHistory;
import lk.jiat.ee.core.model.LogType;
import lk.jiat.ee.core.model.User;
import lk.jiat.ee.core.remote.CustomerService;
import lk.jiat.ee.core.remote.LogService;
import lk.jiat.ee.core.remote.UserService;

import java.io.IOException;
import java.util.Date;


@WebServlet("/user/AddCustomer")
public class CustomerAdding extends HttpServlet {

    @EJB
    private CustomerService customerService;

    @EJB
    UserService userService;

    @EJB
    private LogService logService;

    @Inject
    SecurityContext securityContext;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        Customer customer = new Customer(name, email,password, phone);

        System.out.println("Customer: " + customer.getName());
        if(customerService.saveCustomer(customer)){

            String userEmail = securityContext.getCallerPrincipal().getName();
            System.out.println("User email: " + userEmail);
            User user = userService.getUserByEmail(userEmail);

            String msg = user.getName()+" Added "+name+" as a Customer";
            Date now = new Date(); // current timestamp
            LogType type = LogType.ADD;
            LogHistory log = new LogHistory(msg, now, type);
            logService.addLog(log);

            System.out.println("Customer Registerd: " + customer.getName());
            response.sendRedirect(request.getContextPath() + "/user/customerManage.jsp");
        }else{
            System.out.println("Customer Not Registerd: ");

        }



    }
}
