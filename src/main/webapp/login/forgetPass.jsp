<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 13/12/2023
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forget Password</title>
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
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 20px;
        }

        .box {
            width: 350px;
            height: auto;
            padding: 30px;
            background-color: #fff;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .box h1, .box p {
            color: #333;
            margin-bottom: 15px;
        }

        .content label {
            display: block;
            margin-bottom: 15px;
        }

        .content input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .content .button {
            background-color: #3174ea;
            color: white;
            border: none;
            padding: 12px 20px;
            width: 100%;
            cursor: pointer;
            font-size: 16px;
            border-radius: 4px;
            margin-top: 20px;
        }

        .content .button:hover {
            background-color: #0056b3;
        }

        .content p {
            margin-top: 20px;
        }

        .content a {
            color: #3174ea;
            text-decoration: none;
            font-weight: bold;
        }

        .content a:hover {
            text-decoration: underline;
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
        <h1>Quên mật khẩu</h1>
        <p>Một đoạn mã đã được gửi đến email của bạn. Vui lòng kiểm tra thư và nhập mã để xác nhận</p>
        <form action="${pageContext.request.contextPath}/login/forgetPassword" method="post">
            <label>
                <input type="text" name="code" oninput="change()" >
            </label>
            <c:if test="${codeValidate == false}">
                <p style="color:red" id="change">Sai mật mã</p>
            </c:if>
            <label>
                <input type="submit" value="gửi email cho tôi" class="button">
            </label>
        </form>
        <p>Không nhận được mã</p>
        <a href="${pageContext.request.contextPath}/login/sendCode">Gửi lại mã</a>
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
<script>
    function change() {
        document.getElementById("change").style.display = "none";
    }
</script>
</html>
