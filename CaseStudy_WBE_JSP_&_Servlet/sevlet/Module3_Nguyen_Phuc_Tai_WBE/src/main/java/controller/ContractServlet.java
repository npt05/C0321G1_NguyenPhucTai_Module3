package controller;

import model.bean.Contract;
import model.bean.Customer;
import model.bean.Employee;
import model.bean.Service;
import model.service.contractDetailService.ContractDetailServiceImpl;
import model.service.contractService.ContractServiceImpl;
import model.service.customerService.CustomerServiceImpl;
import model.service.employeeService.EmployeeServiceImpl;
import model.service.serivceInterface.ServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {
    private ContractServiceImpl contractService = new ContractServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    addNewContract(request, response);
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
                    addNewContractForm(request, response);
                    break;
                default:
                    listContract(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }


    }

    private void addNewContractForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/create.jsp");
        dispatcher.forward(request, response);
    }

    private void addNewContract(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        double totalMoney = Double.parseDouble(request.getParameter("totalMoney"));
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));

        Contract contract = new Contract(startDate, endDate, deposit, totalMoney, employeeId, customerId
                , serviceId);
        contractService.addNewContract(contract);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/list.jsp");
        dispatcher.forward(request, response);
    }
    private void listContract(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Customer> listCustomer =contractService.selectCustomerAndContractInfo();
        request.setAttribute("listCustomer",listCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/list.jsp");
        dispatcher.forward(request, response);
    }
}