package com.example.case_study_03.Controller;

import com.example.case_study_03.Model.dao.impl.UserEmailDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import static com.example.case_study_03.Model.dao.MyConnection.getConnection;

@WebServlet(name="SignupController",urlPatterns = "/signup")

public class SignupController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String email = (String) request.getSession().getAttribute("processedEmail");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String specialOffers = request.getParameter("special-offers");
        UserEmailDAO userDAO = new UserEmailDAO(getConnection());
        userDAO.updateUserDetails(email,name,username,password,phone);
        if ("on".equals(specialOffers)) {
            SendEmail sendEmail = new SendEmail();
            sendEmail.sendSpecialOffer(email);
        }
        response.sendRedirect("/signup/subscription.jsp");
    }

}
