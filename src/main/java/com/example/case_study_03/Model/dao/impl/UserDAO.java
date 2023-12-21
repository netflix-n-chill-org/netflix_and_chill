package com.example.case_study_03.Model.dao.impl;

import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.utlis.IUtilityUserDAO;
import com.sun.source.tree.CompoundAssignmentTree;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUtilityUserDAO {

    private static final String Insert_ALL_USERS = "INSERT INTO user (name,username,password,phone,email) VALUES (?,?,?,?,?)";
    private static final String ADD_USERS_SQL = "INSERT INTO user (name ,phone, email) VALUES (?,?,?)";
    private static final String UPDATE_USERS_SQL = "UPDATE user set name = ?, phone = ?, email = ? where id = ? and status = 0;";
    private static final String UPDATE_PASSWORD = "UPDATE user set name=?, set username= ?, password =?, phone =?, email=? where id = ? and status = 0;";
    private static final String DELETE_USERS = "UPDATE user set status = 1 where id = ?;";
    private static final String SELECT_USER_BY_ID = "SELECT name, phone, email from USER where id = ? and status = 0;";
    private static final String SHOW_ALL_USERS = "SELECT id, name, phone, email FROM user where status = 0;";
    private static final String SHOW_USERNAME_PASSWORD = "SELECT * from user where status = 0;";
    private final static String SELECT_USER_BY_USERNAME = "select * from user where ( username = ? or email = ? or phone = ?) and status = 0;";
    private Connection connection;

    public UserDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void addAllUser(User user) throws SQLException {
        System.out.println(Insert_ALL_USERS);
        try(PreparedStatement preparedStatement = connection.prepareStatement(Insert_ALL_USERS))
        {
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getUsername());
            preparedStatement.setString(3,user.getPassword());
            preparedStatement.setString(4,user.getPhone());
            preparedStatement.setString(5,user.getEmail());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            printSQLException(e);
        }
    }

    @Override
    public void addUser(User user) throws SQLException {
        System.out.println(ADD_USERS_SQL);
        try (PreparedStatement preparedStatement = connection.prepareStatement(ADD_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPhone());
            preparedStatement.setString(3, user.getEmail());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public boolean updateProfile(User user) throws SQLException {
        boolean profileUpdated;
        try (PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPhone());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setInt(4, user.getId());
            profileUpdated = preparedStatement.executeUpdate() > 0;
        }
        return profileUpdated;
    }

    @Override
    public boolean updatePassword(User user) throws SQLException {
        try(PreparedStatement ps = connection.prepareStatement(UPDATE_PASSWORD))
        {
            ps.setString(1, user.getName());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getEmail());
            ps.setInt(6, user.getId());
            ps.executeUpdate();
            return true;
        }catch (SQLException e){
            printSQLException(e);
        }
        return false;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean profileDeleted;
        try (PreparedStatement statement = connection.prepareStatement(DELETE_USERS)) {
            statement.setInt(1, id);
            profileDeleted = statement.executeUpdate() > 0;
        }
        return profileDeleted;
    }

    @Override
    public List<User> showAllUsers() {
        List<User> users = new ArrayList<>();
        try (
             PreparedStatement statement = connection.prepareStatement(SHOW_ALL_USERS)) {
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                users.add(new User(id, name, phone, email));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public List<User> showUsers() {
        List<User> users = new ArrayList<>();
        try(PreparedStatement ps= connection.prepareStatement(SHOW_USERNAME_PASSWORD))
        {
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String username=rs.getString("username");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                users.add(new User(id,name,username,password,phone,email));
            }
        }catch (SQLException e){
            printSQLException(e);
        }
        return users;
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try (PreparedStatement statement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            statement.setInt(1, id);
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                user = new User(id, name, phone, email);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public User getUserByUsername(String username) {
        User user=null;
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_USER_BY_USERNAME);
            ps.setString(1, username);
            ps.setString(2, username);
            ps.setString(3, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                user = new User(id,name,username, password, phone, email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
