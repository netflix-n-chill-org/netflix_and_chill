package com.example.case_study_03.Controller.loginController;

import com.example.case_study_03.Model.dao.MyConnection;
import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.service.UserService;
import com.example.case_study_03.Model.utlis.login.ILoginRequest;
import com.example.case_study_03.Model.utlis.login.LoginManager;
import com.example.case_study_03.Model.utlis.login.LoginRequest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    UserDAO userDAO;
    private ScheduledExecutorService scheduler;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO(MyConnection.getConnection());

        scheduler = Executors.newScheduledThreadPool(1);

        scheduler.scheduleAtFixedRate(this::clearBlock, 0, 10, TimeUnit.DAYS);

        scheduler.scheduleAtFixedRate(this::resetAttempt, 0, 24, TimeUnit.HOURS);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getAttribute("auth") == null) {
            req.setAttribute("auth", -1);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("login/login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        session.setAttribute("emailSignIn", username);


        ILoginRequest loginRequest = new LoginRequest(username, password);
        LoginManager loginManager = LoginManager.getInstance();

        int auth = loginManager.authentic(loginRequest);
        RequestDispatcher dispatcher;
        session.setAttribute("email", username);

        if (auth == -1) {
            User user = (new UserService(userDAO)).getUserByUsername(username);
            session.setAttribute("currentUser", user);
            session.setAttribute("signInStep", "2");
            try {
                String rememberMe = req.getParameter("rememberMe");

                if (rememberMe.equals("true")) {


                    Cookie usernameCookie = new Cookie("username", username);
                    Cookie passwordCookie = new Cookie("password", password);
                    Cookie rememberMe1 = new Cookie("rememberMe", "true");



                    // Đặt thời gian sống của cookie (ví dụ: 1 ngày)
                    usernameCookie.setMaxAge(365 * 24 * 60 * 60);
                    passwordCookie.setMaxAge(365 * 24 * 60 * 60);
                    rememberMe1.setMaxAge(365 * 24 * 60 * 60);

                    // Thêm cookie vào phản hồi
                    resp.addCookie(usernameCookie);
                    resp.addCookie(passwordCookie);
                    resp.addCookie(rememberMe1);

                }
            } catch (NullPointerException ignored) {

            }
            UserService userService = new UserService(userDAO);
            User loginUser = userService.getUserByUsername(username);
            if (!loginManager.isOnlineUser(loginUser.getId())) {
                loginManager.addOnlineUser(loginUser.getId());
                session.setAttribute("loggedInUser", user);
                resp.sendRedirect("/browse");
            } else {
                dispatcher = req.getRequestDispatcher("login/login.jsp");
                req.setAttribute("isOnlineUser", true);
                dispatcher.forward(req, resp);
            }

        }else {
            req.setAttribute("auth", auth);
            dispatcher = req.getRequestDispatcher("login/login.jsp");
            dispatcher.forward(req, resp);
            session.setAttribute("email", username);
        }
    }


    private Runnable clearBlock() {
        LoginManager.getInstance().clearBlock();
        return null;
    }

    private Runnable resetAttempt() {
        LoginManager.getInstance().resetLoginAttempt();
        return null;
    }

}
