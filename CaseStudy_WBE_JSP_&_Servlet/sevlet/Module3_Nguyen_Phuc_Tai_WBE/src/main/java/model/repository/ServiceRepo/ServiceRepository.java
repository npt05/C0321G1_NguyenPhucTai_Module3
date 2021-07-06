package model.repository.ServiceRepo;

import model.bean.Customer;
import model.bean.Service;

import java.sql.SQLException;
import java.util.List;

public interface ServiceRepository {
    void addNewService(Service service) throws SQLException;

    Service selectServiceById(int id) throws SQLException;

    List<Service> selectAllService() throws SQLException;

    boolean deleteService(int id) throws SQLException;

    boolean updateService(int id,Service service) throws SQLException;
}
