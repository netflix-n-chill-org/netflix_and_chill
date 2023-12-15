<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/13/2023
  Time: 6:17 PM
  To change this template use File | Settings | File Templates.
--%>
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
            padding: 20px;
        }

        .box {
            width: 350px;
            padding: 40px;
            background-color: #f0f0f0;
            text-align: center;
        }

        .content button {
            background-color: #3174ea;
            color: white;
            border: none;
            padding: 10px 20px;
            width: 250px;
            cursor: pointer;
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
        <h2 style="color: #000;margin-bottom: 20px;">Chia tay sớm vậy sao?</h2>
        <p style="color: #000;margin-bottom: 20px;text-align: left;margin-left: 2px">Nhắc nhở, không phải lúc nào bạn
            cũng cần đăng xuất khỏi Netflix đâu. Điều này chỉ cần thiết nếu bạn đang dùng máy tính công cộng hoặc dùng
            chung</p>
        <button>Thoát ngay</button>
    </div>
</div>
<div class="footer">
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
</body>
</html>
