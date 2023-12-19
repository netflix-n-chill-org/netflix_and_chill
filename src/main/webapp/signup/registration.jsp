<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/13/2023
  Time: 8:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            color: black;
            height: 100vh;
            margin: 0;
        }

        .header::before {
            content: "";
            position: absolute;
            height: 100%;
            width: 100%;
            opacity: 0.6;
            z-index: -1;

        }

        .header .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 140px;
            border-bottom: 1px solid #e6e6e6;
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

        .button {
            background-color: #e50914;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            display: block;
            width: 100%;
        }
        .content{

            align-items: center;
            background-color: #fff;
            border-radius: 8px;
            max-width: 400px;
            margin: auto;
            padding-top: 150px;
            padding-bottom: 150px;
        }
        .instruction {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        .instruction h1{
            display: inline-block;
            font-size: 32px;
            max-width: 340px;
            font-weight: 500;
            padding-bottom: 20px;
        }
        .instruction p{
            display: inline-block;
            max-width: 300px;
            font-size: 17px;
            font-weight: 400;
        }
        .step {
            color: #333;
            font-size: 15px;
            text-align: inherit;
            margin-bottom: 10px;
        }
        .devices {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .devices img{
            display: block;
            width: 80%;
            height: auto;
        }
        .footer{
            border-top: 1px solid #e6e6e6;
            padding: 30px 10% 10px;
            color:#777;
            background-color: #f3f3f3;
        }
        .footer h2{
            font-size: 18px;
            font-weight: 400;
            margin-bottom: 30px;
        }
        .footer .column{
            flex-basis: 25%;
            flex-grow: 1;
            margin-bottom:20px;
        }
        .footer .column a{
            display: block;
            text-decoration: none;
            color:#737373;
            font-size: 15px;
            margin-bottom: 10px;
        }
        .footer .row{
            align-items: flex-start;
            padding: 10px 0;
            border-bottom: none;
        }
        .column select{
            padding: 10px;
            border: none;
        }
        .footer .language{
            color:#333;
            font-size: 16px;
            height: 48px;
            padding: 10px 30px 12px 10px;
            background: #fff;
            border: 1px solid #a6a6a6;
            margin-top: 10px;
        }
        .column p{
            margin-top: 10px;
            color:white;
        }
        .row {
            display: flex;
            width: 100%;
            align-items: center;
            flex-wrap: wrap;
            padding: 50px;
            margin-bottom: 20px;
            border-bottom: 8px solid#383737;
        }

        /* Responsive Styles */
        @media only screen and (max-width: 600px) {
            .header .navbar {
                flex-direction: column;
                padding: 10px;
            }
            .content {
                padding-top: 50px;
                padding-bottom: 50px;
            }
            .footer .row {
                flex-direction: column;
            }
        }
    </style>
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
            <button><a href="#">Đăng nhập</a></button>
        </div>
    </nav>
</div>
<div class="content">
    <div class="devices">
       <img src="../img/Devices.png" alt="">
    </div>
    <div class="instruction">
        <div class="step">BƯỚC 1/3</div>
        <h1>Hoàn thành việc cài đặt tài khoản của bạn. </h1>
        <p>Netflix được cá nhân hóa cho riêng bạn. Tạo một tài khoản để xem Netflix trên bất kỳ thiết bị nào, vào bất cứ lúc nào.</p>
    </div>
    <form action="/signup/registration" method="post">
        <button class="button" style="color:white;">Tiếp theo</button>
    </form></div>
    <div class="footer">
        <h2>Bạn có câu hỏi? Liên hệ với chúng tôi.</h2>
        <div class="row">
            <div class="column">
                <a href="#">Câu hỏi thường gặp</a>
                <a href="#">Quyền riêng tư</a>
                <select name="language" class="language">
                    <option value="Vietnamese">🌐Tiếng việt</option>
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
</body>
</html>
