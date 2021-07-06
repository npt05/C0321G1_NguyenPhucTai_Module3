package controller;

import model.bean.Customer;
import model.service.customerService.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private CustomerServiceImpl customerService = new CustomerServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    addNewCustomer(request, response);
                    break;
                case "edit":
                    updateCustomer(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    addNewCustomerForm(request, response);
                    break;
                case "edit":
                    editCustomerForm(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                case "view":
                    selectCustomer(request, response);
                    break;
                default:
                    listCustomer(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("customerId"));
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        int customerGenderId = Integer.parseInt(request.getParameter("customerGender"));
        String customerCode = request.getParameter("customerCode");
        Customer customer = new Customer(customerName, customerBirthday, customerIdCard, customerPhone,
                customerEmail, customerAddress, customerTypeId, customerGenderId, customerCode);
        customerService.updateCustomer(id, customer);
        response.sendRedirect("/customer");
    }


    private void selectCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.selectCustomerById(id);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/view.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("customerId"));
        customerService.deleteCustomer(id);
        response.sendRedirect("/customer");
    }

    private void editCustomerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.selectCustomerById(id);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void addNewCustomerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        dispatcher.forward(request, response);
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Customer> listCustomer = customerService.selectAll();
        request.setAttribute("listCustomer", listCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }

    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        int customerGenderId = Integer.parseInt(request.getParameter("customerGenderId"));
        String customerCode = request.getParameter("customerCode");
        Customer customer = new Customer(customerName, customerBirthday, customerIdCard, customerPhone,
                customerEmail, customerAddress, customerTypeId, customerGenderId, customerCode);
        Map<String, String> mapMess = customerService.addNewCustomer(customer);
        if (mapMess.isEmpty()) {
            response.sendRedirect("/customer");
        } else {
            request.setAttribute("MessCustomerCode", mapMess.get("customerCode"));
            request.setAttribute("MessPhone", mapMess.get("phone"));
            request.setAttribute("MessIdCard", mapMess.get("idCard"));
            request.setAttribute("MessEmail", mapMess.get("email"));

            request.setAttribute("name", customer.getName());
            request.setAttribute("birthday", customer.getBirthday());
            request.setAttribute("email", customer.getEmail());
            request.setAttribute("phone", customer.getPhone());
            request.setAttribute("idCard", customer.getIdCard());
            request.setAttribute("email", customer.getEmail());
            request.setAttribute("address", customer.getAddress());
            request.setAttribute("customerCode", customer.getCustomerCode());
            request.setAttribute("customerTypeId", customer.getCustomerTypeId());
            request.setAttribute("customerGenderId", customer.getCustomerGenderId());

            RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
            dispatcher.forward(request, response);
        }
    }
}