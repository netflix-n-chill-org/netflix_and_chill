package org.example.case_study.entity;

public class User {
    private int id;
    private String name;
    private String password;
    private int phone;
    private String email;
    private boolean status;

    public User() {

    }

    public User(int id, String username, String password, int phoneNumber, String email) {
        this.id = id;
        this.name = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
    }

    public User(int id, String name, String password) {
        this.id = id;
        this.name = name;
        this.password = password;
    }

    public User(int id, String name) {
        this.id = id;
        this.name = name;
    }


    public User(String name, int phone, String email) {
        this.name = name;
        this.phone = phone;
        this.email = email;
    }

    public User(int id, String name, int phone, String email) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
    }

    public User(int id, int phone, String email) {
        this.id = id;
        this.phone = phone;
        this.email = email;
    }

    public User(int id, String name, int phone, String email, boolean status) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.status = status;
    }

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

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
