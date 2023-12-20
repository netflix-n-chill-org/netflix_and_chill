<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/13/2023
  Time: 4:37 PM
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
            width: 35%;
            padding: 20px;
            background-color: #fff;
            text-align: left
        }

        .form-group-1 {
            padding-top: 20px;
            position: relative;
            flex-wrap: wrap;
            line-height: 1.125rem;
            display: flex;
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
            margin-top: 30px
        }

        .phone-input-container {
            text-align: center;
            position: relative;
            margin-top: 20px;
        }

        .phone-prefix {
            position: absolute;
            top: 50%;
            left: 20px;
            transform: translateY(-50%);
            background-image: url('https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/1280px-Flag_of_Vietnam.svg.png');
            background-repeat: no-repeat;
            background-size: 30px;
            width: 30px;
            height: 20px;
            z-index: 1;
        }

        .phone-input {
            font-size: 16px;
            border: 2px solid #ccc;
            border-radius: 5px;
            width: 480px;
            margin: 10px;
            padding: 10px 10px 10px 40px;
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
        <p>BƯỚC 3/3</p>
        <h1 style="color: #333">Thiết lập MoMo</h1>
        <img src="../img/MOMOPAY.png" width="40px" height="30px"
             style="float: left;height: 25px;margin: 1px 6px 1px 0;">
        <br>
        <p style="text-align: left;padding-top: 20px">Hãy nhập số điện thoại di động MoMo của bạn</p>
        <p style="padding-top: 10px">Chúng tôi cũng sẽ dùng số điện thoại của bạn nếu bạn quên mật khẩu, cũng như để gửi
            các tin nhắn quan trọng về tài khoản. Bạn có thể phải trả phí tin nhắn SMS.</p>
        <p style="color: #777777;font-size:12px;padding-top: 20px">Bằng cách đánh dấu vào hộp kiểm bên dưới, bạn đồng ý
            với <span style="color:#0071eb">  Điều khoản sử dụng, Tuyên bố về quyền riêng tư</span> của chúng tôi, đồng
            thời xác nhận rằng bạn trên 18 tuổi. Netflix sẽ tự động gia hạn tư cách thành viên của bạn và tính phí thành
            viên (hiện tại là 70.000 ₫/tháng) vào phương thức thanh toán của bạn cho đến khi bạn hủy. Bạn có thể hủy bất
            kỳ lúc nào để tránh bị tính phí về sau.</p>
       <form method="post" action="/signup/mobileWalletOption">
        <div class="form-group-1">
            <input type="checkbox" id="special-offers" name="special-offers" style="width: 20px;height: 20px" required>
            <label for="special-offers" class="special-offers" style="padding-left: 10px">Tôi dồng ý.</label>
        </div>
        <div class="phone-input-container">
            <div class="phone-prefix"></div>
            <input type="tel" class="phone-input" name="phone" placeholder="Nhập số điện thoại...">
        </div>
           <p>Plan: ${plan}<a href="/signup/editPlan">Change</a></p>
           <button class="button" style="color:white;" type="submit">Kích hoạt tư cách thành viên</button>
<%--           <input type="submit" value="Kích hoạt tài khoản">--%>

        <p style="text-align: center;padding-top: 20px;padding-bottom: 100px">Bạn sẽ được chuyển đến MoMo để hoàn tất
            việc thanh toán.</p>
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
</body>
</html>
