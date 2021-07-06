package model.service.contractDetailService;

import model.bean.ContractDetail;
import model.repository.contractDetailRepo.ContractDetailRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ContractDetailServiceImpl implements ContractDetailService {
    ContractDetailRepositoryImpl contractDetailRepository = new ContractDetailRepositoryImpl();
    @Override
    public List<ContractDetail> selectAll() throws SQLException {
        return null;
    }

    @Override
    public void addNewContractDetail(ContractDetail contractDetail) throws SQLException {
        contractDetailRepository.addNewContractDetail(contractDetail);
    }

    @Override
    public ContractDetail selectContractDetailById(int id) throws SQLException {
        return null;
    }

    @Override
    public boolean updateContractDetail(int id, ContractDetail contractDetail) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteContractDetail(int id) throws SQLException {
        return false;
    }
}