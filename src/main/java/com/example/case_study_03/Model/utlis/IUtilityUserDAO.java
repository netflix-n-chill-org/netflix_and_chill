package com.example.case_study_03.Model.utlis;

import com.example.case_study_03.Model.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface IUtilityUserDAO {
    void addAllUser(User user) throws  SQLException;
    void addUser(User user) throws SQLException;

    boolean updateProfile(User user) throws SQLException;
    boolean updatePassword(User user) throws SQLException;

    boolean deleteUser(int id) throws SQLException;

    List<User> showAllUsers();
    List<User> showUsers();

    User selectUser(int id);
    User getUserByUsername(String username);

}
