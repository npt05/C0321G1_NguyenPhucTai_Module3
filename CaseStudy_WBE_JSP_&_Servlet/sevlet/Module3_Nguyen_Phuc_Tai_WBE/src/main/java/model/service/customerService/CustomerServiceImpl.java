package model.service.customerService;

import model.bean.Customer;
import model.repository.customerRepo.CustomerRepositoryImpl;
import model.service.validate.Validate;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private CustomerRepositoryImpl customerRepositoryImpl = new CustomerRepositoryImpl();

    @Override
    public List<Customer> selectAll() throws SQLException {
        return customerRepositoryImpl.selectAllCustomer();
    }

    @Override
    public Map<String, String> addNewCustomer(Customer customer) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateCustomerCode(customer.getCustomerCode()) != null ||
                Validate.validatePhone(customer.getPhone()) != null ||
                Validate.validateIdCard(customer.getIdCard()) != null ||
                Validate.validateEmail(customer.getEmail()) != null) {
            mapMessage.put("customerCode", Validate.validateCustomerCode(customer.getCustomerCode()));
            mapMessage.put("phone", Validate.validatePhone(customer.getPhone()));
            mapMessage.put("idCard", Validate.validateIdCard(customer.getIdCard()));
            mapMessage.put("email", Validate.validateEmail(customer.getEmail()));
        } else {
            customerRepositoryImpl.addNewCustomer(customer);
        }
        return mapMessage;
    }

    @Override
    public Customer selectCustomerById(int id) throws SQLException {
        return customerRepositoryImpl.selectCustomerById(id);
    }

    @Override
    public boolean updateCustomer(int id, Customer customer) throws SQLException {
        return customerRepositoryImpl.updateCustomer(id, customer);
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return customerRepositoryImpl.deleteCustomer(id);
    }
}