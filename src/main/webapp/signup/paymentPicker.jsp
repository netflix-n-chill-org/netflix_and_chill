<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/13/2023
  Time: 3:47 PM
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
            cursor: pointer;
            outline: none;
            border: none;
        }

        .header .navbar .right button a {
            text-decoration: none;
            color: #000;
            background-color: white;
        }
        .content {
            display: flex;
            justify-content: center;
            margin: 0;
            padding: 0;
        }
        .box {
            width: 40%;
            padding: 20px;
            background-color: #fff;
            text-align: center;

        }
        .option {
            display: flex;
            align-items: center;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin: 10px;
            position: relative;
            transition: position .5s ease-in;
        }
        .option::after {
            content: ">";
            font-size: 20px;
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
        }
        .option img {
            vertical-align: middle; /* Center the image vertically */
            margin-left: 10px; /* Add some space to the left of the image */
        }
        .footer {
            border-top: 1px solid #e6e6e6;
            padding: 30px 10% 10px;
            color: #777;
            background-color: #f3f3f3;
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
            color: #737373;
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
            <button><a href="../login/logout.jsp">Đăng xuất</a></button>
        </div>
    </nav>
</div>
<div class="content">
    <div class="box">
        <img src="../img/lock.png" width="50px" height="50px">
        <p style="padding-top: 40px">BƯỚC 3/3</p>
        <h1 style="color:#333;padding: 10px;">Chọn cách thanh toán</h1>
        <p style="font-size: 20px;max-width: 500px;text-align: center;display: inline-block;color:#333">Quá trình thanh toán của bạn được mã hóa và bạn có thể thay đổi cách thanh toán bất kỳ lúc nào.</p>
        <h4 style="font-size: 18px;color:#333;display: inline-block;max-width: 300px;padding-top: 10px">An toàn để an tâm.
            Hủy trực tuyến dễ dàng.</h4>
        <a href="mobileWalletOption.jsp" style="text-decoration: none;color: #000">
        <div class="option">
            <p style="font-size: 20px;text-align: left">
                Ví điện tử    <img src="../img/MOMOPAY.png" alt="" width="40px" height="30px"></p>
        </div>
        </a>
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
