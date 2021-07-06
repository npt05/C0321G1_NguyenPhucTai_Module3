package controller;

import model.bean.Customer;
import model.bean.Employee;
import model.service.employeeService.EmployeeService;
import model.service.employeeService.EmployeeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    private EmployeeServiceImpl employeeService = new EmployeeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    addNewEmployee(request, response);
                    break;
                case "edit":
                    updateEmployee(request, response);
                    break;
                case "delete":
                    deleteEmployee(request, response);
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
                    addNewEmployeeForm(request, response);
                    break;
                case "edit":
                    editEmployeeForm(request, response);
                    break;
                case "delete":
                    deleteEmployee(request, response);
                    break;
                case "view":
                    selectEmployee(request, response);
                    break;
                default:
                    listEmployee(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("employeeId"));
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        Double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String username = request.getParameter("username");
        Employee employee = new Employee(employeeName, employeeBirthday, employeeIdCard, employeePhone,
                employeeEmail, employeeAddress, employeeSalary, positionId, educationDegreeId, divisionId, username);
        employeeService.updateEmployee(id, employee);
        response.sendRedirect("/employee");
    }


    private void selectEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.selectEmployeeById(id);
        request.setAttribute("employee", employee);
        System.out.println(employee.getUsername());
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/view.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("employeeId"));
        employeeService.deleteEmployee(id);
        response.sendRedirect("/employee");
    }

    private void editEmployeeForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.selectEmployeeById(id);
        request.setAttribute("employee", employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void addNewEmployeeForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/create.jsp");
        dispatcher.forward(request, response);
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Employee> listEmployee = employeeService.selectAll();
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list.jsp");
        dispatcher.forward(request, response);
    }

    private void addNewEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        Double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String username = request.getParameter("username");
        Employee employee = new Employee(employeeName, employeeBirthday, employeeIdCard, employeePhone,
                employeeEmail, employeeAddress, employeeSalary, positionId, educationDegreeId, divisionId, username);
        employeeService.addNewEmployee(employee);
        response.sendRedirect("/employee");
    }
}