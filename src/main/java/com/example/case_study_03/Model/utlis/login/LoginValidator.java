package com.example.case_study_03.Model.utlis.login;



import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.service.UserService;
import com.example.case_study_03.Model.utlis.IUtilityUserDAO;

import java.util.List;

import static com.example.case_study_03.Model.dao.MyConnection.getConnection;

public class LoginValidator implements Validator{
    private final String username;
    private final String password;
    private final List<User> userList ;
    IUtilityUserDAO userDao = new UserDAO(getConnection());


    public LoginValidator(String username, String password) {
        this.username = username;
        this.password = password;
        userList = (new UserService(userDao)).showUsers();
    }

    @Override
    public boolean isCheck() {
        for (User user : userList) {
            if ((username.equals(user.getUsername()) || username.equals(user.getPhone()) || username.equals(user.getEmail())) && password.equals(user.getPassword())) {
                return true;
            }
        }
        return false;
    }
}
