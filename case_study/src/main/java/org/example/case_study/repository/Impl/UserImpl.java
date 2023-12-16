package org.example.case_study.repository.Impl;

import org.example.case_study.controller.ConnectionConfig;
import org.example.case_study.entity.User;
import org.example.case_study.repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserImpl implements IUserRepository {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/case_study_03?useSSL=false";
    private static final String jdbcUserName = "root";
    private static final String jdbcPassWord = "D@ll123456";
    private static final String ADD_USERS_SQL = "INSERT INTO user (name ,phone, email) VALUES (?,?,?)";
    private static final String UPDATE_USERS_SQL = "UPDATE user set name = ?, phone = ?, email = ? where id = ?;";
    private static final String DELETE_USERS = "UPDATE user set status = 1 where id = ?;";
    private static final String SELECT_USER_BY_ID = "SELECT name, phone, email from USER where id = ?;";
    private static final String SHOW_ALL_USERS = "SELECT id, name, phone, email FROM user where status = 0;";


    public UserImpl() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassWord);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void addUser(User user) throws SQLException {
        System.out.println(ADD_USERS_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setInt(2, user.getPhone());
            preparedStatement.setString(3, user.getEmail());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public boolean updateProfile(User user) throws SQLException {
        boolean profileUpdated;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setInt(2, user.getPhone());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setInt(4, user.getId());
            profileUpdated = preparedStatement.executeUpdate() > 0;
        }
        return profileUpdated;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean profileDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS)) {
            statement.setInt(1, id);
            profileDeleted = statement.executeUpdate() > 0;
        }
        return profileDeleted;
    }

    @Override
    public List<User> showAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(SHOW_ALL_USERS)) {
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int phone = resultSet.getInt("phone");
                String email = resultSet.getString("email");
                users.add(new User(id, name, phone, email));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            statement.setInt(1, id);
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                int phone = resultSet.getInt("phone");
                String email = resultSet.getString("email");
                user = new User(id, name, phone, email);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
