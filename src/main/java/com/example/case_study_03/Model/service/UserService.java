package com.example.case_study_03.Model.service;

import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.utlis.IUtilityUserDAO;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{
    private IUtilityUserDAO userDao;
    public UserService(IUtilityUserDAO userDao) {
        this.userDao = userDao;
    }

    @Override
    public void addAllUser(User user) throws SQLException {
        userDao.addAllUser(user);
    }

    @Override
    public void addUser(User user) throws SQLException {
        userDao.addUser(user);
    }

    @Override
    public boolean updateProfile(User user) throws SQLException {
        return userDao.updateProfile(user);
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userDao.deleteUser(id);
    }

    @Override
    public List<User> showAllUsers() {
        return userDao.showAllUsers();
    }

    @Override
    public List<User> showUsers() {
        return userDao.showUsers();
    }

    @Override
    public User selectUser(int id) {
        return userDao.selectUser(id);
    }

    @Override
    public User getUserByUsername(String username) {
        return userDao.getUserByUsername(username);
    }
    @Override
    public boolean updatePassword(User user) throws SQLException {
        return userDao.updatePassword(user);
    }

    @Override
    public boolean isExistUser(String username) {
        for (User user : showAllUsers()) {
            if (username.equals(user.getUsername()) || username.equals(user.getEmail()) || username.equals(user.getPhone())) {
                return true;
            }
        }
        return false;
    }
}
