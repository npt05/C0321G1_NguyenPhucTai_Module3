package model.service.serivceInterface;

import model.bean.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ServiceInterface {
    List<Service> selectAll() throws SQLException;
    Map<String,String> addNew(Service service) throws SQLException;
    Service findById(int id);
    void update(int id,Service service);
    void remove(int id);
}