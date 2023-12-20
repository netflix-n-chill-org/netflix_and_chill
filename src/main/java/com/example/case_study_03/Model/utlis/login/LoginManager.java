package com.example.case_study_03.Model.utlis.login;


import com.example.case_study_03.Model.dao.MyConnection;
import com.example.case_study_03.Model.dao.impl.UserDAO;
import com.example.case_study_03.Model.entity.User;
import com.example.case_study_03.Model.service.IUserService;
import com.example.case_study_03.Model.service.UserService;
import com.example.case_study_03.Model.utlis.generator.CodeGenerator;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.*;


public class LoginManager {
    private static LoginManager instance;
    private final int MAX_LOGIN_ATTEMPTS = 4;
    private final IUserService userService;
    private final Map<Integer, Integer> loginAttemptsManagement;
    private final Map<Integer, Long> loginAttemptsTimeManagement;
    private final Map<Integer, Long> blockedUserManagement;
    private final Map<Integer, String> codeValidateManagement;
    private List<Integer> onlineUsers;
    private final long BLOCK_DURATION = 10 * 24 * 60 * 60 * 1000;
    private final long RESET_ATTEMPT_DURATION = 24 * 60 * 60 * 1000;

    private LoginManager() {
        UserDAO userDAO = new UserDAO(MyConnection.getConnection());
        userService = new UserService(userDAO);
        loginAttemptsManagement = new HashMap<>();

        for (User user : userService.showUsers()) {
            loginAttemptsManagement.put(user.getId(), 0);
        }
        blockedUserManagement = new HashMap<>();
        codeValidateManagement = new HashMap<>();
        onlineUsers = new ArrayList<>();
        loginAttemptsTimeManagement = new HashMap<>();

    }


    public static LoginManager getInstance() {
        if (instance == null) {
            instance = new LoginManager();
        }
        return instance;

    }


    public int authentic(ILoginRequest loginRequest) {
        Validator loginValidator = new LoginValidator(loginRequest.getUsername(), loginRequest.getPassword());
        User user = userService.getUserByUsername(loginRequest.getUsername());
//        if (user == null) {
//            return 0;
//        } else if (isBlockedUser(user.getId())) {
//            System.out.println("user " + user.getEmail() + " is blocked");
//            return 6;
//        } else if (loginValidator.isCheck() && loginAttemptsManagement.get(user.getId()) <= MAX_LOGIN_ATTEMPTS) {
//            loginAttemptsManagement.replace(user.getId(), 0);
//            return -1;
//        } else {
//            if (loginAttemptsManagement.get(user.getId()) <= MAX_LOGIN_ATTEMPTS) {
//                int count1 = loginAttemptsManagement.get(user.getId()) + 1;
//                if (count1 == 1) {
//                    loginAttemptsTimeManagement.put(user.getId(), System.currentTimeMillis());
//                }
//                if (count1 == 3) {
////                    sendAlertEmail(user.getEmail(), user.getUsername());
//                }
//                loginAttemptsManagement.replace(user.getId(), count1);
//                return count1;
//            } else {
//                System.out.println("user " + user.getEmail() + " is blocked");
//                blockUser(user.getId());
//                return 6;
//            }
//        }

        if (user == null) {
            return 0;
        } else {
            if (isBlockedUser(user.getId())) {
                System.out.println("Message 1 user blocked");
                return 5;
            } else if (loginValidator.isCheck() && loginAttemptsManagement.get(user.getId()) <= MAX_LOGIN_ATTEMPTS) {
                loginAttemptsManagement.replace(user.getId(), 0);
                return -1;
            } else if (loginAttemptsManagement.get(user.getId()) >= MAX_LOGIN_ATTEMPTS) {
                blockUser(user.getId());
                System.out.println("Message 2 user blocked");
                loginAttemptsManagement.replace(user.getId(), 0);
                return 5;
            } else {
                int count1 = loginAttemptsManagement.get(user.getId()) + 1;
                if (count1 == 1) {
                    loginAttemptsTimeManagement.put(user.getId(), System.currentTimeMillis());
                }
                if (count1 == 3) {
                    sendAlertEmail(user.getEmail(), user.getUsername());
                }
                loginAttemptsManagement.replace(user.getId(), count1);
                return count1;
            }
        }
    }



    public void blockUser(int userId) {
        blockedUserManagement.put(userId, System.currentTimeMillis() + BLOCK_DURATION);
    }

    public void clearBlock() {
        long currentTime = System.currentTimeMillis();
        for (Map.Entry<Integer, Long> entry : blockedUserManagement.entrySet()) {
            if (currentTime > entry.getValue()) {
                blockedUserManagement.remove(entry.getKey());
                loginAttemptsManagement.replace(entry.getKey(), 0);
            }
        }
    }

    public void resetLoginAttempt() {
        long currentTime = System.currentTimeMillis();
        for (Map.Entry<Integer, Long> entry : loginAttemptsTimeManagement.entrySet()) {
            if (currentTime > (entry.getValue() + RESET_ATTEMPT_DURATION)) {
                loginAttemptsTimeManagement.remove(entry.getKey());
                loginAttemptsManagement.replace(entry.getKey(), 0);
            }
        }
    }

    public void sendAlertEmail(String email, String account) {
        String username = "tn0785593@gmail.com";
        String password = "ecki jasb oraz uatw";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            javax.mail.Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("tn0785593@gmail.com"));
            message.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Alert email");

            String htmlContent = "<html><body><p>This is a alert email sent from netflix. There is a user trying to login your account. Is it you?. Do you want to block account?</p> " +
                    "<a href=\"http://localhost:8080/block-user?username=" + account + "\">Block account</a></body></html>";

            Multipart multipart = new MimeMultipart();
            MimeBodyPart htmlPart = new MimeBodyPart();
            htmlPart.setContent(htmlContent, "text/html");
            multipart.addBodyPart(htmlPart);

            message.setContent(multipart);

            Transport.send(message);

            System.out.println("Alert Email sent successfully.");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public void sendCodeEmail(String email) {
        String username = "tn0785593@gmail.com";
        String password = "ecki jasb oraz uatw";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        CodeGenerator randomCode = new CodeGenerator();
        String code = randomCode.generate();

        User user = (new UserService(new UserDAO(MyConnection.getConnection()))).getUserByUsername(email);
        codeValidateManagement.put(user.getId(), code);

        try {
            javax.mail.Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Code validation email");
            Multipart multipart = getMultipart(code);

            message.setContent(multipart);

//            message.setText("This is a code validation email sent from netflix. Code is " + code);
            Transport.send(message);

            System.out.println("Code Email sent successfully.");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private static Multipart getMultipart(String code) throws MessagingException {
        String logoUrl = "https://1000logos.net/wp-content/uploads/2017/05/Netflix-Logo.png";

        String htmlContent = "<html> <body style='font-family: Arial, sans-serif; padding: 20px;'>" +
                "                   <div style='text-align: center;'>" +
                "                    <img src='" + logoUrl + "' alt='Logo Netflix' style='width: 200px; height: auto;' />" +
                "                    </div>" +
                "<p>This is a code validation email sent from netflix. Code is " + code + "</p>" +
                "</body></html>";


        Multipart multipart = new MimeMultipart();
        MimeBodyPart htmlPart = new MimeBodyPart();
        htmlPart.setContent(htmlContent, "text/html");
        multipart.addBodyPart(htmlPart);
        return multipart;
    }

    public boolean isBlockedUser(int userId) {
        return blockedUserManagement.containsKey(userId);
    }
    public boolean isExistedUser(String username) {
        return userService.isExistUser(username);
    }
    public boolean validateCode(int userId, String code) {
        return codeValidateManagement.get(userId).equals(code);
    }

    public void addOnlineUser(int userId) {
        onlineUsers.add(userId);
    }

    public void removeOnlineUser(int userId) {
        onlineUsers.remove(userId);
    }
    public boolean isOnlineUser(int userId) {
        return onlineUsers.contains(userId);
    }

    public Map<Integer, Integer> getLoginAttemptsManagement() {
        return loginAttemptsManagement;
    }

    public Map<Integer, Long> getBlockedUserManagement() {
        return blockedUserManagement;
    }

    public Map<Integer, String> getCodeValidateManagement() {
        return codeValidateManagement;
    }

    public List<Integer> getOnlineUsers() {
        return onlineUsers;
    }

    public void setOnlineUsers(List<Integer> onlineUsers) {
        this.onlineUsers = onlineUsers;
    }
    public void addUser(User user) {
        loginAttemptsManagement.put(user.getId(), 0);
    }
}
