package model.repository.employeeRepo;

import model.bean.Employee;
import model.repository.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {
    private static final String SELECT_ALL_EMPLOYEE_SP = "call SELECT_ALL_EMPLOYEE()";
    private static final String ADD_NEW_EMPLOYEE_SP = "call ADD_NEW_EMPLOYEE(?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_EMPLOYEE_BY_ID_SP = "call SELECT_EMPLOYEE_BY_ID(?)";
    private static final String DELETE_EMPLOYEE_BY_ID_SP = "call DELETE_EMPLOYEE_BY_ID(?)";
    private static final String UPDATE_EMPLOYEE_BY_ID_SP = "call UPDATE_EMPLOYEE_BY_ID(?,?,?,?,?,?,?,?,?,?,?,?)";


    @Override
    public void addNewEmployee(Employee employee) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(ADD_NEW_EMPLOYEE_SP);
            callableStatement.setString(1, employee.getName());
            callableStatement.setString(2, employee.getBirthday());
            callableStatement.setString(3, employee.getIdCard());
            callableStatement.setDouble(4, employee.getSalary());
            callableStatement.setString(5, employee.getPhone());
            callableStatement.setString(6, employee.getEmail());
            callableStatement.setString(7, employee.getAddress());
            callableStatement.setInt(8, employee.getPositionId());
            callableStatement.setInt(9, employee.getEducationDegreeId());
            callableStatement.setInt(10, employee.getDivisionId());
            callableStatement.setString(11, employee.getUsername());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            callableStatement.close();
            connection.close();
        }
    }


    @Override
    public Employee selectEmployeeById(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        Employee employee = new Employee();
        try {
            callableStatement = connection.prepareCall(SELECT_EMPLOYEE_BY_ID_SP);
            callableStatement.setInt(1, id);
            resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                String employee_name = resultSet.getString("employee_name");
                String employee_birthday = resultSet.getString("employee_birthday");
                String employee_id_card = resultSet.getString("employee_id_card");
                double employee_salary = resultSet.getDouble("employee_salary");
                String employee_phone = resultSet.getString("employee_phone");
                String employee_email = resultSet.getString("employee_email");
                String employee_address = resultSet.getString("employee_address");
                String position_name = resultSet.getString("position_name");
                String education_degree_name = resultSet.getString("education_degree_name");
                String division_name = resultSet.getString("division_name");
                String username = resultSet.getString("username");

                employee = new Employee(id, employee_name, employee_birthday
                        , employee_id_card, employee_phone, employee_email, employee_address, employee_salary,username
                        , position_name,education_degree_name,division_name);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            ;
        } finally {
            resultSet.close();
            callableStatement.close();
            connection.close();
        }
        return employee;
    }

    @Override
    public List<Employee> selectAllEmployee() throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        List<Employee> employees = new ArrayList<>();
        try {
            callableStatement = connection.prepareCall(SELECT_ALL_EMPLOYEE_SP);
            resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String employee_name = resultSet.getString("employee_name");
                String employee_birthday = resultSet.getString("employee_birthday");
                String employee_id_card = resultSet.getString("employee_id_card");
                double employee_salary = resultSet.getDouble("employee_salary");
                String employee_phone = resultSet.getString("employee_phone");
                String employee_email = resultSet.getString("employee_email");
                String employee_address = resultSet.getString("employee_address");
                String position_name = resultSet.getString("position_name");
                String education_degree_name = resultSet.getString("education_degree_name");
                String division_name = resultSet.getString("division_name");
                String username = resultSet.getString("username");
                employees.add(new Employee(id, employee_name, employee_birthday
                        , employee_id_card, employee_phone, employee_email, employee_address, employee_salary,username
                        , position_name,education_degree_name,division_name));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            ;
        } finally {
            resultSet.close();
            callableStatement.close();
        }
        connection.close();
        return employees;
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        int rowChange = 0;
        boolean checkDelete = false;
        try {
            callableStatement = connection.prepareCall(DELETE_EMPLOYEE_BY_ID_SP);
            callableStatement.setInt(1, id);
            rowChange = callableStatement.executeUpdate();
            if (rowChange > 0) {
                checkDelete = true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            callableStatement.close();
            connection.close();
        }
        return checkDelete;
    }

    @Override
    public boolean updateEmployee(int id, Employee employee) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        int rowChange = 0;
        boolean checkDelete = false;
        try {
            callableStatement = connection.prepareCall(UPDATE_EMPLOYEE_BY_ID_SP);
            callableStatement.setInt(1, id);
            callableStatement.setString(2, employee.getName());
            callableStatement.setString(3, employee.getBirthday());
            callableStatement.setString(4, employee.getIdCard());
            callableStatement.setDouble(5, employee.getSalary());
            callableStatement.setString(6, employee.getPhone());
            callableStatement.setString(7, employee.getEmail());
            callableStatement.setString(8, employee.getAddress());
            callableStatement.setInt(9, employee.getPositionId());
            callableStatement.setInt(10, employee.getEducationDegreeId());
            callableStatement.setInt(11, employee.getDivisionId());
            callableStatement.setString(12, employee.getUsername());
            rowChange = callableStatement.executeUpdate();
            if (rowChange > 0) {
                checkDelete = true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            callableStatement.close();
            connection.close();
        }
        return checkDelete;
    }
}
