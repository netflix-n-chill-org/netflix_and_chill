package com.example.case_study_03.Controller;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.Properties;

@WebServlet(name="SendEmail",urlPatterns = "/send")
public class SendEmail extends HttpServlet {
    private static final long serialVersionUID =1L;

    public void sendSpecialOffer(String recipientEmail) {
        final String username  ="hieun4587@gmail.com";
        final String password ="ysey tqfa gbxe psjg";
        Properties properties = new Properties();

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            String logoUrl = "https://1000logos.net/wp-content/uploads/2017/05/Netflix-Logo.png";
            // Tạo đối tượng MimeMessage
            Message message = new MimeMessage(session);

            // Đặt thông tin người gửi
            message.setFrom(new InternetAddress("hieun4587@gmail.com"));

            // Đặt thông tin người nhận
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));

            message.setSubject("Ưu đãi đặc biệt từ Netflix");
            String emailContent = "<html>"
                    + "<body style='font-family: Arial, sans-serif; padding: 20px;'>"
                    + "<div style='text-align: center;'>"
                    + "<img src='" + logoUrl + "' alt='Logo Netflix' style='width: 200px; height: auto;' />"
                    + "</div>"
                    + "<h2 style='color: #e50914;'>Chào mừng bạn đến với Netflix!</h2>"
                    + "<p><b>" + recipientEmail + "</b>, dưới đây là ưu đãi đặc biệt của chúng tôi:</p>"
                    + "<p style='color: #e50914; font-size: 20px; font-weight: bold;'>Mã ưu đãi: <span style='color: #333;'>NETFLIX123</span></p>"
                    + "<p>Chúng tôi cung cấp nhiều dịch vụ hấp dẫn như phim và chương trình truyền hình độc quyền, chất lượng streaming cao, và khả năng xem offline. Hãy sử dụng mã ưu đãi của bạn để bắt đầu trải nghiệm!</p>"
                    + "<p>Cảm ơn bạn đã đăng ký!</p>"
                    + "</body>"
                    + "</html>";
            message.setContent(emailContent, "text/html; charset=utf-8");
            Transport.send(message);

            System.out.println("Email sent successfully.");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
