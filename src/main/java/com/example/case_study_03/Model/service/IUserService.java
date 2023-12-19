package com.example.case_study_03.Model.service;

import com.example.case_study_03.Model.utlis.IUtilityUserDAO;

public interface IUserService extends IUtilityUserDAO {
    boolean isExistUser(String username);
}
