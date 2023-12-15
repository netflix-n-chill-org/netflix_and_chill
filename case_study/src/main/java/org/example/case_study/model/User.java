package org.example.case_study.model;

public class User {
    private int id;
    private String name;
    private int phone;
    private String email;
    private boolean status;
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
}
