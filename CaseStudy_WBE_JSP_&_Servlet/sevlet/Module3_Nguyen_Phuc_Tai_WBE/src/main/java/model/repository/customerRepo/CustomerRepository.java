package model.repository.customerRepo;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerRepository {
    void addNewCustomer(Customer customer) throws SQLException;

    Customer selectCustomerById(int id) throws SQLException;

    List<Customer> selectAllCustomer() throws SQLException;

    boolean deleteCustomer(int id) throws SQLException;

    boolean updateCustomer(int id,Customer customer) throws SQLException;

}