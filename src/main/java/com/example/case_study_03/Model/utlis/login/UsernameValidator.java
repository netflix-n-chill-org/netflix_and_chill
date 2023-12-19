package com.example.case_study_03.Model.utlis.login;


import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.service.IUserService;
import com.example.case_study_03.Model.service.UserService;
import com.example.case_study_03.Model.utlis.IUtilityUserDAO;

import java.util.ArrayList;
import java.util.List;

import static com.example.case_study_03.Model.dao.MyConnection.getConnection;

public class UsernameValidator implements Validator{
    private final String username;
    private IUserService userService;
    IUtilityUserDAO userDao = new UserDAO(getConnection());

    public UsernameValidator(String username) {
        this.username = username;
       userService = new UserService(userDao);
    }

    @Override
    public boolean isCheck() {
        for (String username1 : getUsernameList()) {
            if (username1.equals(username)) {
                return true;
            }
        }
        return false;
    }

    private List<String> getUsernameList() {
        List<String> usernameList = new ArrayList<>();
        for (User user : userService.showAllUsers()) {
            usernameList.add(user.getUsername());
        }
        return usernameList;
    }
}
