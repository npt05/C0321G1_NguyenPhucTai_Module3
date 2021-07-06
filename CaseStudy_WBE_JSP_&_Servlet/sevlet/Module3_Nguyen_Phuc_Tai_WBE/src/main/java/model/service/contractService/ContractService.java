package model.service.contractService;

import model.bean.Contract;
import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ContractService {
    List<Contract> selectAll() throws SQLException;
    void addNewContract(Contract contract) throws SQLException;
    Contract selectContractById(int id) throws SQLException;
    boolean updateContract(int id,Contract contract) throws SQLException;
    boolean deleteContract(int id) throws SQLException;
    List<Customer> selectCustomerAndContractInfo()throws SQLException;
}
