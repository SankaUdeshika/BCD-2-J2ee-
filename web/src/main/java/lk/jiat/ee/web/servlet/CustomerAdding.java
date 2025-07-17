package lk.jiat.ee.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.ee.core.model.Customer;
import lk.jiat.ee.core.remote.CustomerService;

import java.io.IOException;




@WebServlet("/user/AddCustomer")
public class CustomerAdding extends HttpServlet {

    @EJB
    private CustomerService customerService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        Customer customer = new Customer(name, email,password, phone);

        System.out.println("Customer: " + customer.getName());
        if(customerService.saveCustomer(customer)){
            System.out.println("Customer Registerd: " + customer.getName());
            response.sendRedirect(request.getContextPath() + "/user/customerManage.jsp");
        }else{
            System.out.println("Customer Not Registerd: ");

        }



    }
}
