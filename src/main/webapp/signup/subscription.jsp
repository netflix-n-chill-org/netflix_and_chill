<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/13/2023
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Netflix</title>
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
        .content{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .select {
            width: 100%;
            max-width: 410px;
            padding: 15px;
            text-align: center;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
        }
        .select p, .select h1, .select h3 {
            color: #333;
            margin-bottom: 10px;
        }
        .select h1 {
            font-size: 24px;
            font-weight: bold;
        }
        .select h3 {
            font-size: 18px;
        }
        .service-option {
            margin: 20px 0;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }
        .service-option i {
            margin-right: 10px;
        }
        .service-option p{
            display: flex;
            margin-bottom: 10px;
            align-items: center;
        }
        .button {
            color: white;
            background-color: #e10909;
            padding: 10px 20px;
            margin-top: 20px;
            border: none;
            cursor: pointer;
            text-align: center;
            display: block;
            width: 100%;
            font-size: 16px;
            border-radius: 5px;
        }
        .header .navbar .right button a {
            text-decoration: none;
            color: #000;
            background-color: white;
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
    <script src="https://kit.fontawesome.com/4e9e7bbd1b.js" crossorigin="anonymous"></script>
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
<div class="select">
    <i class="far fa-check-circle" style="color: #e10909;font-size: 30px"></i>
    <p>Bước 2/3</p>
    <h1>Chọn gói dịch vụ của bạn</h1>
    <div class="service-option">
        <i class="fa-solid fa-check" style="color: #e10909;font-size: 20px"></i><p>Không yêu cầu cam kết, hủy bất kỳ lúc nào</p>
    </div>
    <div class="service-option">
        <i class="fa-solid fa-check" style="color: #e10909;font-size: 20px"></i><p>Mọi tính năng Netflix và chất lượng tối đa</p>
    </div>
    <div class="service-option">
        <i class="fa-solid fa-check" style="color: #e10909;font-size: 20px"></i><p>Không quảng cáo, không phụ phí. Luôn luôn như vậy</p>
    </div>
    <a href="planform.jsp" style="text-decoration: none">
        <button class="button" style="color:white;">Tiếp theo</button>
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
