package com.example.case_study_03.Controller.signUpController;

import com.example.case_study_03.Model.entity.Subscription;
import com.example.case_study_03.Model.entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/signup/planform", "/signup/editPlan"})
public class PlanFormController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        RequestDispatcher dispatcher;
        try {
            if (Integer.parseInt((String) session.getAttribute("signUpStep")) < 4) {
                resp.sendRedirect("/subscription");
            } else {
                dispatcher = req.getRequestDispatcher("planform.jsp");
                dispatcher.forward(req, resp);
            }
        }  catch (NumberFormatException e) {
            resp.sendRedirect("/main");
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String plan = req.getParameter("plan");
        HttpSession session = req.getSession();
        session.setAttribute("plan", plan);
        User user = (User) session.getAttribute("newUser");
        Subscription subscription = new Subscription();
        subscription.setName(plan);
        subscription.setUserId(user.getId());


        int signUpStep = Integer.parseInt((String) session.getAttribute("signUpStep"));
        if (signUpStep == 4) {
            session.setAttribute("signUpStep", "5");
            resp.sendRedirect("/signup/paymentPicker");
        } else {
            resp.sendRedirect("/signup/mobileWalletOption");
        }
    }
}
