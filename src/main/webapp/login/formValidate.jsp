<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/18/2023
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Netflix</title>
    <link rel="icon" href="../img/logo/logo.png" type="image/png">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Netflix Sans, Helvetica Neue, Segoe UI, Roboto, Ubuntu, sans-serif;
        }

        body {
            background-color: #000000;
            color: #fff;
            height: 100vh;
            margin: 0;
        }

        .header::before {
            content: "";
            position: absolute;
            height: 100%;
            width: 100%;
            background: linear-gradient(to top, rgba(0, 0, 0, 0.8) 0, rgba(0, 0, 0, 0) 60%, rgba(0, 0, 0, 0.8) 100%), url(../img/log-out.jpg);
            z-index: -1;
        }

        .header .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 140px;
        }

        .logo {
            width: 150px;
            cursor: pointer;
        }

        .header .navbar .right button {
            font-size: 18px;
            font-weight: 400;
            padding: 7px 17px;
            background-color: #e50914;
            cursor: pointer;
            outline: none;
            border-radius: 4px;
            border: none;
        }

        .header .navbar .right button a {
            text-decoration: none;
            color: white;
        }

        .header-content h1 {
            font-size: 50px;
            line-height: 1.2;
            max-width: 100%;
            margin-bottom: 10px;
        }

        .header-content h3 {
            font-weight: 400;
            margin-bottom: 20px;
            font-size: 1.5rem;
        }
        .content {
            display: flex;
            justify-content: center;
            margin: 0;
            padding: 40px;
        }

        .box {
            background-color: #f0f0f0;
            padding: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 30%;
            height: 500px;
            margin: auto;
        }

        .reset-form {
            max-width: 400px;
            margin: 0 auto;
        }

        h1 {
            color: #000;
            font-size: 24px;
            margin-bottom: 10px;
        }

        p {
            color: #000;
            margin-bottom: 10px;
            text-align: left;
        }

        .reset-option {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .radio-group {
            margin-left: 20px;
            font-size: 18px;
        }

        .radio-group label {
            display: block;
            margin-bottom: 10px;
            color:#000;
        }

        .radio-group input[type="radio"] {
            margin-right: 5px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        .reset-instruction {
            margin-top: 10px;
            margin-bottom: 20px;
        }

        input[type="email"] {
            width: calc(100% - 16px);
            padding: 8px;
            font-size: 16px;
            margin-bottom: 30px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: calc(100% - 16px);
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            color: #007BFF;
            text-decoration: none;
        }

        a:hover {
            color: #0056b3;
        }
        .footer {
            margin-top: 50px;
            padding: 30px 10% 10px;
            color: white;
            background-color: #000;
            z-index: -1;
            opacity: 0.5;
        }

        .footer h2 {
            font-size: 18px;
            font-weight: 400;
            margin-bottom: 30px;
        }

        .footer .column {
            flex-basis: 25%;
            flex-grow: 1;
            margin-bottom: 20px;
        }

        .footer .column a {
            display: block;
            text-decoration: none;
            color: white;
            font-size: 15px;
            margin-bottom: 10px;
        }

        .footer .row {
            align-items: flex-start;
            padding: 10px 0;
            border-bottom: none;
        }

        .column select {
            padding: 10px;
            border: none;
        }

        .footer .language {
            color: #333;
            font-size: 16px;
            height: 48px;
            padding: 10px 30px 12px 10px;
            background: #fff;
            border: 1px solid #a6a6a6;
            margin-top: 10px;
        }

        .column p {
            margin-top: 10px;
            color: white;
        }

        .row {
            display: flex;
            width: 100%;
            align-items: center;
            flex-wrap: wrap;
            padding: 50px;
            margin-bottom: 20px;
            border-bottom: 8px solid #383737;
        }
    </style>
    <%
        session = request.getSession();
        String email = (String) session.getAttribute("email");
        if (email == null) {
            email = (String) request.getAttribute("emailSignIn");
            if (email == null) {
                email = "";
            }
        }    %>
</head>
<body>
<div class="header">
    <nav class="navbar">
        <div class="left">
            <a href="../HomePage/homepage.jsp">
                <img src="../img/logo/netflix-logo.png" alt="" class="logo">
            </a>
        </div>
        <div class="right">
            <button><a href="">Đăng xuất</a></button>
        </div>
    </nav>
</div>
<div class="content">
    <div class="box">
        <form action="/login/formValidate" method="post" class="reset-form">
            <h1>Quên email/mật khẩu
            </h1>
            <p class="reset-option">Bạn muốn đặt lại mật khẩu bằng cách nào?</p>
            <div class="radio-group">
                <label><input type="radio" name="form" value="email"> Email</label>
                <label><input type="radio" name="form" value="sms"> Tin nhắn văn bản (SMS)</label>
            </div>
            <p class="reset-instruction">Chúng tôi sẽ gửi cho bạn mã xác thực qua tin nhắn để đặt lại mật khẩu của bạn. Bạn có thể phải trả phí tin nhắn hoặc dữ liệu.
                .</p>
            <div class="input-group">
                <input type="email" name="emailAddress" id="email" value="<%=email%>" onchange="change()">
            </div>
            <c:if test="${isUser == false}">
                <p style="color: red;" id="notSignIn">Tài khoản chưa đăng ký</p>
            </c:if>
            <c:if test="${isBlockedUser == true}">
                <p style="color: red;" id="notSignIn">Tài khoản đã bị khoá</p>
            </c:if>

            <input type="submit" value="Gửi email cho tôi">
            <p style="padding-top: 20px;text-align: left"><a href="#">I don't remember my email or phone.</a></p>
        </form>
    </div>
</div><div class="footer">
    <h2>Bạn có câu hỏi? Liên hệ với chúng tôi.</h2>
    <div class="row">
        <div class="column">
            <a href="#">Câu hỏi thường gặp</a>
            <a href="#">Quyền riêng tư</a>
            <select name="language" class="language">
                <option value="Vietnamese">🌐 Tiếng việt</option>
                <option value="English">🌐 English</option>
            </select>
        </div>
        <div class="column">
            <a href="#">Trung tâm trợ giúp</a>
            <a href="#">Tùy chọn cookie</a>
        </div>
        <div class="column">
            <a href="#">Cửa hàng Netflix</a>
            <a href="#">Thông tin doanh nghiệp</a>
        </div>
        <div class="column">
            <a href="#">Điều khoản sử dung</a>
        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function (){
        document.getElementById("email").value = localStorage.getItem("usernameLogin");
    })

    function change() {
        localStorage.setItem("usernameLogin", document.getElementById("email").value)
    }
</script>
</body>
</html>
