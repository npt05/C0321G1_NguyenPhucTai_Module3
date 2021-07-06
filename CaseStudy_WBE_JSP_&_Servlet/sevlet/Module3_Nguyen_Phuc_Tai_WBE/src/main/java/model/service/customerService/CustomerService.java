package model.service.customerService;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CustomerService {
    List<Customer> selectAll() throws SQLException;
    Map<String,String> addNewCustomer(Customer customer) throws SQLException;
    Customer selectCustomerById(int id) throws SQLException;
    boolean updateCustomer(int id,Customer customer) throws SQLException;
    boolean deleteCustomer(int id) throws SQLException;

}