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
import java.sql.SQLException;

import static com.example.case_study_03.Model.dao.MyConnection.getConnection;

@WebServlet("/signup/mobileWalletOption")
public class MobileWalletOptionController extends HttpServlet {
    private UserDAO userDAO;


    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO(getConnection());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        RequestDispatcher dispatcher;
        try {
            if (Integer.parseInt((String) session.getAttribute("signUpStep")) < 6) {
                resp.sendRedirect("/signup/paymentPicker");
            } else {
                dispatcher = req.getRequestDispatcher("mobileWalletOption.jsp");
                dispatcher.forward(req, resp);
            }
        }   catch (NumberFormatException e) {
            resp.sendRedirect("/main");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String phone = req.getParameter("phone");
        HttpSession session = req.getSession();
        session.setAttribute("phoneNumber", phone);
        User newUser = (User) session.getAttribute("newUser");
        newUser.setPhone(phone);
        session.setAttribute("signUpStep", "7");
        UserService userService = new UserService(userDAO);

        try {
            userService.updateProfile(newUser);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }try {
            userService.updateProfile(newUser);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        // chuyen trang thanh toan bang qr cua momo
        resp.sendRedirect("/momo");
    }
}
