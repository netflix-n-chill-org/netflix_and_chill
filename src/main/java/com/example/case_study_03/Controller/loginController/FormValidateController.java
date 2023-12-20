package com.example.case_study_03.Controller.loginController;


import com.example.case_study_03.Model.dao.MyConnection;
import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.service.UserService;
import com.example.case_study_03.Model.utlis.login.LoginManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login/formValidate")
public class FormValidateController extends HttpServlet {
    private UserDAO userDAO;
    @Override
    public void init() throws ServletException {
        this.userDAO = new UserDAO(MyConnection.getConnection());
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("formValidate.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String form = req.getParameter("form");
        String email = req.getParameter("emailAddress");
        User user = (new UserService(userDAO).getUserByUsername(email));
        RequestDispatcher dispatcher;
        HttpSession session = req.getSession();

        if (form.equals("email")) {
            if (user == null) {
                req.setAttribute("isUser", false);
                session.setAttribute("emailSignUp", email);
                dispatcher = req.getRequestDispatcher("formValidate.jsp");
                dispatcher.forward(req, resp);
            } else {
                LoginManager loginManager = LoginManager.getInstance();
                System.out.println(loginManager.getBlockedUserManagement().size());
                System.out.println(loginManager.getBlockedUserManagement().get(user.getId()));
                if (loginManager.getBlockedUserManagement().containsKey(user.getId())) {
                    req.setAttribute("isBlockedUser", true);
                    dispatcher = req.getRequestDispatcher("formValidate.jsp");
                    dispatcher.forward(req, resp);
                } else {
                    session.setAttribute("forgetUser", user);
                    session.setAttribute("forgetPassStep", 2);
                    loginManager.sendCodeEmail(email);
                    resp.sendRedirect("/login/forgetPassword");
                }
            }
        } else {
            dispatcher = req.getRequestDispatcher("formValidate.jsp");
            dispatcher.forward(req, resp);
        }

    }
}
