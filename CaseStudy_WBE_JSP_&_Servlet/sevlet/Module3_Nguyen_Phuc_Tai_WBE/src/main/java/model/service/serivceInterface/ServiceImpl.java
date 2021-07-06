package model.service.serivceInterface;

import model.bean.Service;
import model.repository.ServiceRepo.ServiceRepositoryImpl;
import model.service.validate.Validate;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceImpl implements ServiceInterface {
    ServiceRepositoryImpl serviceRepository = new ServiceRepositoryImpl();

    @Override
    public List<Service> selectAll() throws SQLException {
        return serviceRepository.selectAllService();
    }

    @Override
    public Map<String, String> addNew(Service service) throws SQLException {
        Map<String, String> mapMess = new HashMap<>();
        if (Validate.validatePositiveInt(service.getServiceArea()) != null ||
                Validate.validatePositiveDouble(service.getServiceCost()) != null ||
                Validate.validatePositiveInt(service.getServiceMaxPeople()) != null ||
                Validate.validatePositiveDouble(service.getPoolArea()) != null ||
                Validate.validatePositiveInt(service.getNumberOfFloor()) != null ||
                Validate.validateServiceCode(service.getServiceCode()) != null) {
            mapMess.put("serviceArea",Validate.validatePositiveInt(service.getServiceArea()));
            mapMess.put("serviceCost",Validate.validatePositiveDouble(service.getServiceCost()));
            mapMess.put("serviceMaxPeople",Validate.validatePositiveInt(service.getServiceMaxPeople()));
            mapMess.put("numberOfFloor",Validate.validatePositiveInt(service.getNumberOfFloor()));
            mapMess.put("serviceCode",Validate.validateServiceCode(service.getServiceCode()));
        } else {
            serviceRepository.addNewService(service);
        }
        return mapMess;
    }

    @Override
    public Service findById(int id) {
        return null;
    }

    @Override
    public void update(int id, Service service) {

    }

    @Override
    public void remove(int id) {

    }
}