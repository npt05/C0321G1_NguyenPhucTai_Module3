package model.service.employeeService;

import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeService {
    List<Employee> selectAll() throws SQLException;
    void addNewEmployee(Employee employee) throws SQLException;
    Employee selectEmployeeById(int id) throws SQLException;
    boolean updateEmployee(int id,Employee employee) throws SQLException;
    boolean deleteEmployee(int id) throws SQLException;
}
