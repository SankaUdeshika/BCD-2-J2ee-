package lk.jiat.ee.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.ee.core.dto.ResponseDto;
import lk.jiat.ee.core.model.Account;
import lk.jiat.ee.core.remote.AccountService;
import lk.jiat.ee.core.remote.TransferService;

import java.io.IOException;

@WebServlet("/user/transfer")
public class TransferMoney extends HttpServlet {

    @EJB
    TransferService transferService;

    @EJB
    AccountService accountService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String fromAccount = req.getParameter("fromAccount");
        String toAcccount = req.getParameter("toAcccount");
        String amount = req.getParameter("amount");

        Account fromAccountObject = accountService.getAccountById(Integer.parseInt(fromAccount));
        Account ToAccountObject = accountService.getAccountById(Integer.parseInt(toAcccount));

        if(fromAccountObject == null) {
            System.out.println("from Account Object is null");
        }else if (ToAccountObject == null) {
            System.out.println("to Acccount Object is null");
        }else{

            ResponseDto responseDto =  transferService.transfer(fromAccountObject,ToAccountObject,Double.parseDouble(amount));

            if(responseDto.isSuccess()){
                System.out.println("transfer success");
                resp.sendRedirect(req.getContextPath()+"/home.jsp");
            }else{
                System.out.println(responseDto.getMessage());
                throw new ServletException(responseDto.getMessage());
            }

        }







    }
}
