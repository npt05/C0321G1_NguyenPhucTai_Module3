package model.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "12345678";
    private static final String HOST = "127.0.0.1";
    private static final String DATABASE = "jsp_servlet";
    private static final String PORT = "3307";

    private static Connection connection;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE, USER_NAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    public static void close() throws SQLException {
        if(connection != null){
            connection.close();
        }
    }
}
