package model.repository.customerRepo;

import model.bean.Customer;
import model.repository.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    private static final String SELECT_ALL_CUSTOMERS_SP = "call SELECT_ALL_CUSTOMERS()";
    private static final String ADD_NEW_CUSTOMER_SP = "call ADD_NEW_CUSTOMER(?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_CUSTOMER_BY_ID = "call SELECT_CUSTOMER_BY_ID(?)";
    private static final String DELETE_CUSTOMER_BY_ID_SP = "call DELETE_CUSTOMER_BY_ID(?)";
    private static final String UPDATE_CUSTOMER_BY_ID_SP = "call UPDATE_CUSTOMER_BY_ID(?,?,?,?,?,?,?,?,?,?)";

    @Override
    public void addNewCustomer(Customer customer) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(ADD_NEW_CUSTOMER_SP);
            callableStatement.setInt(1, customer.getCustomerTypeId());
            callableStatement.setString(2, customer.getName());
            callableStatement.setString(3, customer.getBirthday());
            callableStatement.setInt(4, customer.getCustomerGenderId());
            callableStatement.setString(5, customer.getIdCard());
            callableStatement.setString(6, customer.getPhone());
            callableStatement.setString(7, customer.getEmail());
            callableStatement.setString(8, customer.getAddress());
            callableStatement.setString(9, customer.getCustomerCode());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            callableStatement.close();
            connection.close();
        }
    }

    @Override
    public Customer selectCustomerById(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        Customer customer = new Customer();
        try {
            callableStatement = connection.prepareCall(SELECT_CUSTOMER_BY_ID);
            callableStatement.setInt(1, id);
            resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                String customer_type = resultSet.getString("customer_type_name");
                String customer_name = resultSet.getString("customer_name");
                String customer_birthday = resultSet.getString("customer_birthday");
                int customer_gender_num = resultSet.getInt("customer_gender");
                String customer_id_card = resultSet.getString("customer_id_card");
                String customer_phone = resultSet.getString("customer_phone");
                String customer_email = resultSet.getString("customer_email");
                String customer_address = resultSet.getString("customer_address");
                String customer_code = resultSet.getString("customer_code");
                String customer_gender = "";
                if (customer_gender_num == 0) {
                    customer_gender = "Male";
                } else {
                    customer_gender = "Female";
                }
                customer = new Customer(id, customer_name, customer_birthday
                        , customer_id_card, customer_phone, customer_email, customer_address, customer_type
                        , customer_gender,customer_code);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            ;
        } finally {
            resultSet.close();
            callableStatement.close();
            connection.close();
        }
        return customer;
    }

    @Override
    public List<Customer> selectAllCustomer() throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        List<Customer> customers = new ArrayList<>();
        try {
            callableStatement = connection.prepareCall(SELECT_ALL_CUSTOMERS_SP);
            resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String customer_type = resultSet.getString("customer_type_name");
                String customer_name = resultSet.getString("customer_name");
                String customer_birthday = resultSet.getString("customer_birthday");
                int customer_gender_num = resultSet.getInt("customer_gender");
                String customer_id_card = resultSet.getString("customer_id_card");
                String customer_phone = resultSet.getString("customer_phone");
                String customer_email = resultSet.getString("customer_email");
                String customer_address = resultSet.getString("customer_address");
                String customer_code = resultSet.getString("customer_code");
                String customer_gender = "";
                if (customer_gender_num == 0) {
                    customer_gender = "Male";
                } else {
                    customer_gender = "Female";
                }
                customers.add(new Customer(id, customer_name, customer_birthday
                        , customer_id_card, customer_phone, customer_email, customer_address, customer_type
                        , customer_gender,customer_code));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            ;
        } finally {
            resultSet.close();
            callableStatement.close();
        }
        connection.close();
        return customers;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        int rowChange = 0;
        boolean checkDelete = false;
        try {
            callableStatement = connection.prepareCall(DELETE_CUSTOMER_BY_ID_SP);
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
    public boolean updateCustomer(int id,Customer customer) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        int rowChange = 0;
        boolean checkDelete = false;
        try {
            callableStatement = connection.prepareCall(UPDATE_CUSTOMER_BY_ID_SP);
            callableStatement.setInt(1, id);
            callableStatement.setInt(2, customer.getCustomerTypeId());
            callableStatement.setString(3, customer.getName());
            callableStatement.setString(4, customer.getBirthday());
            callableStatement.setInt(5, customer.getCustomerGenderId());
            callableStatement.setString(6, customer.getIdCard());
            callableStatement.setString(7, customer.getPhone());
            callableStatement.setString(8, customer.getEmail());
            callableStatement.setString(9, customer.getAddress());
            callableStatement.setString(10, customer.getCustomerCode());
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
