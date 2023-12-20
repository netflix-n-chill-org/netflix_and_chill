package com.example.case_study_03.Controller.loginController;

import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.utlis.login.LoginManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login/sendCode")

public class SendCodeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            User user = (User) session.getAttribute("forgetUser");
            LoginManager.getInstance().sendCodeEmail(user.getEmail());
            session.setAttribute("forgetPassStep", 3);
            resp.sendRedirect("/login/forgetPassword");

        } catch (NullPointerException e) {
            resp.sendRedirect("/login");
        }
    }

}
