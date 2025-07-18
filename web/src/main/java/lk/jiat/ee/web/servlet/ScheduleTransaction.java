package lk.jiat.ee.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.ee.core.remote.AccountService;
import lk.jiat.ee.core.remote.SchduleTransactionService;

import java.io.IOException;


@WebServlet("/user/scheduleTransaction")
public class ScheduleTransaction extends HttpServlet {

    @EJB
    AccountService accountService;

    @EJB
    SchduleTransactionService schduleTransactionService;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("In doPost");

        String fromAccountId =  req.getParameter("fromAccount");
        String toAccountId =  req.getParameter("toAccount");
        String amount = req.getParameter("amount");
        String recurrence = req.getParameter("recurrence");

        String endOption = req.getParameter("endOption");
        String startDate = req.getParameter("startDate");

        System.out.println(recurrence);



        if(fromAccountId.isEmpty() || toAccountId.isEmpty() || amount.isEmpty()) {
            System.out.println("Plese Enter From Account ID and To Account ID and Amount");
            throw new ServletException("Please Enter From Account ID and To Account ID and Amount");
        }else{
          if(recurrence != null){
                // one time Transaction
              if(startDate.isEmpty()){
                  System.out.println("Please Enter Start Date");
                  throw new ServletException("Please Enter Start Date");
              }else{
                  schduleTransactionService.oneTimeAction(fromAccountId, toAccountId, amount, recurrence, endOption, startDate);
              }
          }else {
              // loop transaction
              throw new ServletException("Please Select a Schedule Options ");
          }
        }
        resp.sendRedirect(req.getContextPath() + "/home.jsp");

    }
}
