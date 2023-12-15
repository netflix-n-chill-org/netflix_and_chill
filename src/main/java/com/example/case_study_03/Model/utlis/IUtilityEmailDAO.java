package com.example.case_study_03.Model.utlis;

public interface IUtilityEmailDAO {
    void saveUserEmail(String email);
    boolean isEmailExists(String email);
    void updateUserDetails(String email,String name, String username, String password, String phone);
}
