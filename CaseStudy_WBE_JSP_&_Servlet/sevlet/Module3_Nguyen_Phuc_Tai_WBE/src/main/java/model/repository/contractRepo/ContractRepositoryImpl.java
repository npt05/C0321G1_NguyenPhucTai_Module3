package model.repository.contractRepo;

import model.bean.Contract;
import model.bean.Customer;
import model.repository.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepositoryImpl implements ContractRepository {
    private static final String ADD_NEW_CONTRACT_SP = "call ADD_NEW_CONTRACT(?,?,?,?,?,?,?)";
    private static final String SELECT_ALL_INFO_CONTRACT_SP = "call SELECT_ALL_INFO_CONTRACT()";
    @Override
    public void addNewContract(Contract contract) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(ADD_NEW_CONTRACT_SP);
            callableStatement.setString(1, contract.getStartDate());
            callableStatement.setString(2, contract.getEndDate());
            callableStatement.setDouble(3, contract.getDeposit());
            callableStatement.setDouble(4, contract.getTotalMoney());
            callableStatement.setInt(5, contract.getEmployeeId());
            callableStatement.setInt(6, contract.getCustomerId());
            callableStatement.setInt(7, contract.getServiceId());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            callableStatement.close();
            connection.close();
        }
    }

    @Override
    public Contract selectContractById(int id) throws SQLException {
        return null;
    }

    @Override
    public List<Contract> selectAllContract() throws SQLException {

        return null;
    }

    @Override
    public boolean deleteContract(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateContract(int id, Contract contract) throws SQLException {
        return false;
    }

    @Override
    public List<Customer> selectCustomerAndContractInfo() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        try {
            callableStatement = connection.prepareCall(SELECT_ALL_INFO_CONTRACT_SP);
            resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int customer_id = resultSet.getInt("customer_id");
                String customer_name = resultSet.getString("customer_name");
                String customer_birthday = resultSet.getString("customer_birthday");
                String customer_id_card = resultSet.getString("customer_id_card");
                String customer_phone = resultSet.getString("customer_phone");
                String customer_email = resultSet.getString("customer_email");
                String customer_address = resultSet.getString("customer_address");
                int contract_id = resultSet.getInt("contract_id");
                int service_id = resultSet.getInt("service_id");
                int contract_detail_id = resultSet.getInt("contract_detail_id");
                int quantity = resultSet.getInt("quantity");
                customers.add(new Customer(customer_id,customer_name,customer_birthday,customer_id_card,
                        customer_phone,customer_email,customer_address,contract_id,service_id,
                        contract_detail_id,quantity));
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
}
