package model.service.employeeService;

import model.bean.Employee;
import model.repository.employeeRepo.EmployeeRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {
    private EmployeeRepositoryImpl employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> selectAll() throws SQLException {
        return employeeRepository.selectAllEmployee();
    }

    @Override
    public void addNewEmployee(Employee employee) throws SQLException {
        employeeRepository.addNewEmployee(employee);
    }

    @Override
    public Employee selectEmployeeById(int id) throws SQLException {
        return employeeRepository.selectEmployeeById(id);
    }

    @Override
    public boolean updateEmployee(int id, Employee employee) throws SQLException {
        return employeeRepository.updateEmployee(id, employee);
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return employeeRepository.deleteEmployee(id);
    }
}