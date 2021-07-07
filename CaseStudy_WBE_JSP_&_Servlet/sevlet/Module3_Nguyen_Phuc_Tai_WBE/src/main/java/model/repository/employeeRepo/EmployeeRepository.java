package model.repository.employeeRepo;

import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeRepository {
    void addNewEmployee(Employee employee) throws SQLException;

    Employee selectEmployeeById(int id) throws SQLException;

    List<Employee> selectAllEmployee() throws SQLException;

    boolean deleteEmployee(int id) throws SQLException;

    boolean updateEmployee(int id,Employee employee) throws SQLException;

}
