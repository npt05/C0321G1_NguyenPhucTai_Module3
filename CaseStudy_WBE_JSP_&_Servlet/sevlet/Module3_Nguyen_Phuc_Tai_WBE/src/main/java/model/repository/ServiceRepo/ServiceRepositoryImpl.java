package model.repository.ServiceRepo;

import model.bean.Service;
import model.repository.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements ServiceRepository {
    private static final String SELECT_ALL_SERVICE_SP = "call SELECT_ALL_SERVICE()";
    private static final String ADD_NEW_SERVICE_SP = "call ADD_NEW_SERVICE(?,?,?,?,?,?,?,?,?,?,?)";


    @Override
    public void addNewService(Service service) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(ADD_NEW_SERVICE_SP);
            callableStatement.setInt(1, service.getId());
            callableStatement.setString(2, service.getServiceName());
            callableStatement.setInt(3, service.getServiceArea());
            callableStatement.setDouble(4, service.getServiceCost());
            callableStatement.setInt(5, service.getServiceMaxPeople());
            callableStatement.setInt(6, service.getRentTypeId());
            callableStatement.setInt(7, service.getServiceTypeId());
            callableStatement.setString(8, service.getStandardRoom());
            callableStatement.setString(9, service.getDescriptionOtherConvenience());
            callableStatement.setDouble(10, service.getPoolArea());
            callableStatement.setInt(11, service.getNumberOfFloor());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            callableStatement.close();
            connection.close();
        }
    }

    @Override
    public Service selectServiceById(int id) throws SQLException {
        return null;
    }

    @Override
    public List<Service> selectAllService() throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;
        List<Service> services = new ArrayList<>();
        try {
            callableStatement = connection.prepareCall(SELECT_ALL_SERVICE_SP);
            resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("service_id");
                String service_code = resultSet.getString("service_code");
                String service_name = resultSet.getString("service_name");
                int service_area = resultSet.getInt("service_area");
                double service_cost = resultSet.getDouble("service_cost");
                int service_max_people = resultSet.getInt("service_max_people");
                int rent_type_id = resultSet.getInt("rent_type_id");
                int service_type_id = resultSet.getInt("service_type_id");
                String standard_room = resultSet.getString("standard_room");
                String description_other_convenience = resultSet.getString("description_other_convenience");
                double pool_area = resultSet.getDouble("pool_area");
                int number_of_floor = resultSet.getInt("number_of_floor");
                String service_type_name = resultSet.getString("service_type_name");
                String rent_type_name = resultSet.getString("rent_type_name");
                double rent_type_cost = resultSet.getDouble("rent_type_cost");
                services.add(new Service(id, service_code, service_name
                        , service_area, service_cost, service_max_people
                        , rent_type_id, service_type_id, standard_room, description_other_convenience,
                        pool_area, number_of_floor, service_type_name, rent_type_name, rent_type_cost) {
                });
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            ;
        } finally {
            resultSet.close();
            callableStatement.close();
        }
        connection.close();
        return services;
    }

    @Override
    public boolean deleteService(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateService(int id, Service service) throws SQLException {
        return false;
    }
}
