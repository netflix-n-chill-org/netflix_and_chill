package com.example.case_study_03.Controller;

import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.service.UserService;
import com.example.case_study_03.Model.utlis.login.LoginManager;
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
    public void init() throws ServletException {
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
        RequestDispatcher dispatcher;
        LoginManager loginManager = LoginManager.getInstance();
        if (emailCheck.isCheck()) {

            UserService userService = new UserService(userDao);
            User user = userService.getUserByUsername(email);
            HttpSession session = req.getSession();
//            if (user != null) {
//                session.setAttribute("userLogin", user);
//            }
            boolean isExistedEmail = user != null;

//            // Generate HTML/JavaScript code to save data in localStorage
//            String htmlResponse = "<html><head><script>";
//            htmlResponse += "localStorage.setItem('myData', '" + email + "');";
//            htmlResponse += "</script></head><body>";
//            htmlResponse += "<h2>Data has been saved in localStorage.</h2>";
//            htmlResponse += "</body></html>";
//
//            // Set content type and write the response
//            resp.setContentType("text/html");
//            PrintWriter out = resp.getWriter();
//            out.println(htmlResponse);
//            System.out.println("respone");


            if (isExistedEmail) {
                try {
                    if (loginManager.isOnlineUser(user.getId())) {
                        req.setAttribute("isOnlineUser", true);
                        dispatcher = req.getRequestDispatcher("/HomePage/homepage.jsp");
                        dispatcher.forward(req, resp);
                    } else {

                        session.setAttribute("emailSignIn", email);
                        // xet user da dang ki thanh cong chua
                        // thanh cong
//                        resp.sendRedirect("/login");
                        // khong thanh con
                        //resp.sendRedirect("/signup/password");
//                        dispatcher = req.getRequestDispatcher("signup/password.jsp");
//                        dispatcher.forward(req, resp);
                        resp.sendRedirect("/signup/password");
                    }
                } catch (NullPointerException ignored) {

                }

            } else {
                session.setAttribute("emailSignUp", email);
                resp.sendRedirect("/signup/registration");
            }

        } else {
            req.setAttribute("emailRegex", false);
            dispatcher = req.getRequestDispatcher("/HomePage/homepage.jsp");
            dispatcher.forward(req, resp);
        }


    }
}
