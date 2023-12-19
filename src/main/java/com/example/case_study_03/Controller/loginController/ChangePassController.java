package com.example.case_study_03.Controller.loginController;

import com.example.case_study_03.Model.dao.MyConnection;
import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login/changePass")

public class ChangePassController extends HttpServlet {
    UserDAO userDAO = new UserDAO(MyConnection.getConnection());
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("changePassword.jsp");
        dispatcher.forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newPass = req.getParameter("newPass");
        String newPassAgain = req.getParameter("newPassAgain");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("forgetUser");
        if (newPassAgain.equals(newPass)) {
            UserService userService = new UserService(userDAO);
            user.setPassword(newPass);
            try {
                userService.updatePassword(user);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            RequestDispatcher dispatcher = req.getRequestDispatcher("changePassword.jsp");
            req.setAttribute("isNotCatch", true);
            dispatcher.forward(req, resp);
        }
    }
}
