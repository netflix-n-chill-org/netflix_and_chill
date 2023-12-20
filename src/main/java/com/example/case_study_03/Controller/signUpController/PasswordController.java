package com.example.case_study_03.Controller.signUpController;

import com.example.case_study_03.Model.entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/signup/password")

public class PasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        RequestDispatcher dispatcher;
        try {
            if (Integer.parseInt((String) session.getAttribute("signUpStep")) < 2) {
                try {
                    if ((int) session.getAttribute("lastStep1") == 1) {
                        dispatcher = req.getRequestDispatcher("password.jsp");
                        dispatcher.forward(req, resp);
                    } else {
                        resp.sendRedirect("/signup/registration");
                    }
                } catch (NullPointerException e) {
                    resp.sendRedirect("/signup/registration");
                }
            } else {

                dispatcher = req.getRequestDispatcher("password.jsp");
                dispatcher.forward(req,resp);
            }

        }   catch (NumberFormatException e) {
            resp.sendRedirect("/main");
        }
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        User newUser = (User) session.getAttribute("newUser");
        if (newUser.getPassword().equals(password)) {
            session.setAttribute("signUpStep", "3");
            resp.sendRedirect("/subscription");
        } else {
            RequestDispatcher dispatcher = req.getRequestDispatcher("password.jsp");
            req.setAttribute("wrongPassword", true);
            dispatcher.forward(req, resp);
        }
    }
}
