package model.repository.contractRepo;

import model.bean.Contract;
import model.bean.Customer;


import java.sql.SQLException;
import java.util.List;

public interface ContractRepository {
    void addNewContract(Contract contract) throws SQLException;

    Contract selectContractById(int id) throws SQLException;

    List<Contract> selectAllContract() throws SQLException;

    boolean deleteContract(int id) throws SQLException;

    boolean updateContract(int id,Contract contract) throws SQLException;

    List<Customer> selectCustomerAndContractInfo()throws SQLException;
}
