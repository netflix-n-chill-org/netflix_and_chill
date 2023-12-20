package com.example.case_study_03.Controller;

import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.service.UserService;

import com.example.case_study_03.Model.utlis.login.Validator;
import com.example.case_study_03.Model.utlis.regexValidator.EmailRegexValidator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


import static com.example.case_study_03.Model.dao.MyConnection.getConnection;

@WebServlet(name="MainController",urlPatterns = "/main")
public class MainController extends HttpServlet {
    private UserDAO userDao ;
    @Override
    public void init()  {
        userDao = new UserDAO(getConnection());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/HomePage/homepage.jsp");
        dispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        Validator emailCheck = new EmailRegexValidator(email);
        if (emailCheck.isCheck()) {
            HttpSession session = req.getSession();
            session.setAttribute("signUpStep", "1");
            session.setAttribute("signInStep", "1");
            session.setAttribute("email", email);


            User user = (new UserService(userDao).getUserByUsername(email));

            if (user == null) {
                try {
                    int lastStep = (int) session.getAttribute("lastStep1");
                    if (lastStep == 1) {
                        resp.sendRedirect("/signup/password");
                    } else {
                        resp.sendRedirect("/signup/registration");
                    }
                } catch (NullPointerException e) {
                    resp.sendRedirect("/signup/registration");
                }

            } else {
                resp.sendRedirect("/login");
            }
        } else {
            req.setAttribute("emailRegex", false);
            doGet(req, resp);
        }


    }
}
