package com.example.case_study_03.Model.entity;

public class User {
    private int id;
    private String name;
    private String username;
    private String password;
    private String phone;
    private String email;
    private boolean status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public User(String name, String phone, String email) {
        this.name = name;
        this.phone = phone;
        this.email = email;
    }
    public User(int id, String name, String phone, String email, boolean status) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.status = status;
    }

    public User(int id, String name, String phone, String email) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
