package com.example.case_study_03.Controller.loginController;

import com.example.case_study_03.Model.dao.MyConnection;
import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login/changePass")

public class ChangePassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            if ((int) session.getAttribute("forgetPassStep") >= 2) {
                RequestDispatcher dispatcher = req.getRequestDispatcher("changePassword.jsp");
                dispatcher.forward(req,resp);
            } else {
                resp.sendRedirect("/login");
            }
        } catch (NullPointerException e) {
            resp.sendRedirect("/login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newPass = req.getParameter("newPass");
        String newPassAgain = req.getParameter("newPassAgain");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("forgetUser");
        session.setAttribute("email", user.getEmail());
        if (newPassAgain.equals(newPass)) {
            UserDAO userDAO = new UserDAO(MyConnection.getConnection());
            UserService userService = new UserService(userDAO);
            user.setPassword(newPass);
            try {
                userService.updatePassword(user);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            Cookie[] cookies = req.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    resp.addCookie(cookie);
                    if (cookie.getValue().equals(user.getEmail())) {
                        for (Cookie cookie1 : cookies) {
                            if (cookie1.getName().equals("rememberMe")) {
                                cookie1.setMaxAge(0);
                                cookie1.setPath("/");
                                resp.addCookie(cookie1);
                                break;
                            }
                        }
                    }
                    break;
                }
            }

//            PrintWriter writer = resp.getWriter();
//            writer.write("<html>");
//            writer.write("<h1>Change password success</h1>");
//            writer.write("</html>");

            resp.sendRedirect("/login");
        } else {
            RequestDispatcher dispatcher = req.getRequestDispatcher("changePassword.jsp");
            req.setAttribute("isNotCatch", true);
            dispatcher.forward(req, resp);
        }
    }
}
