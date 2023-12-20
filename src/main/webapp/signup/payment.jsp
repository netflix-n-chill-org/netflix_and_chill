<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/19/2023
  Time: 8:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cổng thanh toán momo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        .header {
            background-color: #fff;
            padding: 10px 80px;
            color: #000000;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
        }
        .header img {
            margin-right: 10px;
        }
        .container {
            width: 66%;
            margin: 20px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.8);
        }
        .logo {
            width: 50px;
        }
        .logo-netflix {
            width: 50px;
            border: 1px solid #e6e6e6;
        }
        .qr {
            width: 200px;
            margin: 20px 0;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        .expiry {
            background-color: #FAD7A0;
            padding: 10px;
            margin: 20px 0;
        }
        .button {
            background-color: #FFC0CB;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            border: none;
        }
        .footer {
            background-color: #727272;
            padding: 30px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
        }
        .footer p {
            margin: 0;
        }
        .footer .support {
            display: flex;
            flex-direction: column;
        }

    </style>
    <script>
        function submitFormWithDelay() {
            document.getElementById("paymentForm").submit();
            setTimeout(function () {
                window.location.href = "/browse";
            }, 3000);
        }
    </script>
</head>
<body>
<div class="background-container"></div>
<div class="header">
    <img class="logo" src="../img/logo_momo.png" alt="logo">

    <p>Cổng thanh toán MoMo</p>
</div>
<div class="container">
    <img class="logo-netflix" src="../img/netflix_.png" alt="Logo 2">
    <img class="logo" src="../img/icon-link.svg" alt="Logo 3" sizes="10px">
    <img class="logo" src="../img/logo_momo.png" alt="Logo 1">

    <h2>Quét mã QR để liên kết với Netflix</h2>
    <p>Sử dụng App Momo hoặc ứng dụng camera để hỗ trợ QR Code để quét mã</p>
    <img class="qr" src="../img/qr_code.jpg" alt="QR Code">
    <div class="expiry">
        <p>Đơn hàng sẽ hết hạn sau: 07:03</p>
    </div>
    <form id="paymentForm" action="/momo" method="post">
        <input type="submit" value="Thanh toán" style="display: none;">
    </form>
    <p>Gặp khó khăn khi thanh toán? Xem Hướng dẫn</p>
    <a href="#" class="button">Quay về</a>
</div>
<div class="footer">
    <p>© 2023 - Cổng thanh toán MoMo</p>
    <div class="support">
        <p>Hỗ trợ khách hàng: 1900 54 54 41 (1000đ/phút)</p>
        <br>
        <p>hotro@momo.vn</p>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        submitFormWithDelay();
    });
</script>
</body>
</html>