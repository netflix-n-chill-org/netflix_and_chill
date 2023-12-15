<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/13/2023
  Time: 10:23 AM
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
        .content{
            align-items: center;
            background-color: #fff;
            border-radius: 8px;
            max-width: 400px;
            margin: auto;
            padding-top: 40px;
            padding-bottom: 120px;
        }
        .button {
            background-color: #e50914;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 20px 20px;
            font-size: 16px;
            cursor: pointer;
            display: block;
            width: 100%;
        }
        .instruction {
            color: #333;
            margin-bottom: 20px;
        }
        .instruction h1{
            display: inline-block;
            font-size: 30px;
            max-width: 500px;
            font-weight: 500;
            padding-bottom: 20px;
        }
        .instruction p{
            display: inline-block;
            max-width: 400px;
            font-size: 17px;
            font-weight: 400;
        }
        .step {
            text-align: left;
            color: #333;
            font-size: 16px;
            margin-bottom: 10px;

        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group-1{
            position: relative;
            flex-wrap: wrap;
            line-height: 1.125rem;
            display: flex;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="tel"]{
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        #special-offers{
            position: absolute;
            width:20px;
            height: 20px;
        }
        .special-offers {
            margin-left: 30px;
            font-size: 1rem;
            color: rgb(0, 0, 0);
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
            <button><a href="">Đăng nhập</a></button>
        </div>
    </nav>
</div>
<div class="content">
    <div class="instruction">
        <div class="step">BƯỚC 1/3</div>
        <h1>Tạo mật khẩu để bắt đầu tư cách thành viên của bạn</h1>
        <form action="${pageContext.request.contextPath}/signup" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<%= session.getAttribute("processedEmail") %>">
            </div>
            <div class="form-group">
                <label for="name">Họ và tên</label>
                <input type="text" id="name" name="name" class="form-input" placeholder="Nhập họ tên của bạn">
            </div>
            <div class="form-group">
                <label for="username">Tài khoản</label>
                <input type="text" id="username" name="username" class="form-input" placeholder="Nhập tài khoản của bạn">
            </div>
            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu của bạn">
            </div>
            <div class="form-group">
                <label for="phone">Số điện thoại</label>
                <input type="tel" id="phone" name="phone" placeholder="Nhập số điện thoại của bạn">
            </div>
            <div class="form-group-1">
                <input type="checkbox" id="special-offers" name="special-offers" value="on" onclick="handleCheckboxClick()">
                <label for="special-offers" class="special-offers">Vui lòng không gửi các ưu đãi đặc biệt của Netflix qua email cho tôi.</label>
            </div>
            <button class="button" style="color:white;" type="submit">Tiếp theo</button>
        </form>
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
<script>
    function handleCheckboxClick() {
        var checkbox = document.getElementById("special-offers");
        if (checkbox.checked) {
            fetch("${pageContext.request.contextPath}/signup")
                .then(response => response.json())
                .then(data => console.log(data))
                .catch(error => console.error(error));
        }
    }
</script>
</body>
</html>
