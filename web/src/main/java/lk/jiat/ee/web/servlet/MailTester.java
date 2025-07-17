package lk.jiat.ee.web.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.ee.core.mail.VerificationMail;
import lk.jiat.ee.core.provider.MailServiceProvider;


import java.io.IOException;
import java.util.UUID;

@WebServlet("/mail")
public class MailTester extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = "sankaudeshika123@gmail.com";
        String verificationCode = UUID.randomUUID().toString();
        VerificationMail mail = new VerificationMail(email, verificationCode);
        MailServiceProvider.getInstance().sendMail(mail);
    }
}
