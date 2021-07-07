package model.repository.contractDetailRepo;

import model.bean.ContractDetail;

import java.sql.SQLException;
import java.util.List;

public interface ContractDetailRepository {
    void addNewContractDetail(ContractDetail contractDetail) throws SQLException;

    ContractDetail selectContractDetailById(int id) throws SQLException;

    List<ContractDetail> selectAllContractDetail() throws SQLException;

    boolean deleteContractDetail(int id) throws SQLException;

    boolean updateContractDetail(int id,ContractDetail contractDetail) throws SQLException;
}
