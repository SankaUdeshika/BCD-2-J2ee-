package lk.jiat.ee.web.servlet;

import jakarta.ejb.EJB;
import jakarta.inject.Inject;
import jakarta.security.enterprise.SecurityContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.HttpConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.ee.core.model.LogHistory;
import lk.jiat.ee.core.model.LogType;
import lk.jiat.ee.core.model.User;
import lk.jiat.ee.core.remote.CustomerService;
import lk.jiat.ee.core.remote.LogService;
import lk.jiat.ee.core.remote.UserService;

import java.io.IOException;
import java.util.Date;

@WebServlet("/user/DeactivateCustomer")
@ServletSecurity(@HttpConstraint(rolesAllowed = {"ADMIN"}))
public class CustomerDeactivate extends HttpServlet {

    @EJB
    private CustomerService customerService;

    @EJB
    private LogService logService;

    @EJB
    private UserService userService;
    @Inject
    SecurityContext securityContext;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String customerId =  req.getParameter("id");

        System.out.println(customerId+" is the Customer ID");
        if(customerService.deactivateCustomer(customerId)){

            String userEmail = securityContext.getCallerPrincipal().getName();
            System.out.println("User email: " + userEmail);
            User user = userService.getUserByEmail(userEmail);

            String msg = user.getName()+" Delete a customer ";
            Date now = new Date(); // current timestamp
            LogType type = LogType.ADD;
            LogHistory log = new LogHistory(msg, now, type);
            logService.addLog(log);


            System.out.println("Customer deactivated");
            resp.sendRedirect("customerManage.jsp");
        }else{
            System.out.println("Customer not deactivated");
        }
    }
}
