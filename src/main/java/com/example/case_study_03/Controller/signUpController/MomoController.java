package com.example.case_study_03.Controller.signUpController;


import com.example.case_study_03.Model.dao.MyConnection;
import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.service.UserService;
import com.example.case_study_03.Model.utlis.login.LoginManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/momo")
public class MomoController extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO(MyConnection.getConnection());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        RequestDispatcher dispatcher;
        try {
        if (Integer.parseInt((String) session.getAttribute("signUpStep")) < 7) {
            resp.sendRedirect("/signup/mobileWalletOption");
        } else {
            dispatcher = req.getRequestDispatcher("signup/payment.jsp");
            dispatcher.forward(req,resp);
        }
        }  catch (NumberFormatException e) {
            resp.sendRedirect("/main");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //logic xac thuc thanh toan
        // thanh cong
        HttpSession session = req.getSession();
        session.setAttribute("lastStep1", 2);
        String email = (String) session.getAttribute("email");
        Cookie cookie = new Cookie(email.replace("@","-"), "already");
        UserService userService = new UserService(userDAO);
        User newUser = (User) session.getAttribute("newUser");
        try {
            userService.addAllUser(newUser);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        User newUser1 =  userService.getUserByUsername(newUser.getEmail());
        LoginManager.getInstance().addUser(newUser1);
        session.setAttribute("loggedInUser", newUser1);
        resp.addCookie(cookie);
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        resp.sendRedirect("/browse");

    }
}
