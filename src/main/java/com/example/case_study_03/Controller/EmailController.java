package com.example.case_study_03.Controller;

import com.example.case_study_03.Model.dao.impl.UserEmailDAO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static com.example.case_study_03.Model.dao.MyConnection.getConnection;

@WebServlet(name="EmailServlet",urlPatterns = "/validateEmail")
public class EmailController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        boolean isValidEmail = isValidEmail(email);
        if (isValidEmail) {
            UserEmailDAO userDAO = new UserEmailDAO(getConnection());
            if (userDAO.isEmailExists(email)) {
                HttpSession session = request.getSession();
                session.setAttribute("emailExistsMessage", "* Email đã tồn tại. Vui lòng đăng nhập hoặc sử dụng email khác.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/HomePage/homepage.jsp");
                dispatcher.forward(request, response);
            } else {
                userDAO.saveUserEmail(email);
                HttpSession session = request.getSession();
                session.setAttribute("processedEmail", email);
                response.sendRedirect(request.getContextPath() + "/signup/registration.jsp");
            }
        } else {
            response.getWriter().println("Địa chỉ email không hợp lệ");
        }
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        return email.matches(emailRegex);
    }
}
