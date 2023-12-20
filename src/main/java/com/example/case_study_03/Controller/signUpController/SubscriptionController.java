package com.example.case_study_03.Controller.signUpController;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/subscription")

public class SubscriptionController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        RequestDispatcher dispatcher;
        try {
            if (Integer.parseInt((String) session.getAttribute("signUpStep")) < 3) {
                resp.sendRedirect("/signup/registration");
            } else {
                dispatcher = req.getRequestDispatcher("signup/subscription.jsp");
                dispatcher.forward(req,resp);
            }
        }   catch (NumberFormatException e) {
            resp.sendRedirect("/main");
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie lastStep = new Cookie("lastStep", "2");
        HttpSession session = req.getSession();
        resp.addCookie(lastStep);

        session.setAttribute("signUpStep", "4");
        resp.sendRedirect("/signup/planform");
    }
}
