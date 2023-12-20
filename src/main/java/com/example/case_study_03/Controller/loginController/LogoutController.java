package com.example.case_study_03.Controller.loginController;

import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.utlis.login.LoginManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        session.removeAttribute("loggedInUser");
        session.removeAttribute("isOnlineUser");

        List<Integer> onlineUsers = LoginManager.getInstance().getOnlineUsers();
        for (int i = 0; i < onlineUsers.size(); i++) {
            if (onlineUsers.get(i) == user.getId()) {
                onlineUsers.remove(i);
                break;
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/login/logout.jsp");
        dispatcher.forward(request, response);

    }


}
