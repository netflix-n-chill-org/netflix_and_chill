package org.example.case_study.model.Impl;

import org.example.case_study.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDao {
    void addUser(User user) throws SQLException;

    boolean updateProfile(User user) throws SQLException;

    boolean deleteUser(int id) throws SQLException;

    List<User> showAllUsers();

    User selectUser(int id);
}
