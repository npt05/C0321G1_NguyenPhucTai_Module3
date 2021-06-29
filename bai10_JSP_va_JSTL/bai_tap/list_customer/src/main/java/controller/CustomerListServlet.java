package controller;

import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controller.CustomerListServlet",urlPatterns = "")
public class CustomerListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList());
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request,response);
    }
    public static List<Customer> customerList(){
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("codeGym","01/01/2001","Hà Nội","img/codegym.png"));
        customerList.add(new Customer("codeGym1","02/01/2001","Hà Nội","img/2.png"));
        customerList.add(new Customer("codeGym2","03/01/2001","HCM","img/3.png"));
        customerList.add(new Customer("codeGym3","04/01/2001","Đà Nẵng","img/4.jpg"));
        customerList.add(new Customer("codeGym4","05/01/2001","Đà Nẵng","img/5.png"));
        customerList.add(new Customer("codeGym5","06/01/2001","Đà Nẵng","img/6.png"));
        return customerList;
    }
}
