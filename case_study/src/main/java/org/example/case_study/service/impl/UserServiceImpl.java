package org.example.case_study.service.impl;

import org.example.case_study.entity.User;
import org.example.case_study.repository.IUserRepository;
import org.example.case_study.service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements IUserService {

    private IUserRepository iUserRepository;

//    public UserServiceImpl() {
//        iUserRepository = new UserRepositoryImpl();
//    }


    @Override
    public void updateUser(User user) {

    }

    public List<User> searchByUserName(String keyword) throws SQLException {
        List<User> userList = iUserRepository.searchByUserName(keyword);
        return userList;
    }
}
