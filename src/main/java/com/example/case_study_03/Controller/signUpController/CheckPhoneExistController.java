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

@WebServlet("/checkPhoneAvailability")
public class CheckPhoneExistController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone");

        boolean isPhoneAvailable = isPhoneExisted(phone);

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.print(isPhoneAvailable);
        out.flush();
    }

    private boolean isPhoneExisted(String phone) {
        UserService userService = new UserService(new UserDAO(MyConnection.getConnection()));
        User user = userService.getUserByUsername(phone);
        return user != null;
    }
}