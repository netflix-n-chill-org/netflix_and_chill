<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .header {
            background-color: #000;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            color: #fff;
            margin-left: 100px;
        }

        .options {
            display: flex;
            margin-right: 20px;
        }

        .option {
            color: #fff;
            font-size: 18px;
            margin-left: 10px;
        }

        .banner {
            margin-top: -20px;
            height: 600px;
            background-size: cover;
            position: relative;
            background-image: linear-gradient(to top, rgba(0, 0, 0, 0.8) 0, rgba(0, 0, 0, 0) 60%, rgba(0, 0, 0, 0.8) 100%);
        }
    .img_banner{
        height: 600px;
        width:1500px;
        background-size: cover;
        position: absolute;
        z-index: -100;
    }
        .text {
            color: #fff;
            font-size: 48px;
            font-weight: bold;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        .info {
            position: absolute;
            transform: translate(-50%, -50%);
            top:60%;
            left:60%;
            color: #fff;
            font-size: 24px;
            margin-top: 20px;
        }

        .email {
            width: 300px;
            height: 40px;
            border: none;
            outline: none;
            padding: 10px;
            font-size: 18px;
        }

        .button {
            width: 100px;
            height: 40px;
            border: none;
            outline: none;
            background-color: #e50914;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            margin-left: 10px;
            cursor: pointer;
        }
        .select{
            display: flex;
            flex-direction: row;
            background-color: #000000;
            z-index: -1;
            height: 300px;
            padding:20px;
            align-items: center;
        }
        .text_left {
            display: flex;
            flex-direction: column;
            width: 500px;
            color: white;
            margin-left: 300px;
            font-family: Netflix Sans, Helvetica Neue, Segoe UI, Roboto, Ubuntu, sans-serif;
        }
        .img_right{
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 100px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="logo">
    <img src="img/logo/netflix-logo.png" width="120px" height="80px">
    </div>
    <div class="options">
        <div class="option">Tiếng Việt</div>
        <div class="option">Đăng nhập</div>
    </div>
</div>
<div class="banner">
    <img class="img_banner" src="img/banner.jpg" width="1200px" height="500px">
    <div class="text">Cười. Khóc. Rùng mình. Tất cả có trên Netflix.</div>
    <div class="info">Giải trí bất tận với giá chỉ từ 70,000 đ. Hủy bất kỳ lúc nào.</div> <br>
    <div class="info">Bạn đã sẵn sàng xem chưa? Nhập email để tạo hoặc kích hoạt lại tài khoản của bạn.</div>
    <div class="info">
        <input type="email" class="email" placeholder="Email">
        <button class="button">Bắt đầu</button>
    </div>
</div>
<div class="content">
    <div class="text_left">
        <h1 style="font-size: 45px;">Thưởng thức trên TV của bạn.</h1>
        <h3>Xem trên TV thông minh, Playstation, Xbox, Chromecast, Apple TV, đầu phát Blu-ray và nhiều thiết bị khác.</h3>
    </div>
    <div class="img_right">
        <img src="img/tv.png" width="434" height="280">
        <div class="img_size">
            <video width="320" height="240" controls>
                <source src="img/truc_tuyen_1.m4v" type="video/m4v">
                Your browser does not support the video tag.
            </video>
        </div>
    </div>
</div>

<div>
    <h1>Câu hỏi thường gặp</h1>
    <h3>Netflix là dịch vụ phát trực tuyến mang đến đa dạng các loại chương trình truyền hình, phim, anime, phim tài liệu đoạt giải thưởng và nhiều nội dung khác trên hàng nghìn thiết bị có kết nối Internet.
    </h3>
    <h3>Bạn có thể xem bao nhiêu tùy thích, bất cứ lúc nào bạn muốn mà không gặp phải một quảng cáo nào – tất cả chỉ với một mức giá thấp hàng tháng. Luôn có những nội dung mới để bạn khám phá và những chương trình truyền hình, phim mới được bổ sung mỗi tuần!</h3>

    <h3>Tôi phải trả bạn bao nhiêu tiền để xem netflix</h3>
    <h3>
        Xem Netflix trên điện thoại thông minh, máy tính bảng, TV thông minh, máy tính xách tay hoặc thiết bị phát trực tuyến, chỉ với một khoản phí cố định hàng tháng. Các gói dịch vụ với mức giá từ 70.000 ₫ đến 260.000 ₫ mỗi tháng. Không phụ phí, không hợp đồng.
    </h3>
    <h3>
        Tôi có thể xem ở đâu?
    </h3>
    <h3>
        Xem mọi lúc, mọi nơi. Đăng nhập bằng tài khoản Netflix của bạn để xem ngay trên trang web netflix.com từ máy tính cá nhân, hoặc trên bất kỳ thiết bị nào có kết nối Internet và có cài đặt ứng dụng Netflix, bao gồm TV thông minh, điện thoại thông minh, máy tính bảng, thiết bị phát đa phương tiện trực tuyến và máy chơi game.
    </h3>
    <h3>
        Bạn cũng có thể tải xuống các chương trình yêu thích bằng ứng dụng trên iOS, Android hoặc Windows 10. Vào phần nội dung đã tải xuống để xem trong khi di chuyển và khi không có kết nối Internet. Mang Netflix theo bạn đến mọi nơi.
    </h3>
     <h3>Làm thế nào để hủy?</h3>
    <h3>Netflix rất linh hoạt. Không có hợp đồng phiền toái, không ràng buộc. Bạn có thể dễ dàng hủy tài khoản trực tuyến chỉ trong hai cú nhấp chuột. Không mất phí hủy – bạn có thể bắt đầu hoặc ngừng tài khoản bất cứ lúc nào.
    </h3>
    
</div>
</body>
</html>
