package org.example.case_study.repository;

import org.example.case_study.entity.User;
import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    void addUser(User user) throws SQLException;

    boolean updateProfile(User user) throws SQLException;

    boolean deleteUser(int id) throws SQLException;

    List<User> showAllUsers();

    User selectUser(int id);

    List<User> searchByUserName(String keyword) throws SQLException;
}
