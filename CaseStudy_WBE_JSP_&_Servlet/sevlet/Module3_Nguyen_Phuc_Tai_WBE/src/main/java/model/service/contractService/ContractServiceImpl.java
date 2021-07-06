package model.service.contractService;

import model.bean.Contract;
import model.bean.Customer;
import model.repository.contractRepo.ContractRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ContractServiceImpl implements ContractService {
    ContractRepositoryImpl contractRepository = new ContractRepositoryImpl();
    @Override
    public List<Contract> selectAll() throws SQLException {

        return null;
    }

    @Override
    public void addNewContract(Contract contract) throws SQLException {
        contractRepository.addNewContract(contract);
    }

    @Override
    public Contract selectContractById(int id) throws SQLException {
        return null;
    }

    @Override
    public boolean updateContract(int id, Contract contract) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteContract(int id) throws SQLException {
        return false;
    }

    @Override
    public List<Customer> selectCustomerAndContractInfo() throws SQLException {
        return contractRepository.selectCustomerAndContractInfo();
    }
}
