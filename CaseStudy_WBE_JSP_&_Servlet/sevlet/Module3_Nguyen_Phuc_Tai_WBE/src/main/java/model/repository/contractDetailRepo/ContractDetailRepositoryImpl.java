package model.repository.contractDetailRepo;

import model.bean.ContractDetail;
import model.repository.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ContractDetailRepositoryImpl implements ContractDetailRepository {
    private static final String ADD_NEW_CONTRACT_DETAIL_SP = "call ADD_NEW_CONTRACT_DETAIL(?,?,?)";

    @Override
    public void addNewContractDetail(ContractDetail contractDetail) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(ADD_NEW_CONTRACT_DETAIL_SP);
            callableStatement.setInt(1, contractDetail.getContractId());
            callableStatement.setInt(2, contractDetail.getAttachServiceId());
            callableStatement.setInt(3, contractDetail.getQuantity());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            callableStatement.close();
            connection.close();
        }
    }


    @Override
    public ContractDetail selectContractDetailById(int id) throws SQLException {
        return null;
    }

    @Override
    public List<ContractDetail> selectAllContractDetail() throws SQLException {
        return null;
    }

    @Override
    public boolean deleteContractDetail(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateContractDetail(int id, ContractDetail contractDetail) throws SQLException {
        return false;
    }
}