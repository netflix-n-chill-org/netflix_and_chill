package com.example.case_study_03.Controller.signUpController;

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

import static com.example.case_study_03.Model.dao.MyConnection.getConnection;

@WebServlet("/signup/password")

public class PasswordController extends HttpServlet {
    UserDAO userDAO = new UserDAO(getConnection());
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("password.jsp");
        dispatcher.forward(req, resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        UserService userService = new UserService(userDAO);
        String email = (String) session.getAttribute("emailSignIn");
        User userLogin = userService.getUserByUsername(email);
        session.setAttribute("newUser", userLogin);
        if (userLogin.getPassword().equals(password)) {
            resp.sendRedirect("/subscription");
        }
    }
}
