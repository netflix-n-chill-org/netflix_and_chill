package com.example.case_study_03.Controller.loginController;

import com.example.case_study_03.Model.dao.MyConnection;
import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.utlis.login.LoginManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login/forgetPassword")
public class ForgetPassController extends HttpServlet {
    private UserDAO userDAO;
    private User user;

    @Override
    public void init() throws ServletException {
        this.userDAO = new UserDAO(MyConnection.getConnection());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
            try {
                if ((int) session.getAttribute("forgetPassStep") >= 2) {
                    RequestDispatcher dispatcher = req.getRequestDispatcher("forgetPass.jsp");
                    dispatcher.forward(req, resp);
                } else {
                    resp.sendRedirect("/login");
                }
            } catch (NullPointerException e) {
                resp.sendRedirect("/login");
            }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String code = req.getParameter("code").trim();
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("forgetUser");
            boolean validateCode = LoginManager.getInstance().validateCode(user.getId(), code);
            if (validateCode) {
                   req.setAttribute("codeValidate", true);
                   resp.sendRedirect("/login/changePass");
            } else {
                   RequestDispatcher dispatcher = req.getRequestDispatcher("forgetPass.jsp");
                   req.setAttribute("codeValidate", false);
                  dispatcher.forward(req, resp);
           }
    }

}