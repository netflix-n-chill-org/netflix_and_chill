package org.example.case_study.controller;


import org.example.case_study.entity.User;
import org.example.case_study.service.IUserService;
import org.example.case_study.service.impl.UserServiceImpl;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class UserController {
    private IUserService userService;

//    public UserController() {
//        userService = new IUserService();
//    }

    public void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String userName = (String) request.getParameter("userName");
        String password = (String) request.getParameter("password");
        User updata = new User(id, userName, password);
        userService.updateUser(updata);

        String alertMess = "Tài khoản hoặc mật khẩu không đúng!!!";
        request.setAttribute("alert", alertMess);
        request.getRequestDispatcher("view/login.jsp").forward(request, response);
    }

    public void searchByUsserName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String txtSearch = request.getParameter("textSearch");
        List<User> userList = userService.searchByUserName(txtSearch);
        request.setAttribute("userList", userList);
        request.setAttribute("txtSearch", txtSearch);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product.jsp");
        dispatcher.forward(request, response);
    }

}
