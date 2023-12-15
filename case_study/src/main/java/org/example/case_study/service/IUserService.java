package org.example.case_study.service;

import org.example.case_study.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void updateUser(User user);
    List<User> searchByUserName(String keyword) throws SQLException;
}
