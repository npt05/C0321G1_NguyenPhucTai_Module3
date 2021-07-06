package model.service.contractDetailService;

import model.bean.ContractDetail;

import java.sql.SQLException;
import java.util.List;

public interface ContractDetailService {
    List<ContractDetail> selectAll() throws SQLException;
    void addNewContractDetail(ContractDetail contractDetail) throws SQLException;
    ContractDetail selectContractDetailById(int id) throws SQLException;
    boolean updateContractDetail(int id,ContractDetail contractDetail) throws SQLException;
    boolean deleteContractDetail(int id) throws SQLException;
}