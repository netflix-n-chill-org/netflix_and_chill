<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/12/2023
  Time: 5:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Netflix - Thế giới giải trí trong tầm tay bạn</title>
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
            background-size: cover;
            background: linear-gradient(to top, rgba(0, 0, 0, 0.8) 0, rgba(0, 0, 0, 0) 60%, rgba(0, 0, 0, 0.8) 100%), url(../img/banner.jpg) center;
            opacity: 0.6;
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

        .header .navbar .right .language {
            font-size: 18px;
            padding: 6px 20px;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            background: none;
            margin-right: 15px;
        }

        .header .navbar .right .language option {
            background-color: #a09f9f;
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

        .header-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            margin-top: 70px;
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

        .email {
            background-color: #fff;
            border-radius: 4px;
            display: flex;
            align-items: center;
            margin-top: 30px;
            overflow: hidden;
        }

        .email input {
            flex: 1;
            border: 0;
            outline: 0;
            margin: 10px;
            background: none;

        }

        .email button {
            background-color: #e50914;
            border: 0;
            bottom: 0;
            font-size: 15px;
            cursor: pointer;
            padding: 15px 30px;
        }

        .content {
            font-size: 22px;
            margin-top: 650px;
            border-top: 8px solid #383737;
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
        .row1{
                display: flex;
                width: 100%;
                align-items: center;
                flex-wrap: wrap;
                padding: 50px;
                margin-bottom: 20px;
        }
        .row2{
            display: flex;
            width: 100%;
            align-items: center;
            flex-wrap: wrap;
            padding: 50px;
            margin-bottom: 20px;
            border-top: 8px solid #383737;
        }
        .row3{
            display: flex;
            width: 100%;
            align-items: center;
            flex-wrap: wrap;
            padding: 50px;
            border-top: 8px solid #383737;
            margin-bottom: 20px;
        }
        .text-column {
            flex-basis: 50%;
            margin-bottom: 20px;
        }

        .img-column {
            flex-basis: 50%;
            margin-bottom: 20px;
        }

        .img-column img {
            display: block;
            width: 90%;
            margin: auto;
        }

        .select h1 {
            font-size: 40px;
            font-weight: 600;
            margin-bottom: 20px;
        }
        .faq {
            padding: 10px 12%;
            text-align: center;
            font-size: 18px;
            border-bottom: 8px solid #383737;
            border-top: 8px solid #383737;
        }

        .faq h2 {
            font-size: 40px;
            font-weight: 500;
        }

        .accordion {
            margin: 60px auto;
            width: 100%;
            max-width: 800px;
        }

        .accordion li {
            list-style: none;
            width: 100%;
            padding: 5px;

        }

        .accordion li label {
            display: flex;
            align-items: center;
            padding: 20px;
            font-size: 18px;
            font-weight: 500;
            background-color: #303030;
            margin-bottom: 2px;
            position: relative;
            cursor: pointer;
        }
        .accordion label::after{
            content: '+';
            font-size:35px ;
            position: absolute;
            right: 20px;
            transition:  transform 0.5s;
        }
        input[type="radio"]{
            display: none;
        }
        .accordion .content_text{
            background-color: #303030;
            text-align: center;
            padding: 0 20px;
            max-height: 0;
            overflow: hidden;
            transition: transform 0.5s;

        }
        .accordion input[type="radio"]:checked + label + .content_text{
            max-height: 600px;
            padding: 30px 20px;
        }
        .accordion input[type="radio"]:checked+label::after {
            transform: rotate(135deg);
        }
        .faq .email{
            max-width: 600px;
            margin: 20px auto 60px;
        }
        .faq small{
            font-size: 15px;
        }

        .footer{
            padding: 60px 15% 10px;
            color:#777;
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
            color:#ffffff;
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
            color:#fff;
            padding: 10px 20px;
            border-radius:3px ;
            background:none;
            border: 1px solid white;
            margin-top: 10px;
        }
        .column p{
            margin-top: 10px;
            color:white;
        }
        .error-message {
            color: red;
            font-weight: bold;
            padding-top: 10px;
        }
    </style>
</head>
<body>
<div class="header">
    <nav class="navbar">
        <div class="left">
            <img src="../img/logo/netflix-logo.png" alt="" class="logo">
        </div>
        <div class="right">
            <select name="language" class="language">
                <option value="Vietnamese">Tiếng việt</option>
                <option value="English">English</option>
            </select>
            <button><a href="">Đăng nhập</a></button>
        </div>
    </nav>
    <div class="header-content">
        <h1>Cười. Khóc. Rùng mình. Tất cả có trên Netflix.</h1>
        <h3>Giải trí bất tận với giá chỉ từ 70.000 ₫. Hủy bất kỳ lúc nào.</h3>
        <p>Bạn đã sẵn sàng xem chưa? Nhập email để tạo hoặc kích hoạt lại tư cách thành viên của bạn.</p>
        <form class="email" action="${pageContext.request.contextPath}/validateEmail" method="post">
            <input type="email" name="email" placeholder="Địa chỉ email" required>
            <button type="submit" style="color:white">Bắt đầu ></button>
        </form>
        <c:if test="${not empty sessionScope.emailExistsMessage}">
            <div class="error-message">${sessionScope.emailExistsMessage}</div>
            <c:remove var="emailExistsMessage" scope="session" />
        </c:if>
    </div>
</div>

<div class="content">
    <div class="row">
        <div class="text-column">
            <h1>Thưởng thức trên TV của bạn</h1>
            <p>Xem trên TV thông minh, Playstation, Xbox, Chromecast, Apple TV, đầu phát Blu-ray và nhiều thiết bị
                khác.</p>
        </div>
        <div class="img-column">
            <img src="../img/feature/feature-1.png" alt="">
        </div>
    </div>
    <div class="row1">
        <div class="img-column">
            <img src="../img/feature/feature-2.png" alt="">
        </div>
        <div class="text-column">
            <h1>Tải xuống nội dung để xem ngoại tuyến</h1>
            <p>Lưu lại những nội dung yêu thích một cách dễ dàng và luôn có thứ để xem.</p>
        </div>


    </div>
    <div class="row2">
            <div class="text-column">
                <h1>Xem ở mọi nơi
                </h1>
                <p>Phát trực tuyến không giới hạn phim và chương trình truyền hình trên điện thoại, máy tính bảng, máy tính xách tay và TV.</p>
            </div>
            <div class="img-column">
                <img src="../img/feature/feature-3.png" alt="">
            </div>
    </div>
        <div class="row3">
            <div class="img-column">
                <img src="../img/feature/feature-4.png" alt="">
            </div>
            <div class="text-column">
                <h1>Tạo hồ sơ cho trẻ em</h1>
                <p>Đưa các em vào những cuộc phiêu lưu với nhân vật được yêu thích trong một không gian riêng. Tính năng này đi kèm miễn phí với tư cách thành viên của bạn.</p>
            </div>
        </div>
</div>
<div class="faq">
    <h2>Câu hỏi thường gặp</h2>
    <ul class="accordion">
        <li >
             <input type="radio" name="accordion" id="first">
        <label for="first">Netflix là gì?</label>
        <div class="content_text">
            <p>Netflix là dịch vụ phát trực tuyến mang đến đa dạng các loại chương trình truyền hình, phim, anime, phim tài liệu đoạt giải thưởng và nhiều nội dung khác trên hàng nghìn thiết bị có kết nối Internet.
                Bạn có thể xem bao nhiêu tùy thích, bất cứ lúc nào bạn muốn mà không gặp phải một quảng cáo nào – tất cả chỉ với một mức giá thấp hàng tháng. Luôn có những nội dung mới để bạn khám phá và những chương trình truyền hình, phim mới được bổ sung mỗi tuần!</p>
        </div>
        </li>
        <li >
            <input type="radio" name="accordion" id="second">
            <label for="second">Tôi phải trả bao nhiêu tiền để xem netflix</label>
            <div class="content_text">
                <p>Netflix là dịch vụ phát trực tuyến mang đến đa dạng các loại chương trình truyền hình, phim, anime, phim tài liệu đoạt giải thưởng và nhiều nội dung khác trên hàng nghìn thiết bị có kết nối Internet.
                    Bạn có thể xem bao nhiêu tùy thích, bất cứ lúc nào bạn muốn mà không gặp phải một quảng cáo nào – tất cả chỉ với một mức giá thấp hàng tháng. Luôn có những nội dung mới để bạn khám phá và những chương trình truyền hình, phim mới được bổ sung mỗi tuần!</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="thirst">
            <label for="thirst">Tôi có thể xem ở dâu?</label>
            <div class="content_text">
                <p>Xem mọi lúc, mọi nơi. Đăng nhập bằng tài khoản Netflix của bạn để xem ngay trên trang web netflix.com từ máy tính cá nhân, hoặc trên bất kỳ thiết bị nào có kết nối Internet và có cài đặt ứng dụng Netflix, bao gồm TV thông minh, điện thoại thông minh, máy tính bảng, thiết bị phát đa phương tiện trực tuyến và máy chơi game.
                    Bạn cũng có thể tải xuống các chương trình yêu thích bằng ứng dụng trên iOS, Android hoặc Windows 10. Vào phần nội dung đã tải xuống để xem trong khi di chuyển và khi không có kết nối Internet. Mang Netflix theo bạn đến mọi nơi.</p>
            </div>
        </li>
        <li> <input type="radio" name="accordion" id="fourth">
            <label for="fourth">Làm sao để hủy</label>
            <div class="content_text">
                <p>Netflix rất linh hoạt. Không có hợp đồng phiền toái, không ràng buộc. Bạn có thể dễ dàng hủy tài khoản trực tuyến chỉ trong hai cú nhấp chuột. Không mất phí hủy – bạn có thể bắt đầu hoặc ngừng tài khoản bất cứ lúc nào.</p>
            </div>
        </li>
        <li> <input type="radio" name="accordion" id="five">
            <label for="five">Tôi có thể xem gì trên netflix?</label>
            <div class="content_text">
                <p>Netflix có một thư viện phong phú gồm các phim truyện, phim tài liệu, chương trình truyền hình, anime, tác phẩm giành giải thưởng của Netflix và nhiều nội dung khác. Xem không giới hạn bất cứ lúc nào bạn muốn.</p>
            </div>
        </li>
        <li> <input type="radio" name="accordion" id="six">
            <label for="six">Netflix có phù hợp với trẻ em không?</label>
            <div class="content_text">
                <p>
                    Trải nghiệm Netflix Trẻ em có sẵn trong gói dịch vụ của bạn, trao cho phụ huynh quyền kiểm soát trong khi các em có thể thưởng thức các bộ phim và chương trình phù hợp cho gia đình tại không gian riêng.
                    Hồ sơ Trẻ em đi kèm tính năng kiểm soát của cha mẹ (được bảo vệ bằng mã PIN), cho phép bạn giới hạn độ tuổi cho nội dung con mình được phép xem, cũng như chặn những phim hoặc chương trình mà bạn không muốn các em nhìn thấy.
                </p>
            </div>
        </li>
    </ul>
    <small>Bạn đã sẵn sàng xem chưa? Nhập email để tạo hoặc kích hoạt lại tư cách thành viên của bạn.</small>
    <form class="email" action="#">
        <input type="email" name="email" placeholder="Địa chỉ email">

        <button><a href="#" style="color:#fff">Bắt đầu ></a></button>
    </form>
</div>
<div class="footer">
    <h2>Bạn có câu hỏi? Liên hệ với chúng tôi.</h2>
    <div class="row">
        <div class="column">
            <a href="#">Câu hỏi thường gặp</a>
            <a href="#">Quan hệ với nhà đầu tư</a>
            <a href="#">Quyền riêng tư</a>
            <a href="#">Kiểm tra tốc độ</a>
            <select name="language" class="language">
                <option value="Vietnamese">Tiếng việt</option>
                <option value="English">English</option>
            </select>
            <p>Netflix Việt Nam</p>

        </div>
        <div class="column">
            <a href="#">Trung tâm trợ giúp</a>
            <a href="#">Việc làm</a>
            <a href="#">Tùy chọn cookie</a>
            <a href="#">Thông báo pháp lý</a>

        </div>
        <div class="column">
            <a href="#">Tài khoản</a>
            <a href="#">Các cách xem</a>
            <a href="#">Thông tin doanh nghiệp</a>
            <a href="#">Chỉ có trên netflix</a>

        </div>
        <div class="column">
            <a href="#">Trung tâm đa phương tiện</a>
            <a href="#">Quan hệ với nhà đầu tư</a>
            <a href="#">Điều khoản sử dung</a>
            <a href="#">Liên hệ với chúng tôi</a>

        </div>
    </div>
</div>
<script>
    document.querySelectorAll('.accordion li label').forEach(label => {
        label.addEventListener('click', function(e) {
            let input = document.getElementById(this.getAttribute('for'));
            if(input.checked) {
                e.preventDefault();
                input.checked = false;
            }
        });
    });
</script>
</body>
</html>
