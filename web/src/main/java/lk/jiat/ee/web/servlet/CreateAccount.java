package lk.jiat.ee.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.ee.core.ResponseDto;
import lk.jiat.ee.core.model.Account;
import lk.jiat.ee.core.model.Customer;
import lk.jiat.ee.core.remote.AccountService;
import lk.jiat.ee.core.remote.CustomerService;

import java.io.IOException;

@WebServlet("/user/createAccount")
public class CreateAccount extends HttpServlet {

    @EJB
    AccountService accountService;

    @EJB
    CustomerService customerService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String customer_Id = req.getParameter("customerId");
        String name = req.getParameter("customerName");
        double balance = Double.parseDouble(req.getParameter("balance"));

        ResponseDto responseDto =  accountService.addAccount(customer_Id,name,balance);
        System.out.println(responseDto.getMessage());

    }
}
