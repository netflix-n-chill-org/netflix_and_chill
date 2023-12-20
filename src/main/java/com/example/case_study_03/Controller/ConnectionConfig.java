package com.example.case_study_03.Controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionConfig {
    private static final String url = "jdbc:mysql://localhost:3306/case_study_03";
    private static final String userName = "root";
    private static final String password = "thien306";

    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(url, userName, password);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

}
