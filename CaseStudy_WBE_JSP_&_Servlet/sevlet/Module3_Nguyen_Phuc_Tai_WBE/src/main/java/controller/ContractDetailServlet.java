package controller;

import model.bean.Contract;
import model.bean.ContractDetail;
import model.service.contractDetailService.ContractDetailServiceImpl;
import model.service.contractService.ContractServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ContractDetailServlet", urlPatterns = "/contractDetail")
public class ContractDetailServlet extends HttpServlet {
    ContractDetailServiceImpl contractDetailService = new ContractDetailServiceImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    addNewContractDetail(request, response);
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
                    addNewContractDetailForm(request, response);
                    break;
                default:
                    listContract(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void addNewContractDetailForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("contractDetail/create.jsp");
        dispatcher.forward(request, response);
    }

    private void addNewContractDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int contractId = Integer.parseInt(request.getParameter("contractId"));
        int attachServiceId = Integer.parseInt(request.getParameter("attachServiceId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        ContractDetail contractDetail = new ContractDetail(contractId, attachServiceId, quantity);
        contractDetailService.addNewContractDetail(contractDetail);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/list.jsp");
        dispatcher.forward(request, response);
    }

    private void listContract(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/list.jsp");
        dispatcher.forward(request, response);
    }
}