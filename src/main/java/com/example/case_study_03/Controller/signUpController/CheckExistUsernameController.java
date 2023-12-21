package com.example.case_study_03.Controller.signUpController;

import com.example.case_study_03.Model.dao.MyConnection;
import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/checkUsernameAvailability")
public class CheckExistUsernameController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        boolean isUsernameAvailable = isUsernameExisted(username);

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.print(isUsernameAvailable);
        out.flush();
    }

    private boolean isUsernameExisted(String username) {
        UserService userService = new UserService(new UserDAO(MyConnection.getConnection()));
        User user = userService.getUserByUsername(username);
        return user != null;
    }
}