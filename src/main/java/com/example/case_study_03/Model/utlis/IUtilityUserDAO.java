package com.example.case_study_03.Model.utlis;

import com.example.case_study_03.Model.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface IUtilityUserDAO {
    void addUser(User user) throws SQLException;

    boolean updateProfile(User user) throws SQLException;

    boolean deleteUser(int id) throws SQLException;

    List<User> showAllUsers();

    User selectUser(int id);
}
