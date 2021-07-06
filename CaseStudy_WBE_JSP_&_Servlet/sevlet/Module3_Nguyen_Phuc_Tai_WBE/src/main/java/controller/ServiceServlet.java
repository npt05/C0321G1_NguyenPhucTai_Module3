package controller;

import model.bean.Service;
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
import java.util.Map;

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {
    ServiceImpl serviceImpl = new ServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    addNewService(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    addNewServiceForm(request, response);
                    break;
                default:
                    listService(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }


    private void addNewServiceForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/create.jsp");
        dispatcher.forward(request, response);
    }

    private void addNewService(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String serviceCode = request.getParameter("serviceCode");
        String serviceName = request.getParameter("serviceName");
        int serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        Double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        int serviceMaxPeople = Integer.parseInt(request.getParameter("serviceMaxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        Double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloor = Integer.parseInt(request.getParameter("numberOfFloor"));
        Service service = new Service(serviceCode, serviceName, serviceArea, serviceCost, serviceMaxPeople, rentTypeId,
                serviceTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloor);
        Map<String, String> mapMess = serviceImpl.addNew(service);
        if (mapMess.isEmpty()) {
            response.sendRedirect("/service");
        } else {
            request.setAttribute("messServiceArea", mapMess.get("serviceArea"));
            request.setAttribute("messServiceCost", mapMess.get("serviceCost"));
            request.setAttribute("messServiceMaxPeople", mapMess.get("serviceMaxPeople"));
            request.setAttribute("messNumberOfFloor", mapMess.get("numberOfFloor"));
            request.setAttribute("messServiceCode", mapMess.get("serviceCode"));

            request.setAttribute("serviceCode", serviceCode);
            request.setAttribute("serviceName", serviceName);
            request.setAttribute("serviceArea", serviceArea);
            request.setAttribute("serviceCost", serviceCost);
            request.setAttribute("serviceMaxPeople", serviceMaxPeople);
            request.setAttribute("rentTypeId", rentTypeId);
            request.setAttribute("serviceTypeId", serviceTypeId);
            request.setAttribute("standardRoom", standardRoom);
            request.setAttribute("descriptionOtherConvenience", descriptionOtherConvenience);
            request.setAttribute("poolArea", poolArea);
            request.setAttribute("numberOfFloor", numberOfFloor);
            RequestDispatcher dispatcher = request.getRequestDispatcher("service/create.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void listService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Service> listService = serviceImpl.selectAll();
//        System.out.println(listService.get(1).getId());;
        request.setAttribute("listService", listService);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/list.jsp");
        dispatcher.forward(request, response);
    }
}