<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/19/2023
  Time: 8:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 13/12/2023
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change password</title>
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

        .content {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 40px 0;
        }
        .box {
            width: 40%;
            padding: 20px;
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .box form {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }
        table td {
            padding: 10px 5px;
            white-space: nowrap;
            vertical-align: top;
        }
        label {
            margin-bottom: 5px;
        }

        label {
            display: block;
        }
        td label input[type="password"]{
            width: 340px;
        }
        input[type="password"] {
            padding: 8px;
            box-sizing: border-box;
        }

        p {
            margin-top: 5px;
        }

        #catch {
            text-align: center;
            color: red;
            display: none;
        }

        input[type="submit"] {
            background-color: #3174ea;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
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
        <h1 style="color: #333">Đổi mật khẩu của bạn</h1>
        <p style="text-align: left;padding-top: 20px">Bảo vệ tài khoản của bạn bằng một mật khẩu duy nhất dài ít nhất 6 ký tự.
        </p>
        <br>
        <form id="myForm" action="${pageContext.request.contextPath}/login/changePass" method="post">
            <table>
                <tr>
                    <td>Nhập mật khẩu mới: </td>
                    <td>
                        <label>
                            <input type="password" name="newPass" id="newPass" onchange="change();check()">
                        </label>
                        <p style="color: red; display: none;" id="size1">Mật khẩu phải từ 6 đến 60 ký tự.</p>
                    </td>
                </tr>
                <tr>
                    <td>Nhập lại mật khẩu mới:  </td>
                    <td>
                        <label>
                            <input type="password" name="newPassAgain" id="newPassAgain" onchange="change();check()">
                        </label>
                        <p style="color: red; display: none;" id="size2">Mật khẩu phải từ 6 đến 60 ký tự.</p>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="align-items: center; color: red ; display: none " id="catch">Mật khẩu không trùng hợp</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label>
                            <input type="submit" value="Thay đổi mật khẩu">
                        </label>
                    </td>
                </tr>
            </table>
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
<script>
    function change() {
        document.getElementById("catch").style.display = "none";
        document.getElementById("size1").style.display = "none";
        document.getElementById("size2").style.display = "none";
    }

    function check1() {
        let pass = document.getElementById("newPass").value;
        if (pass.length > 0 && (pass.length < 6 || pass.length > 60)) {
            document.getElementById("size1").style.display = "block";
            return false;
        }
        return true;
    }

    function check2() {
        let pass = document.getElementById("newPassAgain").value;
        if (pass.length > 0 && (pass.length < 6 || pass.length > 60)) {
            document.getElementById("size2").style.display = "block";
            return false;
        } else {
            return true;
        }
    }

    function check3() {
        let pass = document.getElementById("newPassAgain").value;
        let passAgain = document.getElementById("newPass").value;
        console.log(pass.length);
        let check1 = pass.length >=6 && pass.length <= 60;
        let check2 = passAgain.length >=6 && passAgain.length <= 60;
        console.log(pass.length);
        if (check1 === true && check2 === true && pass !== passAgain) {
            document.getElementById("catch").style.display = "block";
        }
    }

    function check() {
        setTimeout(check1, 500);
        setTimeout(check2, 500);
        setTimeout(check3, 500);
    }

    function handleSubmit(event) {
        event.preventDefault();
        check();
        let pass = document.getElementById("newPass").value;
        let pass1 = document.getElementById("newPassAgain").value;
        if (pass.length >= 6 && pass.length <= 60 && pass === pass1) {
            event.target.submit();
        }
    }

    let myForm = document.getElementById("myForm");

    myForm.addEventListener("submit", handleSubmit);
</script>
</html>

