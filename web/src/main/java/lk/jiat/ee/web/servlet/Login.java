package lk.jiat.ee.web.servlet;

import jakarta.ejb.EJB;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.security.enterprise.AuthenticationStatus;
import jakarta.security.enterprise.SecurityContext;
import jakarta.security.enterprise.authentication.mechanism.http.AuthenticationParameters;
import jakarta.security.enterprise.credential.UsernamePasswordCredential;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.ee.core.model.User;
import lk.jiat.ee.core.remote.UserService;
import org.w3c.dom.ls.LSOutput;

import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {


    @Inject
    SecurityContext securityContext;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");




        AuthenticationParameters parameters = AuthenticationParameters.withParams()
                .credential(new UsernamePasswordCredential(email, password));
        AuthenticationStatus status = securityContext.authenticate(req,resp,parameters);

        System.out.println("Authentication status: " + status);

        if(status == AuthenticationStatus.SUCCESS) {
            resp.sendRedirect(req.getContextPath() + "/home.jsp");
        }else{
            resp.sendRedirect(req.getContextPath() + "/index.jsp?error=Please+try+again+later");
        }
    }
}
