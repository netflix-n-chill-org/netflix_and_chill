package com.example.case_study_03.Model.dao.impl;

import com.example.case_study_03.Model.utlis.IUtilityEmailDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserEmailDAO implements IUtilityEmailDAO {
    private static final String INSERT_OR_UPDATE_USER_QUERY = "INSERT INTO user (email) VALUES (?) ON DUPLICATE KEY UPDATE email = VALUES(email)";
    private static final String UPDATE_USER_QUERY = "UPDATE user SET name=?, user_name = ?, user_password = ?, phone = ? WHERE email = ?";

    @Override
    public void updateUserDetails(String email,String name, String username, String password, String phone) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_QUERY)) {
            preparedStatement.setString(1,name);
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, phone);
            preparedStatement.setString(5, email);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Connection connection;
    public UserEmailDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void saveUserEmail(String email) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_OR_UPDATE_USER_QUERY)) {
            preparedStatement.setString(1, email);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public boolean isEmailExists(String email) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM user WHERE email = ?")) {
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
