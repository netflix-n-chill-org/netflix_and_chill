package com.example.case_study_03.Controller.signUpController;

import com.example.case_study_03.Controller.SendEmail;
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
import java.sql.SQLException;

import static com.example.case_study_03.Model.dao.MyConnection.getConnection;

@WebServlet("/signup/regform")
public class RegFormController extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO(getConnection());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("regform.jsp");
        dispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String name = req.getParameter("name");
        String username =req.getParameter("username");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String specialOffers = req.getParameter("special-offers");
        UserService userService = new UserService(userDAO);
        boolean existEmail = userService.isExistUser(email);
        req.setAttribute("existEmail", existEmail);
        RequestDispatcher dispatcher;
        Validator emailValidator = new EmailRegexValidator(email);
        boolean emailCheck = emailValidator.isCheck();

        if (!existEmail) {
            if (emailCheck) {
                User newUser = new User();
                newUser.setName(name);
                newUser.setUsername(username);
                newUser.setPassword(password);
                newUser.setPhone(phone);
                newUser.setEmail(email);
                HttpSession session = req.getSession();
                session.setAttribute("newUser", newUser);
                try {
                    userService.addAllUser(newUser);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                if ("on".equals(specialOffers)) {
                    SendEmail sendEmail = new SendEmail();
                    sendEmail.sendSpecialOffer(email);
                }
               resp.sendRedirect("/subscription");
            } else {
                req.setAttribute("emailCheck", emailCheck);
                dispatcher = req.getRequestDispatcher("regform.jsp");
                dispatcher.forward(req,resp);
            }

        } else {
            dispatcher = req.getRequestDispatcher("regform.jsp");
            dispatcher.forward(req,resp);
        }

    }

}
